class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:edit]#, :destroy ]
  before_action :move_to_index, only: [:edit, :update]#, :destroy ]

  def index
    @items = Item.all.order(:created_at)
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

  def edit 
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)

    if @item.save
      redirect_to root_path
    else
      render :edit
    end

    
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :carriage_id, :region_id, :day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless current_user == @item.user
      redirect_to action: :index 
    end
  end

end
