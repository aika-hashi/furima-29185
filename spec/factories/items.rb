FactoryBot.define do
  factory :item do
    image {Faker::Lorem.sentence}
    title {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}
    category_id {"2"}
    condition_id {"2"}
    charge_id{"2"}
    area_id{"2"}
    day_id{"2"}
    price{"2000"}
    association :user   
  end
end
