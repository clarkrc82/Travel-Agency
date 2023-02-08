
# Travel Agency Database

Database for a madeup Travel Agency. This project is currently a work in progress. 
So far this project consists of:

* Postgress Database
* Flask Migrations 
* Rest API
* Utilizes ORM 


## DB Schema

![App Screenshot](https://user-images.githubusercontent.com/39920381/209209572-e2bbfc65-92f0-4ee3-aa6a-1eb63269307c.png)


## API endpoint example
Running:

```http
  GET {{baseURI}}/users/2/user_trips
```
Returns:
```json
[
	{
		"date": "2022-02-20",
		"flight": 41,
		"hotel": 1,
		"id": 16,
		"rental_car": null,
		"trip_num": 10
	},
	{
		"date": "2022-03-28",
		"flight": 36,
		"hotel": 2,
		"id": 17,
		"rental_car": 5,
		"trip_num": 12
	}
]
```

This shows us how many trips a user has taken, user with id = 2 in this example. 
