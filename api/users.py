from flask import Blueprint, jsonify, abort, request
from models import User, db, user_trips

bp = Blueprint("users", __name__, url_prefix="/users")


""" 
DHS and US Customs and Border Patrol require airlines to keep passenger
records (Passenger Name Record, aka PNR) on all domestic flights in the US for 10 years.
So this DB will not have a DELETE route for tables relating to Users, Trips, and Flights.
Other tables not related will have a DELETE route
"""


# GET's all from users
@bp.route("", methods=["GET"])  # decorator takes path and list of HTTP verbs
def index():
    users = User.query.all()  # ORM performs SELECT query
    result = []
    for u in users:
        result.append(u.serialize())  # build list of users as dictionaries
    return jsonify(result)  # return JSON response


# GET by user id
@bp.route("/<int:id>", methods=["GET"])
def show(id: int):
    t = User.query.get_or_404(id)
    return jsonify(t.serialize())


# Updates username and password of user
@bp.route("/<int:id>", methods=["PATCH", "PUT"])
def update(id: int):
    u = User.query.get_or_404(id)
    # Username must be included
    if "username" not in request.json and "password" not in request.json:
        return abort(400)
    # Username must be 5 or more characters and password must be 8 or more characters
    if len(request.json["username"]) < 5 or len(request.json["password"]) < 8:
        return abort(400)
    u.username = request.json["username"]
    u.password = request.json["password"]
    try:
        db.session.commit()
        return jsonify(u.serialize())
    except:
        return jsonify(False)
    
    
# Get user by id#
@bp.route('/<int:id>/user_trips', methods=['GET'])
def user_trip(id: int):
    u = User.query.get_or_404(id)
    result = []
    for i in u.user_trips:
        result.append(i.serialize())
    return jsonify(result)
