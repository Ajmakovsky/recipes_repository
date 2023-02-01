require_relative './lib/recipe'
require_relative './lib/recipe_repository'
require_relative './lib/database_connection'

DatabaseConnection.connect('recipes_directory')

recipe_repo = RecipeRepository.new

recipe = recipe_repo.find(2)

puts "#{recipe.id} - #{recipe.recipe_name} - Cooking time: #{recipe.cooking_time} - Rating: #{recipe.rating}"

recipe_repo.all.each do |recipe|
  puts "#{recipe.id} - #{recipe.recipe_name} - Cooking time: #{recipe.cooking_time} - Rating: #{recipe.rating}"
end 
