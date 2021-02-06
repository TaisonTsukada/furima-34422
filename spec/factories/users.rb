FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name { '山田' }
    first_name  { '太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_day { '2000-12-08' }
  end
end
