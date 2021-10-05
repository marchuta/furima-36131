require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品できる場合' do
      it '必要事項を記入していれば、出品ができる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it '商品の画像がなければ、出品できない' do
        @item.image = nil

        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end

      it '商品名がなければ、出品できない' do
        @item.name = ''
        @item.valid?

        expect(@item.errors.full_messages).to include('商品名を入力してください')
      end

      it '商品の説明がなければ、出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品説明を入力してください')
      end

      it 'カテゴリが指定されていなければ、出品できない' do
        @item.category_id = '1'

        @item.valid?
        expect(@item.errors.full_messages).to include("Categorycan't be blank")
      end

      it '商品の状態を記載されていなければ、出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Conditioncan't be blank")
      end

      it '配送料の負担が記載されていなければ、出品できない' do
        @item.carriage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Carriagecan't be blank")
      end

      it '発送元の地域の情報がなければ、出品できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Regioncan't be blank")
      end

      it '発送までの日数が記載されていなければ、出品できない' do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Daycan't be blank")
      end

      it '価格の情報がなければ、出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end

      it '価格が300円未満の場合は、出品できない' do
        @item.price = '299'

        @item.valid?

        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end

      it '価格に半角数字以外が含まれている場合、出品できない' do
        @item.price = '444a'

        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it '価格が9_999_999円を超えると出品できない' do
        @item.price = '99999991'

        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end

      it 'ログインしたユーザーの情報がなければ、出品できない' do
        @item.user = nil

        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
