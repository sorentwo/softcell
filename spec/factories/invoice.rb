FactoryGirl.define do
  sequence(:invoice_number) { |n| n }

  factory :invoice do
    number { FactoryGirl.next :invoice_number }
    title  'Widget Creation'
    net_id 1
    association :client
  end
end
