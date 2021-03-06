class Meeting
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes

  

  belongs_to :client
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :sales_reps
  has_many :follow_ups, dependent: :restrict

  accepts_nested_attributes_for :follow_ups, reject_if: :all_blank , allow_destroy: true
  # reject_if: :all_blank, when used, the follow_up fields are deleted when empty,
  # and can't dynamically add more .

  validates_presence_of :client_id
  validates_presence_of :sales_rep_ids
  # may be validates the presence of contacts?
  # or the user might intintially leave it blank to decide later?

  DURATION = { "00:15" => 15, "00:30"=> 30, "00:45"=> 45, "01:00" =>60, "01:15" =>75,
                       "01:30" =>90, "01:45"=>105, "02:00" =>120, "02:15"=>135,
                       "02:30" =>150, "02:45" =>165, "03:00"=>180 }

  field :memo,                 type: String
  field :sd,  as: :start_date, type: DateTime
  field :du,  as: :duration,   type: Integer  , default: DURATION["00:30"]

  before_destroy :check_followups

  protected

  def check_followups
    if self.follow_ups.any?
      errors.add(:base,"This meeting has followUps and cannot be destroyed.")
      return false
    end
  end
    
   # attr_accessible :memo, :start_date, :duration, :follow_ups_attributes, :contacts_attributes, :sales_reps_attributes,
                   # :client_id

#TODO:
  # Fix the Duration field, one suggestion is to store the HH MM in a Separated string fields, and list
  # them as a drop down, so the user can set the Duration this way .

  # check if the time should be UTC/Local
  # prevent user from selecting date in the past or allow this, and consider it
  # as archving ?

  # may be add a meeting objective?
  # Add a method to give a note on Meeting time.
  # Should the Meeting/FollowUp dependency be :Delete? i think no!
end
