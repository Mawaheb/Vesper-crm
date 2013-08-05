class Meeting
  include Mongoid::Document
  include Mongoid::MultiParameterAttributes
  belongs_to :client
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :sales_reps
  #has_many :follow_ups

  DURATION = { :"00:15" => 15, :"00:30"=> 30, :"00:45"=> 45, :"01:00" =>60, :"01:15" =>75,
                       :"01:30" =>90, :"01:45"=>105, :"02:00" =>120, :"02:15"=>135,
                       :"02:30" =>150, :"02:45" =>165, :"03:00"=>180 }

  field :memo,                 type: String
  field :sd,  as: :start_date, type: DateTime
  field :du,  as: :duration,   type: Integer  , default: DURATION[:"00:30"]

#TODO:
  # Fix the Duration field, one suggestion is to store the HH MM in a Separated string fields, and list
  # them as a drop down, so the user can set the Duration this way .

  # check if the time should be UTC/Local
  # prevent user from selecting date in the past or allow this, and consider it
  # as archving ?

  # may be add a meeting objective?
  # Add a method to give a note on Meeting time.
end
