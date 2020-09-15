require 'rails_helper'
describe OrderAddress do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "addressnum ,area,city ,housenum,phonenum ,tokenが存在すれば登録できる" do
        expect(@order).to be_valid
      end
      it "areaがid:1以外であれば登録できる" do
        @order.area_id = 2
        expect(@order).to be_valid
      end
      it "addressnumにハイフンがあれば登録できる" do
        @order.addressnum = "123-4567"
        expect(@order).to be_valid
      end
      it "phonenumが11桁以内であれば登録できる" do
        @order.phonenum = 12345678910
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "addressnumが空では登録できない" do
        @order.addressnum = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Addressnum can't be blank")
      end
      it "addresssum登録できにハイフンがなければ登録できない" do
        @order.addressnum = 1234567
        @order.valid?
        expect(@order.errors.full_messages).to include("Addressnum is invalid. Input full-width characters.")
      end
      it "areaがid:1だと登録できない" do
        @order.area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 1")
      end
      it "cityが空では登録できない" do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "housenumが空では登録できない" do
        @order.housenum = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Housenum can't be blank")
      end
     
      it "phonenumが空では登録できない" do
        @order.phonenum = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenum can't be blank")
      end
      it "phonenumが11桁より多いと登録できない" do
        @order.phonenum = 123456789101
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenum is invalid. Input full-width characters.")
      end
      it "tokenが空では登録できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    
    end
  end
end
