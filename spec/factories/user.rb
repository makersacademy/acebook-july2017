FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@test.com"
    end
    password "test12"
    first_name "bob"
    last_name "bobby"
    date_of_birth Time.now
  end
end
