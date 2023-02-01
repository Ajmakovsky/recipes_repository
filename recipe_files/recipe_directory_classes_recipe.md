{{TABLE NAME}} Model and Repository Classes Design Recipe
Copy this recipe template to design and implement Model and Repository classes for a database table.

1. Design and create the Table

Table: Recipes

Columns: recipe_name | cooking time | rating


2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

-- EXAMPLE
-- (file: spec/seeds_recipes.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE students RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (recipe_name, cooking_time, rating) VALUES ('Spaghetti Marinara', '30 minutes', 3);
INSERT INTO recipes (recipe_name, cooking_time, rating) VALUES ('Baba Ghanoush', '20 minutes', 5);
INSERT INTO recipes (recipe_name, cooking_time, rating) VALUES ('Chicken Tikka Masala', '45 minutes', 4);
INSERT INTO recipes (recipe_name, cooking_time, rating) VALUES ('Cullen Skink', '40 minutes', 2);

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

psql -h 127.0.0.1 recipes_directory < seeds_recipes.sql


3. Define the class names
Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by Repository for the Repository class name.


```ruby
# Table name: recipes

# Model class
# (in lib/recipe.rb)
class Recipe
end

# Repository class
# (in lib/recipe_repository.rb)
class RecipeRepository
end
```

4. Implement the Model class
Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

``` ruby
# Table name: recipes

# Model class
# (in lib/recipe.rb)

class Recipe

  # Replace the attributes by your own columns.
  attr_accessor :id, :recipe_name, :cooking_time, :rating
end

# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,
# here's an example:

# recipe = Recipe.new
# recipe.recipe_name = 'Spaghetti'
# recipe.rating = 3

```

You may choose to test-drive this class, but unless it contains any more logic than the example above, it is probably not needed.

5. Define the Repository Class interface
Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

``` ruby
# Table name: students

# Repository class
# (in lib/student_repository.rb)

class StudentRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, recipe_name, cooking_time, rating FROM recipes;

    # Returns an array of Recipe objects.
  end


  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, recipe_name, cooking_time, rating FROM recipes WHERE id = $1;

    # Returns a single Recipe object.
  end

end
```


6. Write Test Examples
Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

# EXAMPLES 

# 1
# Get all recipes

```ruby
repo = RecipeRepository.new

recipes = repo.all

recipes.length # =>  4

recipes[0].id # =>  1
recipes[0].recipe_name # =>  'Spaghetti Marinara'
recipes[0].cooking_time # =>  '30 Minutes'
recipes[0].rating # => 3

recipes[1].id # =>  2
recipes[1].recipe_name # =>  'Baba Ghanoush'
recipes[1].cooking_time # =>  '45 Minutes'
recipes[1].rating # => 5

# 2
# Get a single recipe

repo = RecipeRepository.new

recipes = repo.find(1)

recipes.id # =>  1
recipes.recipes_name # =>  'Spaghetti Marinara'
recipes.cooking_time # =>  '30 Minutes'
recipes.rating # => 3

# 3 
# Get a single recipe

repo = RecipeRepository.new

recipes = repo.find(3)

recipes.id # =>  3
recipes.recipes_name # =>  'Chicken Tikka Masala'
recipes.cooking_time # =>  '45 Minutes'
recipes.rating # => 4

```
# Add more examples for each method
Encode this example as a test.

7. Reload the SQL seeds before each test run
Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

# EXAMPLE
``` ruby 
# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

  # (your tests will go here).
end
```

8. Test-drive and implement the Repository class behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour