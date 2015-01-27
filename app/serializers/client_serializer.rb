class ClientSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_many :contacts
  has_many :meetings
  
  attributes :id, 
             :name,
             :phone,
             :url,
             :status
end
