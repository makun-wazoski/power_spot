class Comment < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 300 }
end
