class Character < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  acts_as_votable
  belongs_to :user
  has_one_attached :image
  has_many :abilities, dependent: :destroy
  has_many :comments, dependent: :destroy

end
