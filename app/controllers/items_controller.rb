class ItemsController < ApplicationController
  before_action :authenticate_user!,only:[:new,:edit,:destroy]

  def index

  end

  def new
    @item = Item.new
  end

  def  create

    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name,:description,:category_id,:condition_id,:carriage_id,:region_id,:day_id,:price,:image).merge(user_id: current_user.id)
  end

end

