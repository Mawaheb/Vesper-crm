class FollowUpSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_one :meeting
  has_one :sales_rep
  
  attributes  :id,
              :type,
              :memo,
              :done,
              :status,
              :due_date,
              :complete_date
end