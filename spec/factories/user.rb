FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@test.com"
    end
    password "test12"
  end
end
