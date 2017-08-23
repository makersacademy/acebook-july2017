FactoryGirl.define do

  factory :post do
    user { create(:user)}
    sequence :message do |n|
      "Post number #{n}"
    end
  end
end
