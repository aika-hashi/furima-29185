class OrdersController < ApplicationController
  before_action :authenticate_user!
 # before_action :move_to_index, except: :new,:create
  
  def index
    @order = OrderAddress.new
    # item = Item.new(item_params)
    # items = item.save
    @item = Item.find(params[:item_id])
 
    if @item.user_id == current_user.id
   redirect_to root_path
   end
  
  end

  def new
    @order = OrderAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @orders = OrderAddress.new(orders_params) #カードのパラメーター
    @price =  @item.price
    @order = OrderAddress.new(order_params)
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
  def orders_params
    params.permit(:@price, :token) #カードのパラメーター
  end

  def pay_item
    Payjp.api_key = # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: orders_params[:@price],  # 商品の値段
      card: orders_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def order_params
    params.require(:order_address).permit(:addressnum ,:area_id ,:city ,:housenum , :building ,:phonenum ).merge( item_id:params[:item_id])
  end

  
  
  #  def move_to_index
  #   if @item.user_id = current_user.id
  #      redirect_to root_path
  #   end
  # end
end
