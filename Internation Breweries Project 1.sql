
/*QUESTIONS

1. Write an SQL query to fetch “SALES_REP” from breweries  table using the alias name as WORKER_NAME.*/

SELECT sales_rep AS WORKER_NAME
FROM breweries;

SELECT DISTINCT sales_rep AS WORKER_NAME
FROM breweries;

--2. Write an SQL query to fetch “BRANDS” from breweries table in upper case.--

SELECT UPPER (brands) AS BRANDS
FROM breweries;

SELECT DISTINCT UPPER (brands) AS BRANDS
FROM breweries;

--3: Write an SQL query to print all details from the breweries table; sort the QUANTITY column in Ascending order and the COSTS column in Descending order--

SELECT * FROM breweries
ORDER BY quantity ASC, costs DESC;

--4: Write an SQL query to print the profit made from two BRANDS, “trophy” and “eagle” in the first quarter of 2019--

SELECT brands, SUM(profit)
FROM breweries
WHERE brands IN ('trophy','eagle lager')
AND  years = 2019
AND months IN ('January','February','March')
GROUP BY brands

--5: Write a query that reduces the cost of the trophy brand by 2%--

SELECT brands, costs, costs - (costs * 2.0/100.0) AS Percentage_discount
FROM breweries
WHERE brands = 'trophy'

SELECT brands, SUM(costs), SUM(costs)- (SUM(costs) * 2.0/100.0) AS Percentage_discount
FROM breweries
WHERE brands = 'trophy'
GROUP BY brands

--OR ALTERNATE ANSWER CODES--
SELECT brands, costs, costs * 0.98 AS Percentage_discount
FROM breweries
WHERE brands = 'trophy'

SELECT brands, SUM(costs), SUM(costs) * 0.98 AS Percentage_discount
FROM breweries
WHERE brands = 'trophy'
GROUP BY brands

--6: Which sales rep made the highest profit in Ghana in the year 2017?--

SELECT sales_rep, SUM(profit)
FROM Breweries
WHERE countries = 'Ghana'
AND years= 2017
GROUP BY Sales_rep
ORDER BY SUM(profit) DESC


--7: What region recorded the lowest quantity of goods in the last quarter of every year?--
SELECT region, SUM(quantity)
FROM breweries
WHERE months IN ('October','November','December')
GROUP BY region
ORDER BY SUM (quantity) ASC
LIMIT 1



--8: The Breweries company has a yearly tradition of promoting the sales_rep who makes the highest profit in the year. Who deserves this promotion in 2019?--
SELECT sales_rep, SUM(profit) AS highest_profit
FROM breweries
WHERE years = 2019
GROUP BY Sales_rep
ORDER BY SUM(profit) DESC
LIMIT 1


--QUESTION 9: Regions with quantities of trophy which are less than 60000, need to be restocked. What regions do we restock with the trophy brand?--
SELECT region, SUM(quantity), brands
FROM Breweries
WHERE  brands = 'trophy' 
GROUP BY region, brands
HAVING SUM(quantity)<60000