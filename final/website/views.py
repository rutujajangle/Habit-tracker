from flask import Blueprint, render_template, request, flash, jsonify
from flask_login import login_required, current_user
from .models import Habit, db

import json
from datetime import datetime

views = Blueprint('views', __name__)

@views.route('/home', methods=['GET', 'POST'])
@login_required
def home():
    if request.method == 'POST':
        habit_name = request.form.get('habit')
        if not habit_name:
            habit_name = request.form.get('habit_new')  # Fallback to new habit text entry
        mood = request.form.get('mood')
        date_of_entry = request.form.get('date_of_entry')
        comments = request.form.get('comments')

        if not date_of_entry:
            flash('Date is required.', category='error')
        elif len(habit_name) < 1:
            flash('Habit description is too short!', category='error')
        else:
            date_of_entry = datetime.strptime(date_of_entry, '%Y-%m-%d').date()
            new_habit = Habit(name=habit_name, mood=int(mood), date_of_entry=date_of_entry, user_id=current_user.id, comments=comments)
            db.session.add(new_habit)
            db.session.commit()
            flash('Habit added!', category='success')

    habits = Habit.query.filter_by(user_id=current_user.id).all()
    unique_habits = set(habit.name for habit in habits)  # Ensure unique habit names
    return render_template("home.html", user=current_user, habits=habits, unique_habits=unique_habits)

@views.route('/edit-habit', methods=['POST'])
def edit_habit():
    try:
        habit_data = request.get_json()
        habit_id = habit_data['habitId']
        habit = Habit.query.get(habit_id)

        if habit and habit.user_id == current_user.id:
            print("Updating Habit:", habit_data)  # Debug: Log the received data

            habit.name = habit_data['name']
            habit.mood = int(habit_data['mood'])
            habit.comments = habit_data['comments']
            habit.date_of_entry = datetime.strptime(habit_data['date_of_entry'], '%Y-%m-%d').date()  # Corrected field name
            
            db.session.commit()
            return jsonify({'message': 'Habit updated successfully!'}), 200
    except ValueError as ve:
        db.session.rollback()
        print(f"Error parsing date: {ve}")  # Debug: Log date parsing errors
        return jsonify({'error': f'Invalid date format: {ve}'}), 400
    except Exception as e:
        db.session.rollback()
        print(f"Unhandled error: {e}")  # Debug: Log any other exceptions
        return jsonify({'error': str(e)}), 500

    return jsonify({'error': 'Habit not found or not authorized'}), 404

@views.route('/delete-habit', methods=['POST'])
def delete_habit():
    habit_data = json.loads(request.data)
    habit_id = habit_data['habitId']
    habit = Habit.query.get(habit_id)
    if habit:
        if habit.user_id == current_user.id:
            db.session.delete(habit)
            db.session.commit()

    return jsonify({})
