-- drop view recipe_tags;
-- drop view rating_review_series;
-- drop view specific_recipe_deets;
-- drop view specific_recipe;
-- drop table tags;
-- drop table ingredients;
-- drop table interactions;
-- drop table recipes;

-- Table creation
create table recipes (
	recipe_name text,
	recipe_id int,
	user_id int,
	description text,
	n_of_ingredients int,
	n_of_steps int,
	date_posted date,
	primary key(recipe_id)
);

create table interactions (
	user_id int,
	recipe_id int,
	foreign key (recipe_id) references recipes(recipe_id),
	rating int,
	review text
);

create table ingredients (
	recipe_id int,
	foreign key (recipe_id) references recipes(recipe_id),
	ingredients text
);

create table tags (
	recipe_id int,
	foreign key (recipe_id) references recipes(recipe_id),
	tags text
);

-- Create view for specific recipe general info
create view specific_recipe as
select recipes.recipe_id as "Recipe ID",
recipes.recipe_name as "Recipe Name",
recipes.description "Description",
recipes.date_posted as "Date Posted",
interactions.rating as "Rating",
interactions.review as "Review",
recipes.n_of_ingredients as "# of Ingredients",
recipes.n_of_steps as "# of Steps"
from recipes
join interactions
on recipes.recipe_id = interactions.recipe_id

-- Create view for specific recipe ingredients and tags
create view specific_recipe_deets as
select ingredients.recipe_id as "Recipe ID",
ingredients.ingredients as "Ingredients",
tags.tags as "Tags"
from ingredients
join tags
on ingredients.recipe_id = tags.recipe_id

-- Create view for specific recipe and review/rating
create view rating_review_series as
select recipes.recipe_id as "Recipe ID",
recipes.recipe_name as "Recipe Name",
interactions.rating as "Rating",
interactions.review as "Review",
recipes.date_posted as "Date Posted"
from recipes
join interactions
on recipes.recipe_id = interactions.recipe_id

-- Create view for recipe tags
create view recipe_tags as
select interactions.recipe_id as "Recipe ID",
interactions.rating as "Rating",
tags.tags as "Tag"
from interactions
join tags
on interactions.recipe_id = tags.recipe_id
