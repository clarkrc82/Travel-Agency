from flask_sqlalchemy import SQLAlchemy
import datetime

db = SQLAlchemy()

# class for users
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
    trips = db.relationship('Trip', backref='user')

    def serialize(self):
        return {
            "id": self.id,
            "first_name": self.first_name,
            "last_name": self.last_name,
            "email": self.email,
            "phone_num": self.phone_num,
            "d_o_b": self.d_o_b,
            "username": self.username,
            "password": self.password,
        }


user_trips = db.Table(
    "user_trips",
    db.Column("id", db.Integer, primary_key=True, autoincrement=True),
    db.Column("user_id", db.Integer, db.ForeignKey("users.id"), primary_key=True),
    db.Column("trip_id", db.Integer, db.ForeignKey("trips.id"), primary_key=True),
)


class Trip(db.Model):
    __tablename__ = "trips"

    def __init__(self, trip_num: int, date: int):
        self.trip_num = trip_num
        self.date = date

    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    trip_num = db.Column(db.Integer, unique=True, nullable=False)
    date = db.Column(db.Date, nullable=False)
    user_trips = db.relationship('User', backref='trip')


    def serialize(self):
        return {"id": self.id, "trip_num": self.trip_num, "date": self.date.isoformat()}
