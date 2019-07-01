-- 1. What query would you run to get all the countries that speak Slovene? 
-- Your query should return the name of the country, language and language percentage. 
-- You query should arrange the result by language percentage in descending order. (1)

SELECT countries.name, languages.language, languages.percentage
FROM countries
JOIN languages ON countries.code = languages.country_code
WHERE LANGUAGE = 'Slovene'
ORDER BY languages.percentage DESC;

-- 2. What query would you run to display the total number of cities for each country? 
-- Your query should return the name of the country and the total number of cities. 
-- You query should arrange the result by number of cities in descending order. (3)

SELECT countries.name AS country, COUNT(cities.id) AS number_of_citites
FROM countries
JOIN cities ON countries.code = cities.country_code
GROUP BY countries.code
ORDER BY COUNT(cities.id) desc;

-- 3. What query would you run to get all the cities in Mexico with a population of greater than 500,000? 
-- Your query should arrange the result by population in descending order. (1)

SELECT cities.name, cities.population
FROM cities
JOIN countries ON cities.country_id = countries.id
WHERE countries.name = 'Mexico' and cities.population > 500000
ORDER BY cities.population desc;

-- 4. What query would you run to get all languages in each country with a percentage greater than 89%? 
-- Your query should arrange the result by percentage in descending order. (1)

SELECT countries.name AS country, languages.language, languages.percentage
FROM languages
JOIN countries ON languages.country_id = countries.id
WHERE languages.percentage > 89
ORDER BY languages.percentage DESC;

-- 5. What query would you run to get all the countries with Surface Area below 501 
-- and Population greater than 100,000? (2)

SELECT countries.name AS country, countries.surface_area, countries.population
FROM countries
WHERE countries.surface_area < 500 AND countries.population > 100000;

-- 6. What query would you run to get countries with only Constitutional Monarchy 
-- with a capital greater than 200 and a life expectancy greater than 75 years? (1)

SELECT countries.name AS country, countries.government_form, countries.life_expectancy, countries.capital
FROM countries
WHERE countries.government_form = 'Constitutional Monarchy' AND capital > 200 AND life_expectancy > 75;

-- 7. What query would you run to get all the cities of Argentina inside the Buenos Aires district 
-- and have population greater than 500, 000? The query should return the 
-- Country Name, City Name,  District and Population. (2)

SELECT countries.name As country, cities.name AS city_name, cities.district, cities.population
FROM cities
JOIN countries ON cities.country_id = countries.id
 WHERE countries.name = 'Argentina' AND cities.district = 'Buenos Aires' AND cities.population > 500000;

-- 8. What query would you run to summarize the number of countries in each region? 
-- The query should display the name of the region and the number of countries. 
-- Also, the query should arrange the result by number of countries in descending order. (2)

SELECT countries.region, COUNT(id) AS number_of_countries
FROM countries
GROUP BY region
ORDER BY COUNT(id) DESC;
