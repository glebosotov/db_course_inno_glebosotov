SELECT * FROM country WHERE country_id>=12 AND country_id<=17 ORDER BY country_id ASC;
​SELECT * FROM city WHERE city LIKE 'A%';
SELECT first_name, last_name, city FROM customer INNER JOIN address ON customer.address_id = address.address_id INNER JOIN city ON address.city_id = city.city_id;
SELECT first_name, last_name FROM customer JOIN payment ON customer.customer_id = payment.customer_id WHERE amount>11;
SELECT first_name  FROM customer GROUP BY first_name HAVING COUNT(*) > 1;
CREATE VIEW adultfilms AS SELECT title, length, release_year FROM film WHERE rating = 'R';
CREATE VIEW bigmoney AS SELECT first_name, last_name FROM customer JOIN payment ON customer.customer_id = payment.customer_id WHERE amount >10;

--task 2

CREATE OR REPLACE FUNCTION test()  RETURNS trigger AS  

$$

BEGIN       

INSERT INTO customer(first_name,last_name, address_id,store_id,last_update)       VALUES(NEW.first_name,NEW.last_name, NEW.address_id,NEW.store_id,current_date);    

RETURN NEW;

END;  

$$

LANGUAGE 'plpgsql';

CREATE TRIGGER test_trigger  INSTEAD OF INSERT  ON staff  FOR EACH ROW  EXECUTE PROCEDURE test();




--testing

INSERT INTO staff(first_name,last_name, address_id,store_id,username) VALUES ('Giancarlo', 'Succi',3,2,'succi'); 

select * FROM customer WHERE last_name = 'Succi';