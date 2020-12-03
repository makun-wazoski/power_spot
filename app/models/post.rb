class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :comments
  has_one_attached :image, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :name, length: { maximum: 20 }
    validates :image
  end

  validates :impressions, presence: false, length: { maximum: 1000 }

  def self.search(search)
    if search != ''
      Post.where('name LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
