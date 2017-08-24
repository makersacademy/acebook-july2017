FactoryGirl.define do
  factory :album do
    user { create(:user) }
    name 'Makers'
  end
end
