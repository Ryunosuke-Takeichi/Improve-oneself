class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :weight_record
  has_many :tweets
  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  #自分がフォローしているユーザーとの関係⬆️
  
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  #自分がフォローされるユーザーとの関係⬆️
  
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
  
  def bmi          
    weight / ( height / 100 ) ** 2   
  end
  
end
