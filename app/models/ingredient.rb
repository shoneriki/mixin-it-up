class Ingredient < ApplicationRecord
  # validation
  validates :name, presence: true, uniqueness: true
  # association
  has_many :doses

end
