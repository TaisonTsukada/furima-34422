FactoryBot.define do
  factory :item do
    title {Faker::Lorem.sentence}
    description {Faker::Lorem.sentence}
    price {"3000"}
    category_id {'2'}
    condition_id {'3'}
    delivery_fee_id {'2'}
    area_id {'6'}
    delivery_days_id {'3'}
    association :user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
