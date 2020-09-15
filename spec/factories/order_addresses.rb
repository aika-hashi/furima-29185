FactoryBot.define do
  factory :order_address do
    addressnum                  {"123-4567"}
    area_id                     {"2"}
    city                        {Faker::Lorem.sentence}
    housenum                    {"青山1-1-1"}
    phonenum                    {"12345678910"}
    token                       {"sampletoken"}
  end
end
