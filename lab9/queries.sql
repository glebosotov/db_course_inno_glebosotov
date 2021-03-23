--making first table
create table banking (id SERIAL PRIMARY KEY, name VARCHAR, credit DOUBLE PRECISION);

-- T1
 DO 
 $$ BEGIN
--trying to update the table 
SAVEPOINT save; 
UPDATE banking
SET credit = credit - 500
WHERE name = 'name1'; 
UPDATE banking 
SET credit = credit + 500
WHERE name = 'name3';
--error checking mechanism 
COMMIT; 
 END $$ 
 

-- Adding BankName
ALTER TABLE banking ADD bank_name VARCHAR;

-- inserting fees account
INSERT INTO banking (name, credit, bank_name)
VALUES ('fees_account', 0, 'gov');

--adding banknames to existing accounts
UPDATE banking SET bank_name = 'Tinkoff' where name = 'name2';
UPDATE banking SET bank_name = 'SpearBank' WHERE name = 'name1' or name = 'name3';

--showwing balance for all accounts
select name, credit from banking order by id

CREATE TABLE ledger (id SERIAL PRIMARY KEY, from_id SERIAL, to_id SERIAL, fee DOUBLE PRECISION, amount DOUBLE PRECISION, transaction_date_time TIMESTAMP);