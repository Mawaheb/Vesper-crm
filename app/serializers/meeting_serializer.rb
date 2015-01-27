class MeetingSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_many :contacts
  has_many :sales_reps

  attributes :id,
             :memo,
             :duration,
             :start_date
end