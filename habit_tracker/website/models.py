from . import db
from flask_login import UserMixin
from sqlalchemy.sql import func

class Habit(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(150))
    mood = db.Column(db.Integer)  # Rating from 1 to 5
    date_of_entry = db.Column(db.Date)  # Accept user input for date
    comments = db.Column(db.String(500))
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'))

class User(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(150), unique=True)
    password = db.Column(db.String(150))
    first_name = db.Column(db.String(150))
    last_name = db.Column(db.String(150))
    gender = db.Column(db.String(10))  # 'male', 'female', 'other'
    age = db.Column(db.Integer)
    date_of_birth = db.Column(db.Date)
    occupation = db.Column(db.String(150))
    purpose = db.Column(db.String(300))
    habits = db.relationship('Habit', backref='user')
