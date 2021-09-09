require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できる場合' do 

     it '必要な事項を全て記入していれば新規登録できる。' do
      expect(@user).to be_valid
      end

    end

   context '新規登録できない場合' do

    it 'ニックネームがなければ、新規登録できないこと' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank" )
    end

    it 'emailアドレスがなければ、新規登録できないこと'do
     @user.email = ''
     @user.valid?
     expect(@user.errors.full_messages).to include("Email can't be blank" )
    end

    it '重複したemailが存在する場合、新規登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailアドレスに@が含まれていなければ、新規登録できないこと' do
      @user.email = 'aaaaaa.com'
      
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid" )
    end

    it 'passwordがなければ、新規登録できないこと' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが５文字以下であれば、新規登録できないこと'do
     @user.password = 'aaaaa'
     @user.password_confirmation = @user.password
     @user.valid?
     expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが半角英数字の混合でなければ、新規登録できないこと'do
    @user.password = 'ああああああ'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it 'passwordとpassword_conformationが一致していなければ、新規登録できないこと' do
     @user.password = '111aaa'
     @user.password_confirmation = '111aab'
     @user.valid?
     expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end



    it 'お名前(全角)の名字名前がそれぞれなければ、新規登録できないこと' do
      @user.last_name_kanji = ''
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank","First name kanji can't be blank")
    end

    it 'お名前(全角)が全角(漢字、カタカナ、ひらがな)でなければ、新規登録できないこと' do
      @user.last_name_kanji = '111aaa'
      @user.first_name_kanji = '111aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji 全角文字を使用してください","First name kanji 全角文字を使用してください")
    end

    it 'お名前カナ(全角)の名字名前がなければ、新規登録できないこと' do
      @user.last_name_katakana = ''
      @user.first_name_katakana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name katakana can't be blank","First name katakana can't be blank")
    end

    it 'お名前カナ(全角)が全角(カタカナ)でなければ、新規登録できないこと' do
      @user.last_name_kanji = '嗚呼aaa'
      @user.first_name_kanji = '嗚呼aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji 全角文字を使用してください", "First name kanji 全角文字を使用してください")
    
    end

    it 'birthdayが入力されていなければ、新規登録できないこと' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end


    end
   
  end
end

