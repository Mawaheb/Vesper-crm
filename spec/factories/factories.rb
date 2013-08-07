FactoryGirl.define do
  factory :client do |c|
    name 'Acompany'
    phone '1112223330'
    status :not_contacted
  end



  factory :meeting do
    memo 'This is a Memo'

    client
  end
end