FactoryGirl.define do
  factory :comment do
    message "MyText"

    factory :valid_comment do
      post { create(:post) }
      user { create(:user) }
    end

    factory :invalid_comment

  end
end
