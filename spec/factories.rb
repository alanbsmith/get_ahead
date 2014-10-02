FactoryGirl.define do
  factory :program do
    facility_name   "Catholic Charities"
    street_address1 "4045 N Pecos St"
    street_address2 nil
    city            "Denver"
    state           "CO"
    zipcode         "80211"
    phone           "303-742-0828"
    program_type    "Administrative Offices"
    enrollment      10
  end
end
