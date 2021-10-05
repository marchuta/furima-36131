require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '購入できる場合' do
      it '必要事項を記入していれば、購入できる' do
        expect(@order_address).to be_valid
      end

      it '建物名は記入していなくも、購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入できない場合' do
      it '郵便番号がなければ、購入できない' do
        @order_address.post_code = ''
        
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post codeを入力してください')
      end

      it '郵便番号にハイフンが含まれていなければ、購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post codeハイフンを入れてください')
      end

      it '配送先の情報がなければ、購入できない' do
        @order_address.region_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Regionを入力してください')
      end

      it '市町村区の情報がなければ、購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Cityを入力してください')
      end

      it '番地の情報がなければ、購入できない' do
        @order_address.block_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Block numberを入力してください')
      end

      it '電話番号がなければ、購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone numberを入力してください')
      end

      it '電話番号は10桁以上11桁以内の半角数値でなければ、購入できない' do
        @order_address.phone_number = '111-1111-1111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone numberハイフンは入れないでください')
      end

      it 'tokenがなければ、購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Tokenを入力してください')
      end

      it 'ログインしたユーザーの情報が紐づいていなければ、購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Userを入力してください')
      end

      it '購入する商品の情報が紐づいていなければ、購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Itemを入力してください')
      end
    end
  end
end
