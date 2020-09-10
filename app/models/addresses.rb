class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :order
  belongs_to_active_hash :area
  
  with_options presence: true do
  validates :addressnum ,:number,:cvc,:exp_month,:exp_year,:area,:city ,:housenum  ,:phonenum,presence: true
  validates :addressnum, format: { with: /\A^\d{3}-\d{4}$/, message: "is invalid. Input full-width characters."}
  validates :phonenum, format: { with: /\A^0\d{9,10}$/, message: "is invalid. Input full-width characters."}
  end
end
