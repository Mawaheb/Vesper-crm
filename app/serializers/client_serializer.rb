class ClientSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_many :contacts
  
  attributes :id, :name
end
