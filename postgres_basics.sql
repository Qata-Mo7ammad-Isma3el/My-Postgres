/* for multiple comments */
-- for single comment
/*
• Note: in SQL shell the Always end SQL statements with a semicolon ;
• SQL Shell waits for the semicolon and executes all lines as one SQL statement.
• A multiple lines SQL statement is not executed before we include a semicolon at the end.
*/

/*
PostgreSQL Data Types List

----------------------------------
      Character / Text Types
----------------------------------
• VARCHAR(n)
    Description: Variable-length string with limit n. Example: VARCHAR(255)

• CHAR(n)
    Description: Fixed-length string. Pads with spaces if shorter.

• TEXT
    Description: Unlimited-length text. Most commonly used instead of long VARCHAR.

----------------------------------
        Numeric Types
----------------------------------
Integers

    • SMALLINT
        Range: −32,768 to +32,767

    • INTEGER or INT
        Range: −2.1B to +2.1B

    • BIGINT
        Range: Very large integers (64-bit)

Auto-incrementing

    • SERIAL
        Description: Auto-increment INT (deprecated in favor of identity)

    • BIGSERIAL
        Description: Auto-increment BIGINT

    • GENERATED ALWAYS AS IDENTITY
        Description: Modern SQL-standard auto-increment

Decimals

    • NUMERIC(p, s)
        Description: Exact numeric (e.g., NUMERIC(10, 2))

    • DECIMAL(p, s)
        Description: Same as NUMERIC

    • REAL
        Description: 4-byte floating point

    • DOUBLE PRECISION
        Description: 8-byte floating point

----------------------------------
        Date / Time Types
----------------------------------
• DATE
    Description: Only date

• TIME
    Description: Time without timezone

• TIMETZ
    Description: Time with timezone

• TIMESTAMP
    Description: Date + time (no timezone)

• TIMESTAMPTZ
    Description: Date + time with timezone (recommended)

• INTERVAL
    Description: Duration (e.g., INTERVAL '3 days')

----------------------------------
            Boolean
----------------------------------
• BOOLEAN
    Values: TRUE, FALSE, NULL

----------------------------------
        Binary / Byte Types
----------------------------------
• BYTEA
    Description: Binary data (images, files, etc.)

----------------------------------
        Geometric Types
----------------------------------
• POINT
    Example: (1,2)

• LINE
    Description: Line geometry

• CIRCLE
    Description: Circle shape

----------------------------------
            JSON Types
----------------------------------
• JSON
    Description: Text JSON (slower)

• JSONB
    Description: Binary JSON (indexed + fast) — recommended

----------------------------------
              UUID
----------------------------------
• UUID
    Description: 128-bit universal ID

----------------------------------
          Network Types
----------------------------------
• INET
    Description: IP address + mask

• CIDR
    Description: Network

• MACADDR
    Description: MAC address

----------------------------------
              Arrays
----------------------------------
• type[]
    Description: Array of any datatype — e.g., INT[], TEXT[]

----------------------------------
              Enum
----------------------------------
• ENUM
    Description: Predefined set of values
    Example: CREATE TYPE status AS ENUM ('pending', 'done', 'failed');

----------------------------------
           Range Types
----------------------------------
• int4range
    Example: integer range

• numrange
    Example: numeric range

• tsrange
    Example: timestamp range

*/


/*
• Primary Key (PK) Vs. Foreign Key (FK) Explained

• Primary Key (PK)
    • A primary key is the main ID of a row in a table.
    • It must be unique.
    • It cannot be empty (NOT NULL).
    • Each table has only one primary key.

Example:
users.id is the primary key that uniquely identifies each user.

---

• Foreign Key (FK)
    • A foreign key is a value in one table that points to the primary key in another table.
    • It creates a relationship between tables.
    • It makes sure the referenced row actually exists (enforces referential integrity).

Example:
orders.user_id is a foreign key that points to users.id, meaning the order belongs to that user.

---
• In simple words:
• Primary key = the table’s own unique ID.
• Foreign key = a link to another table’s ID.
*/





-- PostgreSQL CREATE TABLE --
CREATE TABLE cars (
  brand VARCHAR(255),
  model VARCHAR(255),
  year INT
);

-- PostgreSQL INSERT INTO --
INSERT INTO cars (brand, model, year)
VALUES ('Ford', 'Mustang', 1964);
-- INSERT Multiple Rows
INSERT INTO cars (brand, model, year)
VALUES
  ('Volvo', 'p1800', 1968),
  ('BMW', 'M1', 1978),
  ('Toyota', 'Celica', 1975);

-- PostgreSQL Fetch Data --
SELECT brand, year FROM cars;
-- Return ALL Columns
SELECT * FROM cars;

-- PostgreSQL ADD COLUMN --
/*
The ALTER TABLE Statement:
• To add a column to an existing table, we have to use the ALTER TABLE statement.
• The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
• The ALTER TABLE statement is also used to add and drop various constraints on an existing table.
*/
ALTER TABLE cars
ADD color VARCHAR(255); -- VARCHAR(n) is a Variable-length string with limit n.

-- PostgreSQL UPDATE --
UPDATE cars
SET color = 'red'
WHERE brand = 'Volvo';
-- Note : Be careful with the WHERE clause, in the example above ALL rows where brand = 'Volvo' gets updated.
-- Note: Without the WHERE clause, ALL records will be updated.

-- PostgreSQL ALTER COLUMN --
/*
• To change the data type, or the size of a table column we have to use the ALTER TABLE statement.
• The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
• The ALTER TABLE statement is also used to add and drop various constraints on an existing table.
*/
-- Task: We want to change the data type of the year column of the cars table from INT to VARCHAR(4).
-- Note: Some data types cannot be converted if the column has value. E.g. numbers can always be converted to text, but text cannot always be converted to numbers.
ALTER TABLE cars
ALTER COLUMN year TYPE VARCHAR(4);


-- PostgreSQL DROP COLUMN --
/*
• To remove a column from a table, we have to use the ALTER TABLE statement.
• The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
• The ALTER TABLE statement is also used to add and drop various constraints on an existing table.
*/

ALTER TABLE cars
DROP COLUMN color;


-- PostgreSQL DELETE --
-- • The DELETE statement is used to delete existing records in a table.
/*
Note: Be careful when deleting records in a table! Notice the WHERE clause in the DELETE statement. 
The WHERE clause specifies which record(s) should be deleted.
• If you omit the WHERE clause, all records in the table will be deleted!.
*/

DELETE FROM cars
WHERE brand = 'Volvo';

-- PostgreSQL DROP TABLE --
/*
Note: Be careful before dropping a table. Deleting a table will result in loss of all information 
stored in the table!
*/ 
DROP TABLE cars;




