class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :user
   has_one :order
   belongs_to_active_hash :category
   belongs_to_active_hash :condition
   belongs_to_active_hash :area
   belongs_to_active_hash :day
   belongs_to_active_hash :charge
   has_many_attached :images

   
   with_options presence: true do
    validates :images,:title, :text, :category, :condition, :charge, :area, :day, presence: true
    validates :price, format: { with: /\A[0-9]+\z/, message: "is invalid. Input full-width characters."}
    validates :price,
    numericality: {
     greater_than_or_equal_to: 300,
     less_than: 9999999
   }
   validates :category_id, numericality: { other_than: 1 }
   validates :condition_id, numericality: { other_than: 1 }
   validates :charge_id, numericality: { other_than: 1 }
   validates :area_id, numericality: { other_than: 1 }
   validates :day_id, numericality: { other_than: 1 }
   end

end
