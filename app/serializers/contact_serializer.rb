class ContactSerializer < ActiveModel::Serializer
  # has_one  :client #https://github.com/rails-api/active_model_serializers/tree/0-9-2#associations
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
