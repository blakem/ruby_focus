Factory.define :person do |p|
  p.first_name    "Joe"
  p.last_name     "Smith"
end

Factory.define :address do |a|
  a.city     "San Francisco"
  a.zip      "94107"
  a.street   "124 Main St"
  a.association :person
end

Factory.define :message do |m|
  m.subject        "This is a message"
  m.association    :recipient, :factory => :person
  m.association    :sender,    :factory => :person
end