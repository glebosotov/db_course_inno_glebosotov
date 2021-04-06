## Exercise 1

After **step 4** terminals show different outputs, because in `repeatable read`, `dirty read` is not possible

 ![Screenshot 2021-04-06 at 09.54.23](./readme.assets/Screenshot 2021-04-06 at 09.54.23.png)

After **step 8** serialisation anomaly occurred



![Screenshot 2021-04-06 at 10.06.52](./readme.assets/Screenshot 2021-04-06 at 10.06.52.png)



## Exercise 2

### Read commited & repeatable read

For both these isolation levels, until T2 was commited, T1 will not update Bob's `group_id`. 



![Screenshot 2021-04-06 at 10.14.06](./readme.assets/Screenshot 2021-04-06 at 10.14.06.png)



![Screenshot 2021-04-06 at 10.25.13](./readme.assets/Screenshot 2021-04-06 at 10.25.13.png)



## Exercise 3

In both cases the T1 can not see the change. Mike's balance is doubled in both cases.