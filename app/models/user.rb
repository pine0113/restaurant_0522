class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
   # 「使用者評論很多餐廳」的多對多關聯
  has_many :comments
  has_many :restaurants, through: :comments
 
  # 「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant


  # User可以跟隨很多人，如果User刪掉的話 follow關係也要被刪掉 也可以被很多人跟隨
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  def admin?
    self.role == "admin"
  end
end
