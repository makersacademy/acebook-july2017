FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@test.com"
    end
    sequence :first_name do |n|
      "bob#{n}"
    end
    password "test12"
    last_name "bobby"
  end
end
