# AeroPlatziTeam24

## Api Version 1.0

## team 24 Backend

_Francisco Rojas
-Camilo Caldas
_Alan Garcia
_Jhovanny Canencio
### GET



Url:  https://ads.humancode.com.co/api/flights
Response all flights in data base
Status: 200
Body
[
{
    "flights_id": 4,
    "flight_name": "Vuelo 4",
    "origin": "Australia",
    "destination": "Bahamas",
    "date_hour": 1615065820,
    "passengers_quantity": "25",
    "boarding_gate": "2021-03-06 21:24:45",
    "flight_state_id": 2,
    "plane_routes_id": 4
}
]


Url:  https://ads.humancode.com.co/api/flights/{id}


Response a specific flight  ----->  {id} at the end of the url

Example:
https://ads.humancode.com.co/api/flights/2

Status: 200
Body
{
    "flights_id": 5,
    "flight_name": "Vuelo 5",
    "origin": "Bahamas",
    "destination": "Bélgica",
    "date_hour": 1615065820,
    "passengers_quantity": "20",
    "boarding_gate": "2021-03-06 21:24:45",
    "flight_state_id": 3,
    "plane_routes_id": 5
}





### DELETE 

Url: https://ads.humancode.com.co/api/flights/{id}   
specific flight    {id} at the end of the url

Example:
https://ads.humancode.com.co/api/flights/4

Status: 200

Body:

{
    "flights_id": 4,
    "flight_name": "Vuelo 4",
    "origin": "Australia",
    "destination": "Bahamas",
    "date_hour": 1615065820,
    "passengers_quantity": "25",
    "boarding_gate": "2021-03-06 21:24:45",
    "flight_state_id": 2,
    "plane_routes_id": 4
}


### INSERT

Url: https://ads.humancode.com.co/api/flights?origin_id=21&detination_id=23&plane_id=5&passengers_quantity=23&boarding_gate=gate 
Example:

Form-Data

Key: Value

origin_id: 
destination_id:
plane_id:
passengers_quantity:
boarding_gate:
flight_state_id:


Status: 200



