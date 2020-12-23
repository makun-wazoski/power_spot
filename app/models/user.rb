class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  with_options presence: true do
    validates :nickname, length: { maximum: 20 }
    validates :email, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, on: :create, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  end
  validates :favorite_spot, presence: false, length: { maximum: 200 }
  validates :introduction, presence: false, length: { maximum: 1000 }
  
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
end
