FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@test.com"
    end
    password "test12"
    first_name "bob"
    last_name "bobby"
  end
end
