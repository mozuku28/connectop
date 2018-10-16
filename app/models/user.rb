class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: { どちらでもない: 0, 男: 1, 女: 2 }

  attachment :image
  has_many :posts
  has_many :follows
  has_many :followers
  has_many :menus
  has_many :loads

end
