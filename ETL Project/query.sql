-- Query to check successful table loads
select * from recipes;
select * from interactions;
select * from ingredients;
select * from tags;
select * from specific_recipe;
select * from specific_recipe_deets;
select * from rating_review_series;

-- What were the first recipes ever posted to food.com?
select "Recipe ID",
"Recipe Name",
"Description",
"Date Posted"
from specific_recipe
where
	"Recipe ID" >= '0'
	and
	"Recipe ID" <= '100'
	order by "Recipe ID" asc;

-- What recipes have the most steps?
select "Recipe ID",
"Recipe Name",
"Description",
"# of Steps"
from specific_recipe
order by "# of Steps" desc
limit 10;

-- What recipes have the least steps?
select "Recipe ID",
"Recipe Name",
"Description",
"# of Steps"
from specific_recipe
order by "# of Steps" asc
limit 10;

-- What are the most common ingredients used?
SELECT "Ingredients", COUNT(*)
FROM specific_recipe_deets
GROUP BY "Ingredients"
order by Count desc;

-- What are the least common ingredients used?
SELECT "Ingredients", COUNT(*)
FROM specific_recipe_deets
GROUP BY "Ingredients"
order by Count asc;

-- What are the most common tags used?
SELECT "Tags", COUNT(*)
FROM specific_recipe_deets
GROUP BY "Tags"
order by Count desc;

-- What are the least common tags used?
SELECT "Tags", COUNT(*)
FROM specific_recipe_deets
GROUP BY "Tags"
order by Count asc;

