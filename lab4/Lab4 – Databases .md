# Gleb Osotov – Lab 4

## Exercise 1

- Order countries by id asc, then show the 12th to 17th rows.

  $\tau _ {country\_id}(\sigma_{country\_id<=17\; AND \; country\_id >= 12}(country))$

  `SELECT * `

  `FROM country `

  `WHERE country_id>=12 AND country_id<=17 `

  `ORDER BY country_id ASC;` 

  

- List all addresses in a city whose name starts with 'A’.

​		`SELECT * `

​		`	FROM city `

​		`	WHERE city LIKE 'A%';`

- List all customers' first name, last name and the city they live in.

  $CUSTOMERS \leftarrow \sigma_{first\_name, last\_name, city}(JOIN2)$

  $JOIN2 \leftarrow customer \Join_{address\_id=address\_id}address\Join_{city\_id=city\_id}city$

  `SELECT first_name, last_name, city `

  `FROM customer `

  `INNER JOIN address `

  `ON customer.address_id = address.address_id `

  `INNER JOIN city `

  `ON address.city_id = city.city_id;`

- Find all customers with at least one payment whose amount is

  greater than 11 dollars.

  `SELECT first_name, last_name FROM customer JOIN payment ON customer.customer_id = payment.customer_id WHERE amount>11`

- Find all duplicated first names in the customer table.

  `SELECT first_name  FROM customer GROUP BY first_name HAVING COUNT(*) > 1 `

## Exercise 2

```sql
CREATE VIEW adultfilms AS SELECT title, length, release_year FROM film WHERE rating = 'R'; 

CREATE VIEW bigmoney AS SELECT first_name, last_name FROM customer JOIN payment ON customer.customer_id = payment.customer_id WHERE amount >10; 
```

```sql
CREATE TRIGGER test_trigger  INSTEAD OF INSERT  ON staff  FOR EACH ROW  EXECUTE PROCEDURE test();


```

```sql
CREATE OR REPLACE FUNCTION test()  RETURNS trigger AS  

$$

BEGIN       

INSERT INTO customer(first_name,last_name, address_id,store_id,last_update)       VALUES(NEW.first_name,NEW.last_name, NEW.address_id,NEW.store_id,current_date);    

RETURN NEW;

END;  

$$

LANGUAGE 'plpgsql';


```

```sql
INSERT INTO staff(first_name,last_name, address_id,store_id,username) VALUES ('Giancarlo', 'Succi',3,2,'succi') 


```

```sql
select * FROM customer WHERE last_name = 'Succi'
```

