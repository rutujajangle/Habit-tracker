from website import create_app, db
from website.models import User, Habit
from werkzeug.security import generate_password_hash
import random
from datetime import datetime

app = create_app()

def generate_users_and_habits(num_users):
    with app.app_context():
        try:
            for i in range(num_users):
                dob = datetime.strptime(f"{random.randint(1960, 2004)}-{random.randint(1, 12):02}-{random.randint(1, 28):02}", "%Y-%m-%d").date()
                hashed_password = generate_password_hash(f"password{i}")
                new_user = User(
                    email=f"user{i}@example.com",
                    password=hashed_password,
                    first_name=f"FirstName{i}",
                    last_name=f"LastName{i}",
                    gender=random.choice(['male', 'female', 'other']),
                    age=random.randint(18, 60),
                    date_of_birth=dob,
                    occupation=random.choice(['Developer', 'Designer', 'Manager', 'Clerk']),
                    purpose="To track daily activities"
                )
                db.session.add(new_user)

                new_habit = Habit(
                    name="Daily Reading",
                    mood=random.randint(1, 5),
                    date_of_entry=datetime.now().date(),
                    comments='Read for 30 minutes.',
                    user_id=new_user.id
                )
                db.session.add(new_habit)

            db.session.commit()  # Committing all at once
        except Exception as e:
            db.session.rollback()  # Rollback in case of error
            raise e
        finally:
            db.session.close()  # Ensure the session is closed properly

if __name__ == '__main__':
    generate_users_and_habits(20)
