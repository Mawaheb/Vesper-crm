class SalesRepSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id,
             :first_name,
             :last_name,
             :title,
             :phone_num,
             :email,
             :sex
end