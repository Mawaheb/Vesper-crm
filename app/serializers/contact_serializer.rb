class ContactSerializer < ActiveModel::Serializer
  attributes  :id,
              :first_name,
              :last_name,
              :title,
              :phone_num ,
              :email
  def name
    "#{object.first_name} #{object.last_name}"
  end
end
