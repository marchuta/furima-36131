class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :block_number, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフンを入れてください' }
    validates :region_id
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'ハイフンは入れないでください' }
    validates :order_id
    validates :user_id
    validates :item_id
  end

end