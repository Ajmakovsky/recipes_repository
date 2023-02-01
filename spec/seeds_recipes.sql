-- (file: spec/seeds_recipes.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE recipes RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO recipes (recipe_name, cooking_time, rating) VALUES ('Spaghetti Marinara', '30 minutes', 3);
INSERT INTO recipes (recipe_name, cooking_time, rating) VALUES ('Baba Ghanoush', '20 minutes', 5);
INSERT INTO recipes (recipe_name, cooking_time, rating) VALUES ('Chicken Tikka Masala', '45 minutes', 4);
INSERT INTO recipes (recipe_name, cooking_time, rating) VALUES ('Cullen Skink', '40 minutes', 2);