class SalesRepSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_many :follow_ups
  attributes :id,
             :first_name,
             :last_name,
             :title,
             :phone_num,
             :email,
             :sex
end