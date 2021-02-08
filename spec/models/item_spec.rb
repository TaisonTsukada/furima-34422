require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '全ての情報が正しく記述されていたら出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品がが無いと出品できない' do
      it '商品画像が無いと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it '商品名が無いと出品できない' do
        @item.title = ""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Title can't be blank")
      end
      it '商品説明が無いと出品できない' do
        @item.description =""
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description can't be blank")
      end
      it '商品カテゴリーを選択しないと出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end
      it '商品の状態を選択しないと出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition must be other than 1")
      end
      it '配送料の負担を選択しないと出品できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery fee must be other than 1")
      end
      it '発送元の地域を選択しないと出品できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Area must be other than 1")
      end
      it '発送までの日数を選択しないと出品できない' do
        @item.delivery_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Delivery days must be other than 1")
      end
      it '販売価格が半角英数字以外だったら出品できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it '販売価格が300円未満だったら出品できない' do
        @item.price = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が9999999円以上だったら出品できない' do
        @item.price = '10000000'
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
