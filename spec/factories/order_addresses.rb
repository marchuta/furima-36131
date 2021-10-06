FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    region_id { Faker::Number.between(from: 2, to: 48) }
    city { '兵庫県' }
    block_number { '1-1-1' }
    building { '林ハイツ' }
    phone_number { '1111111111' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
