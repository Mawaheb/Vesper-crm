FactoryGirl.define do
  factory :client do |c|
    first_name 'John'
    last_name 'Smith'
    company_name 'ACompany'
    sex 1
  end

  factory :contact do
    sequence(:phone)    { |n| "111222333#{n}" }
    sequence(:email)    { |n| "User_#{n}@example.com" }
    sequence(:address)  { |n| "Buidling #{n}"}

    client
  end
end