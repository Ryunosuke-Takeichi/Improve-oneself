class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :body, presence: true, length: {maximum: 150, minimum: 1}, uniqueness: true
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    search ? where('body LIKE ?', "%#{search}%") : all
  end
end
