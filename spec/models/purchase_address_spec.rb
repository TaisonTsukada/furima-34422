require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end
    describe '商品の購入' do
      context '商品が購入できるとき' do
        it '全ての値が正しく入力されていれば保存できる' do
          expect(@purchase_address).to be_valid
        end
        it 'buildingが空でも保存できること' do
          @purchase_address.building = ""
          expect(@purchase_address).to be_valid
        end
      end
      context '商品の購入ができないとき' do
        it '郵便番号にハイフンがなかったら保存できない' do
          @purchase_address.postal_code = '0000000'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include ("Postal code is invalid. Include hyphen(-)")
        end
        it '郵便番号がなかったら保存できないこと' do
          @purchase_address.postal_code = ''
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
        end
        it '都道府県を選択しなかったら保存できないこと' do
          @purchase_address.area_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Area can't be blank")
        end
        it '市区町村を空だったら保存できないこと' do
          @purchase_address.city = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end
        it '番地が空だったら保存できないこと' do
          @purchase_address.house_number = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
        end
        it '電話番号が空だったら保存できないこと' do
          @purchase_address.phone_number = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号が11桁以上だったら保存できないこと' do
          @purchase_address.phone_number ="123456789012"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号に数値以外の物が含まれていたら保存できないこと' do
          @purchase_address.phone_number ="ai123456789"
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
        end
        it 'tokenが空では保存できないこと' do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空の場合保存できない' do
          @purchase_address.user_id = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空の場合保存できない' do
          @purchase_address.item_id = ""
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
end
