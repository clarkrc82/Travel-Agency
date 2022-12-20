from flask import Blueprint, jsonify, abort, request
from models import Hotel, db

bp = Blueprint("hotels", __name__, url_prefix="/hotels")


# GET's all from trips
@bp.route("", methods=["GET"])  # decorator takes path and list of HTTP verbs
def index():
    hotel = Hotel.query.all()  # ORM performs SELECT query
    result = []
    for h in hotel:
        result.append(h.serialize())  # build list of users as dictionaries
    return jsonify(result)  # return JSON response


# GET by Hotel id
@bp.route("/<int:id>", methods=["GET"])
def show(id: int):
    h = Hotel.query.get_or_404(id)
    return jsonify(h.serialize())


# Changes name of Hotel
@bp.route("/<int:id>", methods=["PATCH", "PUT"])
def update(id: int):
    h = Hotel.query.get_or_404(id)
    if "name" not in request.json:
        return abort(400)
    h.name = request.json["name"]
    try:
        db.session.commit()
        return jsonify(h.serialize())
    except:
        return jsonify(False)


# Creates new Hotel
@bp.route("", methods=["POST"])
def create():
    # req body must contain name
    if "name" not in request.json:
        return abort(400)
    # construct Hotel
    h = Hotel(name=request.json["name"])
    db.session.add(h)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(h.serialize())


# Delete Hotel
@bp.route("/<int:id>", methods=["DELETE"])
def delete(id: int):
    h = Hotel.query.get_or_404(id)
    try:
        db.session.delete(h)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)
