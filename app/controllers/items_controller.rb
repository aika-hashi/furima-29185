class ItemsController < ApplicationController

  def index
  
    
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
    #@image = item.image
    #@title = item.title
   # @price = item.price
  #end

  private

  def item_params
    params.require(:item).permit(:image,:title,:text,:category_id, :condition_id, :charge_id, :area_id, :day_id, :price, :fee, :profit).merge(user_id: current_user.id)
  end

end
