from flask import Blueprint, jsonify, abort, request
from models import Flight, db

bp = Blueprint("flights", __name__, url_prefix="/flights")


# GET's all from flights
@bp.route("", methods=["GET"])  # decorator takes path and list of HTTP verbs
def index():
    flight = Flight.query.all()  # ORM performs SELECT query
    result = []
    for f in flight:
        result.append(f.serialize())  # build list of users as dictionaries
    return jsonify(result)  # return JSON response


# GET by flight id
@bp.route("/<int:id>", methods=["GET"])
def show(id: int):
    f = Flight.query.get_or_404(id)
    return jsonify(f.serialize())