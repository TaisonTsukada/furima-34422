FactoryBot.define do
  factory :purchase_address do
    postal_code {'123-4567'}
    area_id {2}
    city {'東京都'}
    house_number {'7-8'}
    building {'東京ビル'}
    phone_number {"09000000000"}
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end
