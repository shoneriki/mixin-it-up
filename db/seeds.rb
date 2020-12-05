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

Ingredient.create(name: "Olives")
Ingredient.create(name: "Ice")

puts "Great! Finished creating #{Ingredient.count} ingredients!"

# 007 Vodka Martini

puts "Creating 007 Vodka Martini cocktail..."

@jbvm = Cocktail.create!(
  name: '007 Vesper Martini',
)
file = URI.open("https://media.gq-magazine.co.uk/photos/5d13937ab363fa1e2420c91f/master/pass/image.jpg")
@jbvm.photo.attach(io: file, filename: 'jbvm.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "50 ml",
  cocktail: @jbvm,
  ingredient: Ingredient.find_by(name: "Vodka")
)

Dose.create!(
  description: "10 ml",
  cocktail: @jbvm,
  ingredient: Ingredient.find_by(name: "Dry Vermouth")
)

Dose.create!(
  description: "skewer 3 on cocktail pick",
  cocktail: @jbvm,
  ingredient: Ingredient.find_by(name: "Olives")
)

puts "finished 007 Vespar Martini"

puts "Creating Mojito"

@mojito = Cocktail.create!(
  name: 'Mojito',
)
file = URI.open("https://images.immediate.co.uk/production/volatile/sites/30/2020/08/mojito-cocktails-150961e.jpg?quality=90&webp=true&resize=430,390")
@mojito.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')

puts "Finished Mojito"

puts "Creating Salty Dog"

@salty_dog = Cocktail.create!(
  name: 'Salty Dog',
)
file = URI.open("https://www.liquor.com/thmb/1wy0FDwUvFOp9CvAXL4UaDv1Xuw=/735x0/__opt__aboutcom__coeus__resources__content_migration__liquor__2016__04__20190606__salty-dog-720x720-recipe-6498f403e1bc4159bc270ad5275e749e.jpg")
@salty_dog.photo.attach(io: file, filename: 'salty-dog.jpg', content_type: 'image/jpg')

puts "Finished Salty Dog"

puts "Creating Cosmopolitan"

@cosmopolitan= Cocktail.create!(
  name: 'Cosmopolitan',
)
file = URI.open("https://www.liquor.com/thmb/1wy0FDwUvFOp9CvAXL4UaDv1Xuw=/735x0/__opt__aboutcom__coeus__resources__content_migration__liquor__2016__04__20190606__salty-dog-720x720-recipe-6498f403e1bc4159bc270ad5275e749e.jpg")
@cosmopolitan.photo.attach(io: file, filename: 'salty-dog.jpg', content_type: 'image/jpg')

puts "Finished Cosmopolitan"

puts "Creating Long Island Ice Tea..."

@liit = Cocktail.create!(
  name: 'Long Island Ice Tea',
)
file = URI.open("https://www.supergoldenbakes.com/wordpress/wp-content/uploads/2019/07/Long_island_iced_tea-1-4s.jpg")
@liit.photo.attach(io: file, filename: 'jbvm.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "1/2 fluid ounce",
  cocktail: @liit,
  ingredient: Ingredient.find_by(name: "Vodka")
)

Dose.create!(
  description: "1/2 fluid ounce",
  cocktail: @liit,
  ingredient: Ingredient.find_by(name: "Rum")
)

Dose.create!(
  description: "1/2 fluid ounce",
  cocktail: @liit,
  ingredient: Ingredient.find_by(name: "Gin")
)

Dose.create!(
  description: "1/2 fluid ounce",
  cocktail: @liit,
  ingredient: Ingredient.new(name: "Triple Sec")
)

Dose.create!(
  description: "1 fluid ounce",
  cocktail: @liit,
  ingredient: Ingredient.new(name: "Sweet and Sour Mix")
)

Dose.create!(
  description: "1 fluid ounce",
  cocktail: @liit,
  ingredient: Ingredient.new(name: "Cola")
)

Dose.create!(
  description: "1 slice",
  cocktail: @liit,
  ingredient: Ingredient.find_by(name: "Lemon")
)

puts "finished creating Long Island Ice Tea"

puts "finished creating #{Cocktail.count} cocktails and #{Ingredient.count} ingredients"
# ingredient: Ingredient.new(name: "1 lime")
