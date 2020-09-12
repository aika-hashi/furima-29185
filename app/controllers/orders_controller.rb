class OrdersController < ApplicationController
  before_action :authenticate_user!
 # before_action :move_to_index, except: :new,:create
  
  def index
    @order = OrderAddress.new
    # item = Item.new(item_params)
    # items = item.save
    @item = Item.find(params[:item_id])
 
    if @item.user_id == current_user.id || @item.order !=nil
   redirect_to root_path
   end


  end

  def new
    @order = OrderAddress.new
  end
  
  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @price = @item.price
    @order = OrderAddress.new(order_params)
#binding.pry
     if @order.valid? 
        pay_item
       @order.save 
       return redirect_to root_path
    else
      render "index"
    end
  end

  private

  # def item_params
  #   params.require(:item).permit(:image,:title,:text,:category_id, :condition_id, :charge_id, :area_id, :day_id, :price, :fee, :profit).merge(user_id: current_user.id)
  # end
  def order_params
    params.require(:order_address).permit(:token,:addressnum ,:area_id ,:city ,:housenum , :building ,:phonenum ).merge( user_id:current_user.id, item_id:params[:item_id])
  end


  #  def orders_params
  #  params.permit( :token) #カードのパラメーター
  # end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @price ,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

 

  
  
  #  def move_to_index
  #   if @item.user_id = current_user.id
  #      redirect_to root_path
  #   end
  # end
end
