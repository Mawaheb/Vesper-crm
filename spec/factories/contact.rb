FactoryGirl.define do
  factory :contact do
    first_name 'John'
    last_name 'Smith'
    email 'JS@example.com'
    phone_num '111222111222'

    client
  end
end