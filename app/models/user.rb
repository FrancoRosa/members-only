class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts

  validates :name, presence: true, length: { in: 3..16 }
  validates :member_status, presence: true, length: { in: 3..16 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
