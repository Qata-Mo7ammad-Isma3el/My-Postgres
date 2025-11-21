# My PostgreSQL Learning Repository

A comprehensive collection of PostgreSQL tutorials, syntax examples, and a demo database for learning and reference.

## 📁 Repository Contents

### 1. `Create_Demo_Database.sql`
A complete demo database setup with sample data including:
- **Categories** - 8 product categories
- **Customers** - 91 customer records from various countries
- **Products** - 77 products with pricing and categorization
- **Orders** - 830 order records spanning 2021-2023
- **Order Details** - Detailed order line items with quantities

This database is perfect for practicing SQL queries, joins, and aggregations.

### 2. `postgres_basics.sql`
Fundamental PostgreSQL operations and concepts:
- Table creation and manipulation
- Data insertion and updates
- Column management (ADD, ALTER, DROP)
- Basic CRUD operations
- Data retrieval and filtering
- Aggregate functions (MIN, MAX, COUNT, SUM, AVG)
- Sorting and limiting results

### 3. `PostgreSQL_Syntax.sql`
Advanced PostgreSQL syntax and operations:
- **WHERE clause operators** (=, <, >, LIKE, ILIKE, AND, OR, IN, BETWEEN, IS NULL)
- **Joins** (INNER, LEFT, RIGHT, FULL, CROSS)
- **UNION** operations
- **GROUP BY** and **HAVING** clauses
- **Subqueries** and advanced filtering (EXISTS, ANY, ALL)
- **CASE** expressions
- **Aliases** and column concatenation

## 🔑 Key Concepts Covered

### Data Types
Comprehensive coverage of PostgreSQL data types including:
- Character/Text types (VARCHAR, CHAR, TEXT)
- Numeric types (INT, BIGINT, NUMERIC, DECIMAL)
- Date/Time types (DATE, TIMESTAMP, INTERVAL)
- Boolean, JSON/JSONB, UUID
- Arrays, Enums, and more

### Primary Keys vs Foreign Keys
- **Primary Key (PK)**: Unique identifier for table rows
- **Foreign Key (FK)**: Reference to another table's primary key, establishing relationships

### Database Operations

#### Basic Operations
```sql
-- Create table
CREATE TABLE cars (brand VARCHAR(255), model VARCHAR(255), year INT);

-- Insert data
INSERT INTO cars (brand, model, year) VALUES ('Ford', 'Mustang', 1964);

-- Query data
SELECT * FROM cars WHERE brand = 'Ford';

-- Update records
UPDATE cars SET color = 'red' WHERE brand = 'Volvo';

-- Delete records
DELETE FROM cars WHERE brand = 'Volvo';
```

#### Advanced Features
- Pattern matching with `LIKE` and `ILIKE`
- Range queries with `BETWEEN`
- Set operations with `IN`
- Complex joins across multiple tables
- Aggregations with `GROUP BY`
- Conditional filtering with `HAVING`
- Dynamic values with `CASE` expressions

## 📊 Sample Database Schema

```
categories
├── category_id (PK)
├── category_name
└── description

customers
├── customer_id (PK)
├── customer_name
├── contact_name
├── address
├── city
├── postal_code
└── country

products
├── product_id (PK)
├── product_name
├── category_id (FK)
├── unit
└── price

orders
├── order_id (PK)
├── customer_id (FK)
└── order_date

order_details
├── order_detail_id (PK)
├── order_id (FK)
├── product_id (FK)
└── quantity
```

## 🚀 Getting Started

### Prerequisites
- PostgreSQL installed on your system
- A PostgreSQL client (psql, pgAdmin, or any SQL IDE)

### Setup
1. Clone or download this repository
2. Connect to your PostgreSQL server
3. Run `Create_Demo_Database.sql` to set up the demo database:
   ```bash
   psql -U your_username -d your_database -f Create_Demo_Database.sql
   ```
4. Explore the syntax examples in `postgres_basics.sql` and `PostgreSQL_Syntax.sql`

## 💡 Usage Examples

### Query customers from specific countries
```sql
SELECT * FROM customers
WHERE country IN ('Germany', 'France', 'UK');
```

### Find products in a price range
```sql
SELECT * FROM products
WHERE price BETWEEN 10 AND 50
ORDER BY price DESC;
```

### Join products with categories
```sql
SELECT product_name, category_name, price
FROM products
INNER JOIN categories ON products.category_id = categories.category_id;
```

### Count orders per customer
```sql
SELECT customers.customer_name, COUNT(orders.order_id) AS total_orders
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name
HAVING COUNT(orders.order_id) > 5;
```

## 📚 Learning Path

1. **Start with basics** - `postgres_basics.sql`
   - Learn table creation and basic CRUD operations
   - Understand data types and constraints
   
2. **Practice with demo data** - `Create_Demo_Database.sql`
   - Run sample queries on real data
   - Experiment with different operations

3. **Master advanced syntax** - `PostgreSQL_Syntax.sql`
   - Practice joins and subqueries
   - Learn aggregation and grouping
   - Explore conditional logic with CASE

## 🔍 Key SQL Operators Reference

| Operator | Description | Example |
|----------|-------------|---------|
| `=` | Equal to | `WHERE country = 'USA'` |
| `<>` or `!=` | Not equal to | `WHERE price <> 0` |
| `>`, `<`, `>=`, `<=` | Comparison | `WHERE price > 50` |
| `LIKE` | Pattern match (case-sensitive) | `WHERE name LIKE 'A%'` |
| `ILIKE` | Pattern match (case-insensitive) | `WHERE name ILIKE 'a%'` |
| `IN` | Match any value in list | `WHERE country IN ('USA', 'UK')` |
| `BETWEEN` | Range (inclusive) | `WHERE price BETWEEN 10 AND 20` |
| `IS NULL` | Check for NULL | `WHERE email IS NULL` |
| `AND`, `OR` | Logical operators | `WHERE price > 10 AND stock > 0` |

## 🤝 Contributing

Feel free to add more examples, fix errors, or suggest improvements by creating a pull request.

## 📝 Notes

- All SQL statements should end with a semicolon (`;`)
- PostgreSQL is case-insensitive for keywords but case-sensitive for identifiers (unless quoted)
- Use `ILIKE` instead of `LIKE` for case-insensitive pattern matching
- NULL values are handled specially - use `IS NULL` or `IS NOT NULL`, not `= NULL`

## 📖 Additional Resources

- [Official PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [PostgreSQL Tutorial](https://www.postgresqltutorial.com/)
- [PostgreSQL Exercises](https://pgexercises.com/)

---

**Happy Learning! 🐘**
