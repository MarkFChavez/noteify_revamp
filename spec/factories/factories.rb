FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    password_confirmation { password }
  end

  factory :note do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
  end
end
