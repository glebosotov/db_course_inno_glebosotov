## Gleb Osotov B19-03

#### Lab from week 11

```python
db.restaurants.find()

db.restaurants.find({},{restaurant_id: 1, name:1, borough: 1, cuisine:1}).pretty()

db.restaurants.find({borough:'Bronx'}).limit(5).pretty()

db.restaurants.find( { $or: [
  {cuisine: {$nin: ['American', 'Chinese']}}, 
  {name: /^(Wil)/} 
] },{restaurant_id: 1, name:1, borough: 1, cuisine:1} ).pretty()

db.restaurants.find(
  {name: RegExp('mon')},
  {restaurant_id: 1,name: 1,borough: 1,cuisine: 1,'address.coord': 1,_id: 0}
).pretty()

db.restaurants.find({borough: {$in:['Staten Island', 'Bronx', 'Brooklyn', 'Queens']}},{restaurant_id: 1, name:1, borough: 1, cuisine:1}).pretty()
```

