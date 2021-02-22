import psycopg2
# from faker import Faker

# change these to connect
user = "glebosotov"
password = ""

""" 
We create two indexes: for column "name" and "address". 
Since we use query select where name = ..., it makes sense
to make a hash index for that one. With select where like '...',
it makes sense to use b-tree index. Indeed the costs went down drastically
"""

""" 
my output for script:
Database opened successfully
Costs for queries without indexes: one is SELECT where = ..., another is SELECT where LIKE ...
(cost=0.00..4283.00 rows=2 width=211)
(cost=0.00..4283.00 rows=10 width=211)
Created indexes, new costs...
(cost=4.02..11.89 rows=2 width=211)
(cost=4.85..162.03 rows=10 width=211)
"""


def filter_cost(result):
    return result[result.find('cost')-1:result.find(')')+1]


con = psycopg2.connect(database="customers", user=user,
                       password=password, host="127.0.0.1", port="5432")

print("Database opened successfully")
cur = con.cursor()
cur.execute("DROP index if exists customer_name_hash")
cur.execute("DROP index if exists customer_address_btree")


print("Costs for queries without indexes: one is SELECT where = ..., another is SELECT where LIKE ...")
cur.execute(
    "EXPLAIN analyze SELECT * FROM customer WHERE name ='Bonnie Williams'")
print(filter_cost(str(cur.fetchone())))


cur.execute(
    "EXPLAIN analyze SELECT * FROM customer WHERE address LIKE 'G%'")
print(filter_cost(str(cur.fetchone())))

cur.execute("CREATE index customer_name_hash ON customer using hash(name);")
cur.execute(
    "CREATE index customer_address_btree ON customer using btree(address);")
print("Created indexes, new costs...")
cur.execute(
    "EXPLAIN analyze SELECT * FROM customer WHERE name ='Bonnie Williams'")
print(filter_cost(str(cur.fetchone())))

cur.execute(
    "EXPLAIN analyze SELECT * FROM customer WHERE address LIKE 'G%'")
print(filter_cost(str(cur.fetchone())))


con.commit()
cur.close()
con.close()
