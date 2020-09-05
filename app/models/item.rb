class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :user
   has_one :item_buyer
   belongs_to_active_hash :category
   belongs_to_active_hash :condition
   belongs_to_active_hash :area
   belongs_to_active_hash :day

   validates :title, :text, :category, :condition, :charge, :area, :day, presence: true

   validates :category_id, numericality: { other_than: 1 }
   validates :condition_id, numericality: { other_than: 1 }
   validates :charge_id, numericality: { other_than: 1 }
   validates :area_id, numericality: { other_than: 1 }
   validates :day_id, numericality: { other_than: 1 }
  
   with_options presence: true do
    validates :price, format: { with: /^[0-9]+$/, message: "is invalid. Input full-width characters."}
    validates :price, format: { with: between:300,9999999 , message: "is invalid. Input full-width characters."}
   end

end
