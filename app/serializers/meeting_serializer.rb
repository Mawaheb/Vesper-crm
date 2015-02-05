class MeetingSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_one  :client
  has_many :contacts
  has_many :sales_reps
  # has_many :follow_ups

  attributes :id,
             :memo,
             :duration,
             :start_date
end