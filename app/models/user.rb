class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# === 論理削除 ===
  def soft_delete
    update(deleted_at: Time.now)
  end

  def active_for_authentication?
    !deleted_at
  end

  def inactive_message
    !deleted_at ? super : :deleted_account
  end
# ======


# === enum_help ===
  enum status: { どちらでもない: 0, 男: 1, 女: 2 }
# ======


  attachment :image
  has_many :posts
  has_many :follows
  has_many :followers
  has_many :menus
  has_many :loads

  

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

  has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end


end
