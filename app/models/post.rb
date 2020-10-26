class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image, dependent: :destroy

  with_options presence: true do
    validates :name
    validates :image
  end
end
