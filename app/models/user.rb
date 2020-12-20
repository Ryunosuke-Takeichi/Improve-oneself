class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  has_many :weight_records
  has_many :events
  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :following_relationships, foreign_key: "follower_id", class_name: "FollowRelationship",  dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end
  
  def follow(user)
    following_relationships.create!(following_id: user.id)
  end
  
  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end
  def bmi          
    weight / ( height / 100 ) ** 2   
  end
  
end
