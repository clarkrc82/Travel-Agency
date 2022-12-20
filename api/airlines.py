from flask import Blueprint, jsonify, abort, request
from models import Airline, db

bp = Blueprint("airlines", __name__, url_prefix="/airlines")


# GET's all from hotels
@bp.route("", methods=["GET"])  # decorator takes path and list of HTTP verbs
def index():
    airline = Airline.query.all()  # ORM performs SELECT query
    result = []
    for a in airline:
        result.append(a.serialize())  # build list of users as dictionaries
    return jsonify(result)  # return JSON response


# GET by hotel id
@bp.route("/<int:id>", methods=["GET"])
def show(id: int):
    a = Airline.query.get_or_404(id)
    return jsonify(a.serialize())


# Changes name of airline
@bp.route("/<int:id>", methods=["PATCH", "PUT"])
def update(id: int):
    a = Airline.query.get_or_404(id)
    if "name" not in request.json:
        return abort(400)
    a.name = request.json["name"]
    try:
        db.session.commit()
        return jsonify(a.serialize())
    except:
        return jsonify(False)


# Creates new Airline
@bp.route("", methods=["POST"])
def create():
    # req body must contain name
    if "name" not in request.json:
        return abort(400)
    # construct airline
    a = Airline(name=request.json["name"])
    db.session.add(a)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(a.serialize())


# Delete Airline
@bp.route("/<int:id>", methods=["DELETE"])
def delete(id: int):
    a = Airline.query.get_or_404(id)
    try:
        db.session.delete(a)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)
