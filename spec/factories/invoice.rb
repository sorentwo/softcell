Factory.sequence :invoice_number do |n|
  n
end

Factory.define :invoice do |invoice|
  invoice.number { Factory.next :invoice_number }
  invoice.title  'Widget Creation'
  invoice.net_id 1
  invoice.association :client
end
