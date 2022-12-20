from flask_sqlalchemy import SQLAlchemy



db = SQLAlchemy()

#User Trips relational table
user_trips = db.Table(
    "user_trips",
    db.Column("id", db.Integer, primary_key=True, autoincrement=True),
    db.Column("user_id", db.Integer, db.ForeignKey("users.id"), primary_key=True),
    db.Column("trip_id", db.Integer, db.ForeignKey("trips.id"), primary_key=True),
)

class User(db.Model):
    __tablename__ = "users"

    def __init__(
        self,
        first_name: str,
        last_name: str,
        email: str,
        phone_num: int,
        d_o_b: int,
        username: str,
        password: str,
    ):
        self.first_name = first_name
        self.last_name = last_name
        self.email = email
        self.phone_num = phone_num
        self.d_o_b = d_o_b
        self.username = username
        self.password = password

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(50), nullable=False)
    last_name = db.Column(db.String(50), nullable=False)
    email = db.Column(db.String(80), unique=True, nullable=False)
    phone_num = db.Column(db.Numeric, nullable=False)
    d_o_b = db.Column(db.Date, nullable=False)
    username = db.Column(db.String(20), unique=True, nullable=False)
    password = db.Column(db.String(20), nullable=False)
    trips = db.relationship('Trip', secondary=user_trips, backref='trips')

    def serialize(self):
        return {
            "id": self.id,
            "first_name": self.first_name,
            "last_name": self.last_name,
            "email": self.email,
            "phone_num": self.phone_num,
            "d_o_b": self.d_o_b.isoformat(),
            "username": self.username,
            "password": self.password,
        }



class Trip(db.Model):
    __tablename__ = "trips"

    def __init__(self, trip_num: int, date: int, hotel_id:int, rental_car_id:int, flight_id=int):
        self.trip_num = trip_num
        self.date = date
        self.hotel_id = hotel_id
        self.rental_car = rental_car_id
        self.flight_id = flight_id

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    trip_num = db.Column(db.Integer, unique=True, nullable=False)
    date = db.Column(db.Date, nullable=False)
    hotel_id = db.Column(db.Integer, db.ForeignKey('hotels.id'), nullable=True)
    rental_car_id = db.Column(db.Integer, db.ForeignKey('rental_cars.id'), nullable=True)
    flight_id = db.Column(db.Integer, db.ForeignKey('flights.id'), nullable=False)
    user_trip = db.relationship(
        'User', secondary=user_trips,
        lazy='subquery',
        backref = db.backref('user_trips', lazy=True))

    def serialize(self):
        return {
            "id": self.id, 
            "trip_num": self.trip_num, 
            "date": self.date.isoformat(),
            "hotel":self.hotel_id,
            "rental_car":self.rental_car_id,
            "flight":self.flight_id
            }



class Flight(db.Model):
    __tablename__ = 'flights'
    
    def __init__(self, flight_num: int, date: int, orgin_id:int, destination_id: int, airline_id: int):
        self.flight_num = flight_num
        self.date = date
        self.orgin_id = orgin_id
        self.destination_id = destination_id
        self.airline_id = airline_id
        
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    flight_num = db.Column(db.Integer, unique=True, nullable=False)
    date = db.Column(db.Date, nullable=False)
    orgin_id = db.Column(db.Integer, db.ForeignKey('cities.id'), nullable=False)
    destination_id = db.Column(db.Integer, db.ForeignKey('cities.id'), nullable=False)
    airline_id = db.Column(db.Integer, db.ForeignKey('airlines.id'), nullable=False)
   
    def serialize(self):
        return {
            "id":self.id, 
            "flight_num": self.flight_num,
            "date":self.date.isoformat(), 
            "orgin_id":self.orgin_id, 
            "destination_id":self.destination_id,
            "airline_id":self.airline_id
            }
        
        
class Hotel(db.Model):
    __tablename__ = 'hotels'
    
    def __init__(self, name: str):
        self.name = name
        
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(80), unique=True, nullable=False)
    
    def serialize(self):
        return{
            "id":self.id,
            "name":self.name
        }
       
        
class RentalCar(db.Model):
    __tablename__ = 'rental_cars'
    
    def __init__(self, name: str):
        self.name = name
        
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(80), unique=True, nullable=False)
    
    def serialize(self):
        return{
            "id":self.id,
            "name":self.name
        }
        
        
class Airline(db.Model):
    __tablename__ = 'airlines'
    
    def __init__(self, name:str):
        self.name = name
        
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(80), nullable=False)
    
    def serialize(self):
        return{
            'id':self.id,
            'name':self.name
        }
        
        
class City(db.Model):
    __tablename__ = 'cities'
    
    def __init__(self, city:str, state:str):
        self.city = city
        self.state = state
        
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    city = db.Column(db.String(50), nullable=False)
    state = db.Column(db.String(2), nullable=False)
    
    def serialize(self):
        return{
            'id':self.id,
            'city':self.city,
            'state':self.state
        }