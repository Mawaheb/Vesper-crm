class Meeting
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  belongs_to :client
  has_and_belongs_to_many :contacts
  accepts_nested_attributes_for :contacts
  has_many :sales_reps
  #has_many :follow_ups

  DEFAULT_DURATION = 2.hours.to_i

  field :memo,                 type: String
  field :sd,  as: :start_date, type: DateTime
  field :du,  as: :duration,   type: Integer, default: DEFAULT_DURATION

#TODO:
  # check if the time should be UTC/Local
  # prevent user from selecting date in the past or allow this, and consider it
  # as archving ?

  # may be add a meeting objective?
  # Add a method to give a note on Meeting time.
end
