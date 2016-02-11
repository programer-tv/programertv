FactoryGirl.define do
  factory :user do
    username { FFaker::Internet.user_name }
    email    { FFaker::Internet.email }
    password { FFaker::Internet.password }
    role     "regular"

    factory :admin do
      role "admin"
    end
  end
end
