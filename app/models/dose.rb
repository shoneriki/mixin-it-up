class Dose < ApplicationRecord

  # validations
  validates :description, presence: true
  validates :cocktail, uniqueness: { scope: :ingredient}
  # associations
  belongs_to :cocktail
  belongs_to :ingredient

end
