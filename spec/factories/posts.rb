FactoryGirl.define do
  factory :post do |f|
    f.message "New post"
    f.user_id 1
  end
end
