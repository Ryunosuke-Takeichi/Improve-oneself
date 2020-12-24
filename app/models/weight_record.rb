class WeightRecord < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :weight, presence: true
  validates :date, presence: true
end
