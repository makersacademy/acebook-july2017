FactoryGirl.define do
  factory :album do
    user { create(:user) }
    name 'Makers'
		description 'My time at Makers'
  end
end
