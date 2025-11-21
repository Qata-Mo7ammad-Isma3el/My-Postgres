/* 
Operators in the WHERE clause:
• = : Equal to
• < : Less than
• > : Greater than
• <= : Less than or equal to
• > = : Greater than or equal to
• <> : Not equal to
• != : Not equal to
• LIKE : Check if a value matches a pattern (case sensitive)
• ILIKE : Check if a value matches a pattern (case insensitive)
• AND : Logical AND
• OR : Logical OR
• IN : Check if a value is in a list of values
• BETWEEN : Check if a value is between a range
• IS NULL : Check if a value is NULL
• NOT : Negates an expression (e.g., NOT LIKE, NOT IN, NOT BETWEEN)
*/

-- Equal To
SELECT * FROM cars
WHERE brand = 'Volvo';

-- Less Than
SELECT * FROM cars
WHERE year < 1975;

-- Greater Than
SELECT * FROM cars
WHERE year > 1975;

-- Less Than or Equal To
SELECT * FROM cars
WHERE year <= 1975;

-- Greater Than or Equal to
SELECT * FROM cars
WHERE year >= 1975;

-- Not Equal To
SELECT * FROM cars
WHERE brand <> 'Volvo';

SELECT * FROM cars
WHERE brand != 'Volvo';

-- LIKE
/*
The LIKE operator is used when you want to return all records where a column is equal to a specified pattern.
The pattern can be an absolute value like 'Volvo', or with a wildcard that has a special meaning.
There are two wildcards often used in conjunction with the LIKE operator:
	• The percent sign %, represents zero, one, or multiple characters.
	• The underscore sign _, represents one single character.
Note: The LIKE operator is case sensitive.
*/

SELECT * FROM cars
WHERE model LIKE 'M%';

-- ILIKE
-- Note: Same as the LIKE operator, but ILIKE is case insensitive.
SELECT * FROM cars
WHERE model ILIKE 'm%';

-- AND
SELECT * FROM cars
WHERE brand = 'Volvo' AND year = 1968;

-- OR
SELECT * FROM cars
WHERE brand = 'Volvo' OR year = 1975;

-- IN
SELECT * FROM cars
WHERE brand IN ('Volvo', 'Mercedes', 'Ford');

-- BETWEEN
SELECT * FROM cars
WHERE year BETWEEN 1970 AND 1980;

/*
The BETWEEN operator includes the from and to values, meaning that in the above example, 
the result would include cars made in 1970 and 1980 as well.
*/

-- IS NULL
SELECT * FROM cars
WHERE model IS NULL;

-- NOT
SELECT * FROM cars
WHERE brand NOT LIKE 'B%';

SELECT * FROM cars
WHERE brand NOT ILIKE 'b%';

SELECT * FROM cars
WHERE brand NOT IN ('Volvo', 'Mercedes', 'Ford');

SELECT * FROM cars
WHERE year NOT BETWEEN 1970 AND 1980;
/*
The NOT BETWEEN operator excludes the from and to values, meaning that in the above example,
the result would not include cars made in 1970 and 1980.
*/

SELECT * FROM cars
WHERE model IS NOT NULL;

-- PostgreSQL Select Data --
-- To retrieve data from a data base, we use the SELECT statement.
SELECT customer_name, country FROM customers;
SELECT * FROM customers;

-- PostgreSQL SELECT DISTINCT --
-- The SELECT DISTINCT statement is used to return only distinct (different) values.
SELECT DISTINCT country FROM customers;

/*
Even though the customers table has 91 records, it only has 21 different countries, and that 
is what you get as a result when executing the SELECT DISTINCT statement above
*/

-- SELECT COUNT(DISTINCT)
/*
We can also use the DISTINCT keyword in combination with the COUNT statement, which in the example
below will return the number of different countries there are in the customers table.
*/
SELECT COUNT(DISTINCT country) FROM customers;

-- PostgreSQL WHERE - Filter Data -- 
/*
Filter Records:
	• The WHERE clause is used to filter records.
	• It is used to extract only those records that fulfill a specified condition.
Note Quotes around numeric fields will not fail, but it is good practice to always 
write numeric values without quotes.
*/

SELECT * FROM customers
WHERE city = 'London';

SELECT * FROM customers
WHERE customer_id > 80;

-- PostgreSQL ORDER BY --

/*
Sort Data: 
	• The ORDER BY keyword is used to sort the result in ascending or descending order.
	• The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending 
	  order, use the DESC keyword.
*/
SELECT * FROM products
ORDER BY price;

-- DESC 
/*
The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, 
use the DESC keyword.
*/

SELECT * FROM products
ORDER BY price DESC;

-- Sort Alphabetically
-- For string values the ORDER BY keyword will order alphabetically:
SELECT * FROM products
ORDER BY product_name;

-- Alphabetically DESC
SELECT * FROM products
ORDER BY product_name DESC;

-- PostgreSQL LIMIT --
/*
The LIMIT Clause:
	• The LIMIT clause is used to limit the maximum number of records to return.
*/

SELECT * FROM customers
LIMIT 20;

-- The OFFSET Clause
/*
• The OFFSET clause is used to specify where to start selecting the records to return.
• If you want to return 20 records, but start at number 40, you can use both LIMIT and OFFSET.
Note: The first record is number 0, so when you specify OFFSET 40 it means starting at record number 41.
*/

SELECT * FROM customers
LIMIT 20 OFFSET 40;


-- PostgreSQL MIN and MAX Functions --
/*
• MIN: The MIN() function returns the smallest value of the selected column.
• MAX largest: The MAX() function returns the smallest value of the selected column.
*/
SELECT MIN(price)
FROM products;

SELECT MAX(price)
FROM products;


-- Set Column Name
/*
When you use MIN() or MAX(), the returned column will be named min or max by default. 
To give the column a new name, use the AS keyword.
*/
SELECT MIN(price) AS lowest_price
FROM products;

-- PostgreSQL COUNT Function --
/*
COUNT:
• The COUNT() function returns the number of rows that matches a specified criterion.
• If the specified criterion is a column name, the COUNT() function returns the number of columns with that name.
• Note: NULL values are not counted.
*/

SELECT COUNT(customer_id)
FROM customers;


-- PostgreSQL SUM Function --
/*
SUM: 
• The SUM() function returns the total sum of a numeric column.
• The following SQL statement finds the sum of the quantity fields in the order_details table:
• Note: Note: NULL values are ignored.
*/

SELECT SUM(quantity)
FROM order_details;


-- PostgreSQL AVG Function --
/*
AVG: 
• The AVG() function returns the average value of a numeric column.
• Note: NULL values are ignored.
*/

SELECT AVG(price)
FROM products;

/*
• With 2 Decimals:
• The above example returned the average price of all products, the result was 28.8663636363636364.
• We can use the ::NUMERIC operator to round the average price to a number with 2 decimals:
*/

SELECT AVG(price)::NUMERIC(10,2)
FROM products;


-- PostgreSQL LIKE Operator --
/*
• LIKE: 
• The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
• There are two wildcards often used in conjunction with the LIKE operator:
	• % The percent sign represents zero, one, or multiple characters
	• _ The underscore sign represents one, single character
*/

-- Starts with
-- To return records that starts with a specific letter or phrase, add the % at the end of the letter or phrase.
SELECT * FROM customers
WHERE customer_name LIKE 'A%';

-- Contains
-- To return records that contains a specific letter or phrase, add the % both before and after the letter or phrase.
SELECT * FROM customers
WHERE customer_name LIKE '%A%';

/*
ILIKE: 
Note: The LIKE operator is case sensitive, if you want to do a case insensitive search, use the ILIKE operator instead.
*/
SELECT * FROM customers
WHERE customer_name ILIKE '%A%';
-- Return all customers with a name that contains the letter 'A' or 'a'


-- Ends with
-- To return records that ends with a specific letter or phrase, add the % before the letter or phrase.
SELECT * FROM customers
WHERE customer_name LIKE '%en';


/*
• The Undescore _ Wildcard
• The _ wildcard represents a single character.
• It can be any character or number, but each _ represents one, and only one, character.
*/

SELECT * FROM customers
WHERE city LIKE 'L_nd__';


-- PostgreSQL IN Operator --
/*
• IN: 
• The IN operator allows you to specify a list of possible values in the WHERE clause.
• The IN operator is a shorthand for multiple OR conditions.
*/
-- Return all customers that are NOT from 'Germany', France' or 'UK':
SELECT * FROM customers
WHERE country IN ('Germany', 'France', 'UK');

SELECT * FROM customers
WHERE country NOT IN ('Germany', 'France', 'UK');

SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

SELECT * FROM customers
WHERE customer_id NOT IN (SELECT customer_id FROM orders);


-- PostgreSQL BETWEEN Operator --
/*
• BETWEEN: 
• The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
• The BETWEEN operator is inclusive: begin and end values are included.
*/
SELECT * FROM Products
WHERE Price BETWEEN 10 AND 15;

/*
• BETWEEN Text Values: 
• The BETWEEN operator can also be used on text values.
• The result returns all records that are alphabetically between the specified values.
*/
SELECT * FROM Products
WHERE product_name BETWEEN 'Pavlova' AND 'Tofu';

SELECT * FROM Products
WHERE product_name BETWEEN 'Pavlova' AND 'Tofu'
ORDER BY product_name;

-- BETWEEN Date Values
-- The BETWEEN operator can also be used on date values.

SELECT * FROM orders
WHERE order_date BETWEEN '2023-04-12' AND '2023-05-05';

-- PostgreSQL AS --

/*
• Aliases: 
• SQL aliases are used to give a table, or a column in a table, a temporary name.
• Aliases are often used to make column names more readable.
• An alias only exists for the duration of that query.
• An alias is created with the AS keyword.
*/

SELECT customer_id AS id
FROM customers;

-- Note: Actually, you can skip the AS keyword and get the same result
SELECT customer_id id
FROM customers;

-- Concatenate Columns
/*
The AS keyword is often used when two or more fields are concatenated into one.
To concatenate two fields use ||.
*/
SELECT product_name || unit AS product
FROM products;
/*
Note: In the result of the example above we are missing a space between product_name and unit. 
To add a space when concatenating, use || ' ' ||.
*/

SELECT product_name || ' ' || unit AS product
FROM products;

SELECT product_name AS "My Great Products"
FROM products;

-- PostgreSQL Joins --
/*

• JOIN: A JOIN clause is used to combine rows from two or more tables, based on a related column between them.
Let's look at a selection from the products table:
 product_id |  product_name  | category_id
------------+----------------+-------------
         33 | Geitost        |           4
         34 | Sasquatch Ale  |           1
         35 | Steeleye Stout |           1
         36 | Inlagd Sill    |           8

Then, look at a selection from the categories table:
 category_id | category_name
-------------+----------------
           1 | Beverages
           2 | Condiments
           3 | Confections
           4 | Dairy Products

Notice that the category_id column in the products table refers to the category_id in the categories table.
The relationship between the two tables above is the category_id column.
Then, we can create the following SQL statement (with a JOIN), that selects records that have matching 
values in both tables:
*/

SELECT product_id, product_name, category_name
FROM products
INNER JOIN categories ON products.category_id = categories.category_id;

/*
Result After Join:
 product_id |  product_name  | category_name
------------+----------------+----------------
         33 | Geitost        | Dairy Products
         34 | Sasquatch Ale  | Beverages
         35 | Steeleye Stout | Beverages
         36 | Inlagd Sill    | Seafood

• Different Types of Joins
• Here are the different types of the Joins in PostgreSQL:
• INNER JOIN: Returns records that have matching values in both tables
• LEFT JOIN: Returns all records from the left table, and the matched records from the right table
• RIGHT JOIN: Returns all records from the right table, and the matched records from the left table
• FULL JOIN: Returns all records when there is a match in either left or right table
*/

-- PostgreSQL INNER JOIN --
/*
• INNER JOIN
• The INNER JOIN keyword selects records that have matching values in both tables.
• Let's look at an example using our dummy testproducts table:
 testproduct_id |      product_name      | category_id
----------------+------------------------+-------------
              1 | Johns Fruit Cake       |           3*
              2 | Marys Healthy Mix      |           9
              3 | Peters Scary Stuff     |          10
              4 | Jims Secret Recipe     |          11
              5 | Elisabeths Best Apples |          12
              6 | Janes Favorite Cheese  |           4*
              7 | Billys Home Made Pizza |          13
              8 | Ellas Special Salmon   |           8*
              9 | Roberts Rich Spaghetti |           5*
             10 | Mias Popular Ice       |          14
(10 rows)
• We will try to join the testproducts table with the categories table:
 category_id | category_name  |                       description
-------------+----------------+------------------------------------------------------------
           1 | Beverages      | Soft drinks, coffees, teas, beers, and ales
           2 | Condiments     | Sweet and savory sauces, relishes, spreads, and seasonings
          *3 | Confections    | Desserts, candies, and sweet breads
          *4 | Dairy Products | Cheeses
          *5 | Grains/Cereals | Breads, crackers, pasta, and cereal
           6 | Meat/Poultry   | Prepared meats
           7 | Produce        | Dried fruit and bean curd
          *8 | Seafood        | Seaweed and fish
(8 rows)

• Notice that many of the products in testproducts have a category_id that does not match any of the 
  categories in the categories table.

• By using INNER JOIN we will not get the records where there is not a match, we will only get the records 
  that matches both tables:
*/
SELECT testproduct_id, product_name, category_name
FROM testproducts
INNER JOIN categories ON testproducts.category_id = categories.category_id;
/*
• Only the records with a match in BOTH tables are returned:

 testproduct_id |      product_name      | category_name
----------------+------------------------+----------------
              1 | Johns Fruit Cake       | Confections
              6 | Janes Favorite Cheese  | Dairy Products
              8 | Ellas Special Salmon   | Seafood
              9 | Roberts Rich Spaghetti | Grains/Cereals
(4 rows)
• Note: JOIN and INNER JOIN will give the same result.
• INNER is the default join type for JOIN, so when you write JOIN the parser actually writes INNER JOIN.
*/


-- PostgreSQL LEFT JOIN --
/*
• LEFT JOIN
• The LEFT JOIN keyword selects ALL records from the "left" table, and the matching records from the "right" table. 
  The result is 0 records from the right side if there is no match.
• Let's look at an example using our dummy testproducts table:
 testproduct_id |      product_name      | category_id
----------------+------------------------+-------------
              1 | Johns Fruit Cake       |           3
              2 | Marys Healthy Mix      |           9
              3 | Peters Scary Stuff     |          10
              4 | Jims Secret Recipe     |          11
              5 | Elisabeths Best Apples |          12
              6 | Janes Favorite Cheese  |           4
              7 | Billys Home Made Pizza |          13
              8 | Ellas Special Salmon   |           8
              9 | Roberts Rich Spaghetti |           5
             10 | Mias Popular Ice       |          14
(10 rows)
We will try to join the testproducts table with the categories table:
 category_id | category_name  |                       description
-------------+----------------+------------------------------------------------------------
           1 | Beverages      | Soft drinks, coffees, teas, beers, and ales
           2 | Condiments     | Sweet and savory sauces, relishes, spreads, and seasonings
           3 | Confections    | Desserts, candies, and sweet breads
           4 | Dairy Products | Cheeses
           5 | Grains/Cereals | Breads, crackers, pasta, and cereal
           6 | Meat/Poultry   | Prepared meats
           7 | Produce        | Dried fruit and bean curd
           8 | Seafood        | Seaweed and fish
(8 rows)

• Note: Many of the products in testproducts have a category_id that does not match any of the categories 
  in the categories table.
• By using LEFT JOIN we will get all records from testpoducts, even the ones with no match in the categories table:
*/
SELECT testproduct_id, product_name, category_name
FROM testproducts
LEFT JOIN categories ON testproducts.category_id = categories.category_id;
------------------------           LEFT                    RIGHT
/*
• All records from testproducts, and only the matched records from categories:
 testproduct_id |      product_name      | category_name
----------------+------------------------+----------------
              1 | Johns Fruit Cake       | Confections
              2 | Marys Healthy Mix      |
              3 | Peters Scary Stuff     |
              4 | Jims Secret Recipe     |
              5 | Elisabeths Best Apples |
              6 | Janes Favorite Cheese  | Dairy Products
              7 | Billys Home Made Pizza |
              8 | Ellas Special Salmon   | Seafood
              9 | Roberts Rich Spaghetti | Grains/Cereals
             10 | Mias Popular Ice       |
(10 rows)

• Note: LEFT JOIN and LEFT OUTER JOIN will give the same result.
• OUTER is the default join type for LEFT JOIN, so when you write LEFT JOIN the parser actually writes 
  LEFT OUTER JOIN.
*/


-- PostgreSQL RIGHT JOIN --
/*
• RIGHT JOIN
• The RIGHT JOIN keyword selects ALL records from the "right" table, and the matching records from the "left" table.
• The result is 0 records from the left side if there is no match.
• Let's look at an example using our dummy testproducts table:
testproduct_id |      product_name      | category_id
----------------+------------------------+-------------
              1 | Johns Fruit Cake       |           3
              2 | Marys Healthy Mix      |           9
              3 | Peters Scary Stuff     |          10
              4 | Jims Secret Recipe     |          11
              5 | Elisabeths Best Apples |          12
              6 | Janes Favorite Cheese  |           4
              7 | Billys Home Made Pizza |          13
              8 | Ellas Special Salmon   |           8
              9 | Roberts Rich Spaghetti |           5
             10 | Mias Popular Ice       |          14
(10 rows)
• We will try to join the testproducts table with the categories table:
category_id | category_name  |                       description
-------------+----------------+------------------------------------------------------------
           1 | Beverages      | Soft drinks, coffees, teas, beers, and ales
           2 | Condiments     | Sweet and savory sauces, relishes, spreads, and seasonings
           3 | Confections    | Desserts, candies, and sweet breads
           4 | Dairy Products | Cheeses
           5 | Grains/Cereals | Breads, crackers, pasta, and cereal
           6 | Meat/Poultry   | Prepared meats
           7 | Produce        | Dried fruit and bean curd
           8 | Seafood        | Seaweed and fish
(8 rows)

• Note: Many of the products in testproducts have a category_id that does not match any of the categories in 
  the categories table.
• By using RIGHT JOIN we will get all records from categories, even the ones with no match in the testproducts table:
*/
SELECT testproduct_id, product_name, category_name
FROM testproducts
RIGHT JOIN categories ON testproducts.category_id = categories.category_id;
------------------------           LEFT                    RIGHT

/*
• All records from categories, and only the matched records from testproducts:
 testproduct_id |      product_name      | category_name
----------------+------------------------+----------------
              1 | Johns Fruit Cake       | Confections
              6 | Janes Favorite Cheese  | Dairy Products
              8 | Ellas Special Salmon   | Seafood
              9 | Roberts Rich Spaghetti | Grains/Cereals
                |                        | Condiments
                |                        | Meat/Poultry
                |                        | Beverages
                |                        | Produce
(8 rows)
• Note: RIGHT JOIN and RIGHT OUTER JOIN will give the same result.

• OUTER is the default join type for RIGHT JOIN, so when you write RIGHT JOIN the parser actually
  writes RIGHT OUTER JOIN.


*/

-- PostgreSQL FULL JOIN --
/*
• FULL JOIN
• The FULL JOIN keyword selects ALL records from both tables, even if there is not a match. 
  For rows with a match the values from both tables are available, if there is not a match the
  empty fields will get the value NULL.
• Let's look at an example using our dummy testproducts table:
testproduct_id |      product_name      | category_id
----------------+------------------------+-------------
              1 | Johns Fruit Cake       |           3
              2 | Marys Healthy Mix      |           9
              3 | Peters Scary Stuff     |          10
              4 | Jims Secret Recipe     |          11
              5 | Elisabeths Best Apples |          12
              6 | Janes Favorite Cheese  |           4
              7 | Billys Home Made Pizza |          13
              8 | Ellas Special Salmon   |           8
              9 | Roberts Rich Spaghetti |           5
             10 | Mias Popular Ice       |          14
(10 rows)
• We will try to join the testproducts table with the categories table:
category_id | category_name  |                       description
-------------+----------------+------------------------------------------------------------
           1 | Beverages      | Soft drinks, coffees, teas, beers, and ales
           2 | Condiments     | Sweet and savory sauces, relishes, spreads, and seasonings
           3 | Confections    | Desserts, candies, and sweet breads
           4 | Dairy Products | Cheeses
           5 | Grains/Cereals | Breads, crackers, pasta, and cereal
           6 | Meat/Poultry   | Prepared meats
           7 | Produce        | Dried fruit and bean curd
           8 | Seafood        | Seaweed and fish
(8 rows)

• Note: Many of the products in testproducts have a category_id that does not match any of the categories
in the categories table.
• By using FULL JOIN we will get all records from both the categories table and the testproducts table:
*/
SELECT testproduct_id, product_name, category_name
FROM testproducts
FULL JOIN categories ON testproducts.category_id = categories.category_id;

/*
• All records from both tables are returned.

• Rows with no match will get a NULL value in fields from the opposite table:
 testproduct_id |      product_name       | category_name
----------------+-------------------------+----------------
              1 | Johns Fruit Cake        | Confections
              2 | Marys Healthy Mix       |
              3 | Peters Scary Stuff      |
              4 | Jims Secret Recipe      |
              5 | Elisabeths Best Apples  |
              6 | Janes Favorite Cheese   | Dairy Products
              7 | Billys Home Made Pizza  |
              8 | Ellas Special Salmon    | Seafood
              9 | Roberts Rich Spaghetti  | Grains/Cereals
             10 | Mias Popular Ice        |
                |                         | Condiments
                |                         | Meat/Poultry
                |                         | Beverages
                |                         | Produce
(14 rows)
• Note: FULL JOIN and FULL OUTER JOIN will give the same result.
• OUTER is the default join type for FULL JOIN, so when you write FULL JOIN the parser actually writes
  FULL OUTER JOIN.
*/

-- PostgreSQL CROSS JOIN --
/*
• CROSS JOIN
• The CROSS JOIN keyword matches ALL records from the "left" table with EACH record from the "right" table.
• That means that all records from the "right" table will be returned for each record in the "left" table.
• This way of joining can potentially return very large table, and you should not use it if you do not have to.
• Let's look at an example using our dummy testproducts table:
 testproduct_id |      product_name      | category_id
----------------+------------------------+-------------
              1 | Johns Fruit Cake       |           3
              2 | Marys Healthy Mix      |           9
              3 | Peters Scary Stuff     |          10
              4 | Jims Secret Recipe     |          11
              5 | Elisabeths Best Apples |          12
              6 | Janes Favorite Cheese  |           4
              7 | Billys Home Made Pizza |          13
              8 | Ellas Special Salmon   |           8
              9 | Roberts Rich Spaghetti |           5
             10 | Mias Popular Ice       |          14
(10 rows)
• We will try to join the testproducts table with the categories table:
 category_id | category_name  |                       description
-------------+----------------+------------------------------------------------------------
           1 | Beverages      | Soft drinks, coffees, teas, beers, and ales
           2 | Condiments     | Sweet and savory sauces, relishes, spreads, and seasonings
           3 | Confections    | Desserts, candies, and sweet breads
           4 | Dairy Products | Cheeses
           5 | Grains/Cereals | Breads, crackers, pasta, and cereal
           6 | Meat/Poultry   | Prepared meats
           7 | Produce        | Dried fruit and bean curd
           8 | Seafood        | Seaweed and fish
(8 rows)
• Note: The CROSS JOIN method will return ALL categories for EACH testproduct, 
  meaning that it will return 80 rows (10 * 8).


*/

SELECT testproduct_id, product_name, category_name
FROM testproducts
CROSS JOIN categories;
/*
• All categories for each testproduct will be returned:
 testproduct_id |      product_name      | category_name
----------------+------------------------+----------------
              1 | Johns Fruit Cake       | Beverages
              1 | Johns Fruit Cake       | Condiments
              1 | Johns Fruit Cake       | Confections
              1 | Johns Fruit Cake       | Dairy Products
              1 | Johns Fruit Cake       | Grains/Cereals
              1 | Johns Fruit Cake       | Meat/Poultry
              1 | Johns Fruit Cake       | Produce
              1 | Johns Fruit Cake       | Seafood
              2 | Marys Healthy Mix      | Beverages
              2 | Marys Healthy Mix      | Condiments
              2 | Marys Healthy Mix      | Confections
              2 | Marys Healthy Mix      | Dairy Products
              2 | Marys Healthy Mix      | Grains/Cereals
              2 | Marys Healthy Mix      | Meat/Poultry
              2 | Marys Healthy Mix      | Produce
              2 | Marys Healthy Mix      | Seafood
              3 | Peters Scary Stuff     | Beverages
              3 | Peters Scary Stuff     | Condiments
              3 | Peters Scary Stuff     | Confections
              3 | Peters Scary Stuff     | Dairy Products
              3 | Peters Scary Stuff     | Grains/Cereals
              3 | Peters Scary Stuff     | Meat/Poultry
              3 | Peters Scary Stuff     | Produce
              3 | Peters Scary Stuff     | Seafood
              4 | Jims Secret Recipe     | Beverages
              4 | Jims Secret Recipe     | Condiments
              4 | Jims Secret Recipe     | Confections
              4 | Jims Secret Recipe     | Dairy Products
              4 | Jims Secret Recipe     | Grains/Cereals
              4 | Jims Secret Recipe     | Meat/Poultry
              4 | Jims Secret Recipe     | Produce
              4 | Jims Secret Recipe     | Seafood
              5 | Elisabeths Best Apples | Beverages
              5 | Elisabeths Best Apples | Condiments
              5 | Elisabeths Best Apples | Confections
              5 | Elisabeths Best Apples | Dairy Products
              5 | Elisabeths Best Apples | Grains/Cereals
              5 | Elisabeths Best Apples | Meat/Poultry
              5 | Elisabeths Best Apples | Produce
              5 | Elisabeths Best Apples | Seafood
              6 | Janes Favorite Cheese  | Beverages
              6 | Janes Favorite Cheese  | Condiments
              6 | Janes Favorite Cheese  | Confections
              6 | Janes Favorite Cheese  | Dairy Products
              6 | Janes Favorite Cheese  | Grains/Cereals
              6 | Janes Favorite Cheese  | Meat/Poultry
              6 | Janes Favorite Cheese  | Produce
              6 | Janes Favorite Cheese  | Seafood
              7 | Billys Home Made Pizza | Beverages
              7 | Billys Home Made Pizza | Condiments
              7 | Billys Home Made Pizza | Confections
              7 | Billys Home Made Pizza | Dairy Products
              7 | Billys Home Made Pizza | Grains/Cereals
              7 | Billys Home Made Pizza | Meat/Poultry
              7 | Billys Home Made Pizza | Produce
              7 | Billys Home Made Pizza | Seafood
              8 | Ellas Special Salmon   | Beverages
              8 | Ellas Special Salmon   | Condiments
              8 | Ellas Special Salmon   | Confections
              8 | Ellas Special Salmon   | Dairy Products
              8 | Ellas Special Salmon   | Grains/Cereals
              8 | Ellas Special Salmon   | Meat/Poultry
              8 | Ellas Special Salmon   | Produce
              8 | Ellas Special Salmon   | Seafood
              9 | Roberts Rich Spaghetti | Beverages
              9 | Roberts Rich Spaghetti | Condiments
              9 | Roberts Rich Spaghetti | Confections
              9 | Roberts Rich Spaghetti | Dairy Products
              9 | Roberts Rich Spaghetti | Grains/Cereals
              9 | Roberts Rich Spaghetti | Meat/Poultry
              9 | Roberts Rich Spaghetti | Produce
              9 | Roberts Rich Spaghetti | Seafood
             10 | Mias Popular Ice       | Beverages
             10 | Mias Popular Ice       | Condiments
             10 | Mias Popular Ice       | Confections
             10 | Mias Popular Ice       | Dairy Products
             10 | Mias Popular Ice       | Grains/Cereals
             10 | Mias Popular Ice       | Meat/Poultry
             10 | Mias Popular Ice       | Produce
             10 | Mias Popular Ice       | Seafood
(80 rows)

*/



-- PostgreSQL UNION Operator--
/*
• UNION:
• The UNION operator is used to combine the result-set of two or more queries.
• The queries in the union must follow these rules:
	• They must have the same number of columns
	• The columns must have the same data types
	• The columns must be in the same order

*/
SELECT product_id, product_name
FROM products
UNION
SELECT testproduct_id, product_name
FROM testproducts
ORDER BY product_id;

/*
• UNION vs UNION ALL
• With the UNION operator, if some rows in the two queries returns the exact same result, 
  only one row will be listed, because UNION selects only distinct values.
• Use UNION ALL to return duplicate values.
*/
SELECT product_id
FROM products
UNION ALL
SELECT testproduct_id
FROM testproducts
ORDER BY product_id;

-- PostgreSQL GROUP BY Clause--

/*
• GROUP BY:
• The GROUP BY clause groups rows that have the same values into summary rows, like "find the number of 
  customers in each country".
• The GROUP BY clause is often used with aggregate functions like COUNT(), MAX(), MIN(), SUM(), AVG() 
  to group the result-set by one or more columns.
*/
-- Lists the number of customers in each country:
SELECT COUNT(customer_id), country
FROM customers
GROUP BY country;

-- GROUP BY With JOIN
SELECT customers.customer_name, COUNT(orders.order_id)
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customer_name;

-- PostgreSQL HAVING  Clause --
/*
• HAVING
• The HAVING clause was added to SQL because the WHERE clause cannot be used with aggregate functions.
• Aggregate functions are often used with GROUP BY clauses, and by adding HAVING we can write condition
  like we do with WHERE clauses.
*/
-- List only countries that are represented more than 5 times:
SELECT COUNT(customer_id), country
FROM customers
GROUP BY country
HAVING COUNT(customer_id) > 5;
-- More Examples 
-- The following SQL statement lists only orders with a total price of 400$ or more:
SELECT order_details.order_id, SUM(products.price)
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
GROUP BY order_id
HAVING SUM(products.price) > 400.00;
-- Lists customers that have ordered for 1000$ or more:
SELECT customers.customer_name, SUM(products.price)
FROM order_details
LEFT JOIN products ON order_details.product_id = products.product_id
LEFT JOIN orders ON order_details.order_id = orders.order_id
LEFT JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customer_name
HAVING SUM(products.price) > 1000.00;

-- PostgreSQL EXISTS Operator --
/*
• EXISTS: 
• The EXISTS operator is used to test for the existence of any record in a sub query.
• The EXISTS operator returns TRUE if the sub query returns one or more records.
*/
SELECT customers.customer_name
FROM customers
WHERE EXISTS (
  SELECT order_id
  FROM orders
  WHERE customer_id = customers.customer_id
);

-- The result in example above showed that 89 customers had at least one order in the orders table.
-- Return all customers that is NOT represented in the orders table:
SELECT customers.customer_name
FROM customers
WHERE NOT EXISTS (
  SELECT order_id
  FROM orders
  WHERE customer_id = customers.customer_id
);

-- PostgreSQL ANY Operator --
/*
• The ANY operator allows you to perform a comparison between a single column value and a range of other values.
• The ANY operator:
	• returns a Boolean value as a result
	• returns TRUE if ANY of the sub query values meet the condition
• ANY means that the condition will be true if the operation is true for any of the values in the range.
*/
-- List products that have ANY records in the order_details table with a quantity larger than 120:
SELECT product_name
FROM products
WHERE product_id = ANY (
  SELECT product_id
  FROM order_details
  WHERE quantity > 120
);


-- PostgreSQL ALL Operator --
/*
• ALL
• The ALL operator:
	• returns a Boolean value as a result
	• returns TRUE if ALL of the sub query values meet the condition
	• is used with SELECT, WHERE and HAVING statements
• ALL means that the condition will be true only if the operation is true for all values in the range.

*/
-- List the products if ALL the records in the order_details with quantity larger than 10.
SELECT product_name
FROM products
WHERE product_id = ALL (
  SELECT product_id
  FROM order_details
  WHERE quantity > 10
);

-- PostgreSQL CASE Expression --
/*
• CASE:
• The CASE expression goes through conditions and returns a value when the first condition is met 
  (like an if-then-else statement).
• Once a condition is true, it will stop reading and return the result. If no conditions are true, 
  it returns the value in the ELSE clause.
• If there is no ELSE part and no conditions are true, it returns NULL.
*/
-- Return specific values if the price meets a specific condition:
SELECT product_name,
CASE
  WHEN price < 10 THEN 'Low price product'
  WHEN price > 50 THEN 'High price product'
ELSE
  'Normal product'
END
FROM products;

/*
• With an Alias
• When a column name is not specified for the "case" field, the parser uses case as the column name.
• To specify a column name, add an alias after the END keyword.
*/
SELECT product_name,
CASE
  WHEN price < 10 THEN 'Low price product'
  WHEN price > 50 THEN 'High price product'
ELSE
  'Normal product'
END AS "price category"
FROM products;