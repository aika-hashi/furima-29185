require 'rails_helper'
describe Order do
  before do
    @order = FactoryBot.build(:order)
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
      it "housesumにハイフンがあれば登録できる" do
        @order.housenum = "123-4567"
        expect(@order).to be_valid
      end
      it "phonenumが11桁以内であれば登録できる" do
        @order.phonenum = 12345678910
        expect(@order).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it "addressnumが空では登録できない" do
      end
      it "addresssum登録できにハイフンがなければ登録できない" do
      end
      it "areaがid:1だと登録できない" do
      end
      it "cityが空では登録できない" do
      end
      it "housesumが空では登録できない" do
      end
     
      it "phonenumが空では登録できない" do
      end
      it "phonenumが11桁より多いと登録できない" do
      end
      it "tokenが空では登録できない" do
      end
    end
  end
end
