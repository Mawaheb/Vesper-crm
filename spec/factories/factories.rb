FactoryGirl.define do
  factory :client do |c|
    name 'Acompany'
    phone '1112223330'
    status :not_contacted
  end

  factory :contact do
    first_name 'John'
    last_name 'Smith'
    email 'JS@example.com'
    phone_num '111222111222'

    client
  end
end