class FollowUpsSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_one :meeting
  
  attributes  :id,
              :type,
              :memo,
              :done,
              :status,
              :due_date,
              :complete_date
end