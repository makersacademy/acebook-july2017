FactoryGirl.define do
  factory :image do
    album { create(:valid_album) }
  end
end
