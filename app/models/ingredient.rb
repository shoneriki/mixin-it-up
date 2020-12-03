class Ingredient < ApplicationRecord
  # validation
  validates :name, presence: true, uniqueness: true
  # association
  has_many :doses
  # photo
  # has_one_attached :photo

end
