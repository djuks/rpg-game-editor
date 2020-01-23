class Comment < ApplicationRecord
  validates :description, presence: true, length: { minimum: 1, maximum: 100 }
  belongs_to :user
  belongs_to :character
  validates :user_id, presence: true
  validates :character_id, presence: true
  default_scope -> { order(updated_at: :desc)}
end
