require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が正しく入力されていたら登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上だったら登録できる' do
        @user.password = 'A12345'
        @user.password_confirmation = 'A12345'
        expect(@user).to be_valid
      end
      it 'ユーザーの本名が全角で入力されていたら登録できる' do
        @user.first_name = '田中'
        @user.family_name = '大輔'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のフリガナがカタカナであったら登録できる' do
        @user.family_name_kana = 'タナカ'
        @user.first_name_kana = 'ダイスケ'
        expect(@user).to be_valid
      end
      it '生年月日が入力されていたら登録できる' do
        @user.birth_day = '1980-07-12'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameがないと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailがないと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordがないと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passawordがあっても、password_confirmationが入力されていないと登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'family_nameがないと登録できない' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank", 'Family name  Full-width characters'
      end
      it 'first_nameがないと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", 'First name  Full-width characters'
      end
      it 'family_name_kanaがないと登録できない' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank",
                                                      'Family name kana Full-width katakana characters'
      end
      it 'first_name_kanaがないと登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank",
                                                      'First name kana Full-width katakana characters'
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'aa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'emailが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが6文字以上でないと登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが英数混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'family_nameとfirst_nameが全角でないと登録できない' do
        @user.family_name = 'yamada'
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name  Full-width characters', 'First name  Full-width characters')
      end
      it 'family_name_kanaとfirst_name_kanaがカタカナ入力でないと登録できない' do
        @user.family_name_kana = 'やまだ'
        @user.first_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana Full-width katakana characters',
                                                      'First name kana Full-width katakana characters')
      end
    end
  end
end
