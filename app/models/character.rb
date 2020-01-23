class Character < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :abilities, dependent: :destroy
end
