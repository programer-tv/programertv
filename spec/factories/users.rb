FactoryGirl.define do
  factory :user do
    username           { FFaker::Internet.user_name }
    email              { FFaker::Internet.email }
    password           { FFaker::Internet.password }
    role               "regular"

    created_at         Time.now
    current_sign_in_at Time.now
    last_sign_in_at    Time.now

    confirmed_at       Time.now

    factory :admin do
      role "admin"
    end
  end
end
