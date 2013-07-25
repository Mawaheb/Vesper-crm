class Meeting
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  belongs_to :client
  has_many :contacts
  #has_many :sales_reps
  #has_many :follow_ups

  DEFAULT_DURATION = 2.hours.to_i

  field :memo,                 type: String
  field :sd,  as: :start_date, type: DateTime
  field :du,  as: :duration,   type: Integer, default: DEFAULT_DURATION

#TODO:
  # check if the time should be UTC/Local
  # may be add a meeting objective?
  # Add a method to give a note on Meeting time.
end
