class Cocktail < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true
  # associations
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  # photo
  has_one_attached :photo
end
