class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
   @items = Item.all
   
  #  @order = Order.new(order_params)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #def show
    #item = Item.find(params[:id])
    #end


  private

  def item_params
    params.require(:item).permit(:image,:title,:text,:category_id, :condition_id, :charge_id, :area_id, :day_id, :price, :fee, :profit).merge(user_id: current_user.id)
  end


  # def order_params
  #   params.require(:order).merge(:item_id,:user_id)
  # end

end
