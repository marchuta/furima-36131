class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :post_code, :region_id, :city, :block_number, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'にハイフンを入れてください' }
    validates :region_id, numericality: { other_than: 1 }
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'にハイフンは入れないでください' }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, region_id: region_id, city: city, block_number: block_number, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
