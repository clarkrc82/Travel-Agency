from flask import Blueprint, jsonify, abort, request
from models import  User, db

bp = Blueprint('users', __name__, url_prefix='/users')

@bp.route('', methods=['GET']) # decorator takes path and list of HTTP verbs
def index():
    users = User.query.all() # ORM performs SELECT query
    result = []
    for u in users:
        result.append(u.serialize()) # build list of users as dictionaries
    return jsonify(result) # return JSON response

# GET by user id
@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    t = User.query.get_or_404(id)
    return jsonify(t.serialize())