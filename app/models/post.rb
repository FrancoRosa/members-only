class Post < ApplicationRecord
  belongs_to :user

  validates :post, length: { in: 6..200 }
end
