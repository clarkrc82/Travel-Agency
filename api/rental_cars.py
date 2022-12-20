from flask import Blueprint, jsonify, abort, request
from models import RentalCar, db

bp = Blueprint("rental_cars", __name__, url_prefix="/rental_cars")


# GET's all from Rentalcars
@bp.route("", methods=["GET"])  # decorator takes path and list of HTTP verbs
def index():
    hotel = RentalCar.query.all()  # ORM performs SELECT query
    result = []
    for r in hotel:
        result.append(r.serialize())  # build list of users as dictionaries
    return jsonify(result)  # return JSON response


# GET by RentalCar id
@bp.route("/<int:id>", methods=["GET"])
def show(id: int):
    r = RentalCar.query.get_or_404(id)
    return jsonify(r.serialize())


# Changes name of RentalCar
@bp.route("/<int:id>", methods=["PATCH", "PUT"])
def update(id: int):
    r = RentalCar.query.get_or_404(id)
    if "name" not in request.json:
        return abort(400)
    r.name = request.json["name"]
    try:
        db.session.commit()
        return jsonify(r.serialize())
    except:
        return jsonify(False)


# Creates new RentalCar
@bp.route("", methods=["POST"])
def create():
    # req body must contain name
    if "name" not in request.json:
        return abort(400)
    # construct RentalCar
    r = RentalCar(name=request.json["name"])
    db.session.add(r)  # prepare CREATE statement
    db.session.commit()  # execute CREATE statement
    return jsonify(r.serialize())


# Delete RentalCar
@bp.route("/<int:id>", methods=["DELETE"])
def delete(id: int):
    r = RentalCar.query.get_or_404(id)
    try:
        db.session.delete(r)  # prepare DELETE statement
        db.session.commit()  # execute DELETE statement
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)
