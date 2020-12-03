# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'



puts "Clearing out cocktail cabinet, the police are coming"
Cocktail.destroy_all
puts "Clearing out the ingredients after the cocktails, nothing to see here"
Ingredient.destroy_all

# parsing ingredients
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
result = JSON.parse(json)

puts "ok, making ingredients?"

result["drinks"].each do |drink|
  Ingredient.create!(name: drink["strIngredient1"])
end

puts "Great! Finished creating #{Ingredient.count} ingredients!"
