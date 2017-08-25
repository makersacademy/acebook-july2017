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
    date_of_birth "1960-08-23 23:00:00"
  end
end
