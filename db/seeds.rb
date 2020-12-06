require 'open-uri'
require 'json'

puts "Clearing out cocktails and doses from cabinet, the police are coming"
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

# 007 Vesper Martini

puts "Creating 007 Vodka Martini cocktail..."

@jbvm = Cocktail.create!(
  name: '007 Vesper Martini',
)
file = URI.open("https://media.gq-magazine.co.uk/photos/5d13937ab363fa1e2420c91f/master/pass/image.jpg")
@jbvm.photo.attach(io: file, filename: 'jbvm.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "3 Ounces",
  cocktail: @jbvm,
  ingredient: Ingredient.find_by(name: "Gin")
)

Dose.create!(
  description: "1 Ounce",
  cocktail: @jbvm,
  ingredient: Ingredient.find_by(name: "Vodka")
)

Dose.create!(
  description: "1/2 Ounce",
  cocktail: @jbvm,
  ingredient: Ingredient.new(name: "Lillet Blanc")
)

Dose.create!(
  description: "Garnish",
  cocktail: @jbvm,
  ingredient: Ingredient.new(name: "Lemon Peel")
)

puts "Finished 007 Vesper Martini"

puts "Creating Mojito..."

@mojito = Cocktail.create!(
  name: 'Mojito',
)
file = URI.open("https://images.immediate.co.uk/production/volatile/sites/30/2020/08/mojito-cocktails-150961e.jpg?quality=90&webp=true&resize=430,390")
@mojito.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "Juice",
  cocktail: @mojito,
  ingredient: Ingredient.find_by(name: "Lime")
)

Dose.create!(
  description: "1 tsp",
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "Granulated Sugar")
)

Dose.create!(
  description: "Small handful",
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "Mint Leaves")
)

Dose.create!(
  description: "60 ml",
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "White Rum")
)

Dose.create!(
  description: "As much as you want",
  cocktail: @mojito,
  ingredient: Ingredient.new(name: "Soda Water")
)

puts "Finished Mojito"

puts "Creating Salty Dog..."

@salty_dog = Cocktail.create!(
  name: 'Salty Dog',
)
file = URI.open("https://www.liquor.com/thmb/1wy0FDwUvFOp9CvAXL4UaDv1Xuw=/735x0/__opt__aboutcom__coeus__resources__content_migration__liquor__2016__04__20190606__salty-dog-720x720-recipe-6498f403e1bc4159bc270ad5275e749e.jpg")
@salty_dog.photo.attach(io: file, filename: 'salty-dog.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "1 1/2 ounces",
  cocktail: @salty_dog,
  ingredient: Ingredient.find_by(name: "Vodka")
)

Dose.create!(
  description: "3 ounces",
  cocktail: @salty_dog,
  ingredient: Ingredient.new(name: "Grapefruit Juice")
)

Dose.create!(
  description: "4 teaspoons",
  cocktail: @salty_dog,
  ingredient: Ingredient.new(name: "Coarse Sea Salt")
)

Dose.create!(
  description: "Garnish: slice",
  cocktail: @salty_dog,
  ingredient: Ingredient.new(name: "Grapefruit")
)

Dose.create!(
  description: "Garnish: rim with",
  cocktail: @salty_dog,
  ingredient: Ingredient.new(name: "Sea Salt")
)

puts "Finished Salty Dog"

puts "Creating Cosmopolitan..."

@cosmopolitan= Cocktail.create!(
  name: 'Cosmopolitan',
)
file = URI.open("https://images.immediate.co.uk/production/volatile/sites/30/2020/08/cosmopolitan-7a6874f.jpg?quality=90&webp=true&resize=440,400")
@cosmopolitan.photo.attach(io: file, filename: 'cosmopolitan.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "1 1/2 ounces",
  cocktail: @cosmopolitan,
  ingredient: Ingredient.new(name: "Citrus Vodka")
)

Dose.create!(
  description: "1 ounce",
  cocktail: @cosmopolitan,
  ingredient: Ingredient.new(name: "Cointreau")
)

Dose.create!(
  description: "1/2 ounces",
  cocktail: @cosmopolitan,
  ingredient: Ingredient.new(name: "Lime Juice")
)

Dose.create!(
  description: "1 dash",
  cocktail: @cosmopolitan,
  ingredient: Ingredient.new(name: "Cranberry Juice")
)

Dose.create!(
  description: "Garnish: wedge",
  cocktail: @cosmopolitan,
  ingredient: Ingredient.find_by(name: "Lime")
)


puts "Finished Cosmopolitan"

puts "Creating Long Island Ice Tea..."

@liit = Cocktail.create!(
  name: 'Long Island Ice Tea',
)
file = URI.open("https://www.supergoldenbakes.com/wordpress/wp-content/uploads/2019/07/Long_island_iced_tea-1-4s.jpg")
@liit.photo.attach(io: file, filename: 'liit.jpg', content_type: 'image/jpg')

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

puts "Finished creating Long Island Ice Tea"

puts "Creating Dry Martini..."

@dry_martini = Cocktail.create!(
  name: 'Dry Martini',
)
file = URI.open("https://www.liquor.com/thmb/UXprV3UhqbTaJjB0MKSkJ09gNuE=/720x720/smart/filters:no_upscale()/dry-martini-720x720-primary-a6de08f8cd584ad88520287922578bcb.jpg")
@dry_martini.photo.attach(io: file, filename: 'dry-martini.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "2 1/2 ounces",
  cocktail: @dry_martini,
  ingredient: Ingredient.find_by(name: "Gin")
)

Dose.create!(
  description: "1/2 ounce",
  cocktail: @dry_martini,
  ingredient: Ingredient.find_by(name: "Dry Vermouth")
)

Dose.create!(
  description: "1 dash",
  cocktail: @dry_martini,
  ingredient: Ingredient.find_by(name: "Orange bitters")
)

Dose.create!(
  description: "Garnish: twist",
  cocktail: @dry_martini,
  ingredient: Ingredient.find_by(name: "Lemon Peel")
)


puts "Finished Dry Martini"

puts "Creating Negroni..."

@negroni = Cocktail.create!(
  name: 'Negroni',
)
file = URI.open("https://www.liquor.com/thmb/FpQjWZNtBBC8PoW8aPfUj7cysYg=/720x720/filters:fill(auto,1)/__opt__aboutcom__coeus__resources__content_migration__liquor__2018__05__08110806__negroni-720x720-recipe-7c1b747a616f4659af4008d025ab55df.jpg")
@negroni.photo.attach(io: file, filename: 'negroni.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "1 ounce",
  cocktail: @negroni,
  ingredient: Ingredient.find_by(name: "Gin")
)

Dose.create!(
  description: "1 ounce",
  cocktail: @negroni,
  ingredient: Ingredient.new(name: "Campari")
)

Dose.create!(
  description: "1 ounce",
  cocktail: @negroni,
  ingredient: Ingredient.find_by(name: "Sweet Vermouth")
)

Dose.create!(
  description: "Garnish: peel",
  cocktail: @negroni,
  ingredient: Ingredient.find_by(name: "Orange")
)

puts "Finished Negroni"

puts "Creating Daiquiri..."

@daiquiri = Cocktail.create!(
  name: 'Daiquiri',
)
file = URI.open("https://www.liquor.com/thmb/Nf13-yE6MXge88kgj6t6clnLgko=/720x540/smart/filters:no_upscale()/__opt__aboutcom__coeus__resources__content_migration__liquor__2018__04__23143458__daiquiri-720x720-recipe-09f1d5665a794eddbbfb997876736136.jpg")
@daiquiri.photo.attach(io: file, filename: 'daiquiri.jpg', content_type: 'image/jpg')

Dose.create!(
  description: "2 ounces",
  cocktail: @daiquiri,
  ingredient: Ingredient.new(name: "Light Rum")
)

Dose.create!(
  description: "1 ounce",
  cocktail: @daiquiri,
  ingredient: Ingredient.find_by(name: "Lime Juice")
)

Dose.create!(
  description: "3/4 ounce",
  cocktail: @daiquiri,
  ingredient: Ingredient.new(name: "Demerara Sugar Syrup")
)

Dose.create!(
  description: "Garnish: twist",
  cocktail: @daiquiri,
  ingredient: Ingredient.find_by(name: "Lime")
)

puts "Finished Daiquiri"

puts "Great! Finished creating #{Cocktail.count} cocktails and #{Ingredient.count} ingredients"
# ingredient: Ingredient.new(name: "1 lime")
