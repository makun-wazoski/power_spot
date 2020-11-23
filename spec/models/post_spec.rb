require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
    @post.image = fixture_file_upload('public/images/test_DSC_0026.jpg')
  end

  describe '投稿の保存' do
    context '投稿の保存がうまくいくとき' do
      it 'image,name,url,impressions,user_idが存在すれば保存される' do
        expect(@post).to be_valid
      end

      it 'image,name,user_idのみあれば保存される' do
        expect(@post).to be_valid
      end

      it 'nameが20文字以内であれば保存される' do
        @post.name = Faker::Name.initials(number: 20)
        expect(@post).to be_valid
      end

      it 'impressionsが1000文字以内であれば保存される' do
        @post.impressions = Faker::Lorem.characters(number: 1000)
        expect(@post).to be_valid
      end

      context '投稿の保存がうまくいかないとき' do
        it 'nameが空だと登録できない' do
          @post.name = ''
          @post.valid?
          expect(@post.errors.full_messages).to include('名前を入力してください')
        end

        it 'imageが空だと登録できない' do
          @post.image = nil
          @post.valid?
          expect(@post.errors.full_messages).to include('画像を入力してください')
        end

        it 'ユーザーが紐付いていないと投稿は保存できない' do
          @post.user = nil
          @post.valid?
          expect(@post.errors.full_messages).to include('ユーザー名を入力してください')
        end

        it 'nameが21文字以上だとだと登録できない' do
          @post.name = Faker::Name.initials(number: 21)
          @post.valid?
          expect(@post.errors.full_messages).to include('名前は20文字以内で入力してください')
        end

        it 'impressionsが1001文字以上だとだと登録できない' do
          @post.impressions = Faker::Lorem.characters(number: 1001)
          @post.valid?
          # binding.pry
          expect(@post.errors.full_messages).to include('感想は1000文字以内で入力してください')
        end
      end
    end
  end
end
