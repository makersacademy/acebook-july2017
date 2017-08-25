FactoryGirl.define do
  factory :album do
    name 'Makers'
    factory :valid_album do
      user { create(:user) }
    end
    factory :invalid_album
  end
end
