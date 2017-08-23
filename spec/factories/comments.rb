FactoryGirl.define do
  factory :comment do
    message "MyText"

    factory :valid_comment do
      post { create(:post) }
    end

    factory :invalid_comment
    
  end
end
