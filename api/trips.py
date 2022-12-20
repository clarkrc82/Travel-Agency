from flask import Blueprint, jsonify, abort, request
from models import Trip, db

bp = Blueprint("trips", __name__, url_prefix="/trips")


""" 
Trips route will only have 2 options, view all or view specified trip#
Once a trip is established, nothing can be changed or deleted
DHS and US Customs and Border Patrol require airlines to keep passenger
records (Passenger Name Record, aka PNR) on all domestic flights in the US for 10 years.
So this DB will not have a DELETE route for tables relating to Users, Trips, and Flights.
Other tables not related will have a DELETE route
"""


# GET's all from trips
@bp.route("", methods=["GET"])  # decorator takes path and list of HTTP verbs
def index():
    trips = Trip.query.all()  # ORM performs SELECT query
    result = []
    for t in trips:
        result.append(t.serialize())  # build list of users as dictionaries
    return jsonify(result)  # return JSON response


# GET by trip id
@bp.route("/<int:id>", methods=["GET"])
def show(id: int):
    t = Trip.query.get_or_404(id)
    return jsonify(t.serialize())

