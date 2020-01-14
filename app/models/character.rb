class Character < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  has_one_attached :image
  has_many :abilities, dependent: :destroy
  accepts_nested_attributes_for :abilities, allow_destroy: true, reject_if: :all_blank
end
