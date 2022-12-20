from flask import Blueprint, jsonify, abort, request
from models import City, db

bp = Blueprint("cities", __name__, url_prefix="/cities")


# GET's all from Rentalcars
@bp.route("", methods=["GET"])  # decorator takes path and list of HTTP verbs
def index():
    city = City.query.all()  # ORM performs SELECT query
    result = []
    for c in city:
        result.append(c.serialize())  # build list of users as dictionaries
    return jsonify(result)  # return JSON response


# GET by City id
@bp.route("/<int:id>", methods=["GET"])
def show(id: int):
    c = City.query.get_or_404(id)
    return jsonify(c.serialize())


# Changes name of City
@bp.route("/<int:id>", methods=["PATCH", "PUT"])
def update(id: int):
    c = City.query.get_or_404(id)
    if "name" not in request.json:
        return abort(400)
    c.name = request.json["name"]
    try:
        db.session.commit()
        return jsonify(c.serialize())
    except:
        return jsonify(False)


# Creates new City
@bp.route("", methods=["POST"])
def create():
    # req body must contain name
    if "name" not in request.json:
        return abort(400)
    # construct City
    c = City(name=request.json["name"])
    db.session.add(c)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(c.serialize())


# Delete City
@bp.route("/<int:id>", methods=["DELETE"])
def delete(id: int):
    c = City.query.get_or_404(id)
    try:
        db.session.delete(c)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)
