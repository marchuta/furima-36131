class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])

    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])

    @order_address = OrderAddress.new(order_params)

    if @order_address.valid?

      pay_item

      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    params.require(:order_address).permit(:post_code, :region_id, :city, :block_number, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end
end
