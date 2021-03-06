class Ability < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :value, presence: true
  has_one_attached :picture
  belongs_to :character, optional: true
end
