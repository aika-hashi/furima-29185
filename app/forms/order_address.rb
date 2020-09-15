class OrderAddress

  include ActiveModel::Model
  attr_accessor  :addressnum ,:area_id,:city ,:housenum  ,:phonenum ,:building,:item_id,:user_id,:token
  
  with_options presence: true do
    validates :area_id,:city ,:housenum  ,:phonenum,:token, presence: true
    validates :addressnum, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Input full-width characters."}
    validates :phonenum, format: { with: /\A\d{10,11}$\z/, message: "is invalid. Input full-width characters."}
    validates :area_id, numericality: { other_than: 1 }
  end
  
   def save
    # オーダーの情報を保存し、「order」という変数に入れている
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create( addressnum: addressnum ,area_id: area_id,city: city ,housenum: housenum  ,building: building ,phonenum: phonenum,order_id: order.id)
  end
end