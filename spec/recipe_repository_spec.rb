require 'recipe_repository'

describe RecipeRepository do 

  def reset_recipe_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end 

  before(:each) do 
    reset_recipe_table
  end 

  it 'returns all recipes in the table' do 

    repo = RecipeRepository.new
    recipes = repo.all

    expect(recipes.length).to eq 4
    expect(recipes[0].id).to eq '1' # =>  1
    expect(recipes[0].recipe_name).to eq'Spaghetti Marinara'
    expect(recipes[0].cooking_time).to eq '30 Minutes'
    expect(recipes[0].rating).to eq 3

    expect(recipes[1].id).to eq  '2'
    expect(recipes[1].recipe_name).to eq 'Baba Ghanoush'
    expect(recipes[1].cooking_time).to eq '45 Minutes'
    expect(recipes[1].rating).to eq 5 
  end 

  # context 'it returns a single recipe' do 
  #   it '' do 
  #   end 

  #   it '' do 
  #   end 

  # end 
end