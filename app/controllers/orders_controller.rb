class OrdersController < ApplicationController
  before_action :authenticate_user!
 # before_action :move_to_index, except: :new,:create
  
  def index
    
    # item = Item.new(item_params)
    # items = item.save
    @item = Item.find(params[:item_id])
  #  if @item.user_id = current_user.id
  #   redirect_to root_path
  #   end
  
  end

  def new
    @order = Order.new
  end
  
  def create
    @order = Order.new(price: order_params[:price])
    if @order.create(orders_params)
      redirect_to root_path
    else
      redirect_to  item_orders_path(@item)
      
    
    end
  end

  private

  # def item_params
  #   params.require(:item).permit(:image,:title,:text,:category_id, :condition_id, :charge_id, :area_id, :day_id, :price, :fee, :profit).merge(user_id: current_user.id)
  # end

  def orders_params
    params.require(:address).permit(:addressnum ,:area_id ,:city ,:housenum , :building ,:phonenum ).merge(order_id: current_user.id, item_id:params[:tweet_id])
  end


  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
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
