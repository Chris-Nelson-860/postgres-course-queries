--Write a query that displays only the state with the largest amount of fruit supply.
SELECT state
FROM fruit_imports
GROUP BY state
ORDER BY sum(supply) DESC
LIMIT 1;


--Write a query that returns the most expensive cost_per_unit of every season. The query should display 2 columns, the season and the cost_per_unit
SELECT season, max(cost_per_unit) AS highest_cost_per_unit
FROM fruit_imports
GROUP BY season;


--Write a query that returns the state that has more than 1 import of the same fruit. 
SELECT state
FROM fruit_imports
GROUP BY state, name
HAVING count(name) > 1;


--Write a query that returns the seasons that produce either 3 fruits or 4 fruits.
SELECT season
FROM fruit_imports
GROUP BY season
HAVING count(fruit_imports.name) = 3 OR count(fruit_imports.name) = 4;


--Write a query that takes into consideration the  supply and cost_per_unit columns for determining the total cost and returns the most expensive state with the total cost.
SELECT state, sum(supply * cost_per_unit) AS total_cost
FROM fruit_imports
GROUP BY state
ORDER BY total_cost DESC
LIMIT 1;