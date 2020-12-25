class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :tweet_id, presence: true
end
