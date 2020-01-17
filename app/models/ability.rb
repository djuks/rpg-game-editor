class Ability < ApplicationRecord
  validates :name, presence: true
  validates :value, presence: true

  belongs_to :character, optional: true
end
