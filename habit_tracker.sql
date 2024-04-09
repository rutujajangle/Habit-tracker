-- Habit tracker project part 2
-- Team Members: Ritika Shrivastav, Rutuja Jangle, Naveen Addanki

-- Users table was created by Ritika including all the constraints which were discussed among all members of the team
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL, -- Assuming encryption is handled outside of the database
    dob DATE NOT NULL,
    gender ENUM('male', 'female', 'other') NOT NULL,
    occupation VARCHAR(100), -- Can be NULL
    purpose ENUM('weekly progress tracking', 'productivity', 'accountability', 'habit building') NOT NULL,
    age_group ENUM('under 18', '18-25', '26-40', 'above 40') NOT NULL
);

-- Habits table was created by Naveen which included column category discussions from all members
CREATE TABLE habits (
    habit_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    email_id VARCHAR(100),
    date DATE NOT NULL,
    reading ENUM('True', 'False') DEFAULT NULL,
    walking ENUM('True', 'False') DEFAULT NULL,
    sleeping ENUM('True', 'False') DEFAULT NULL,
    gym ENUM('True', 'False') DEFAULT NULL,
    eating_healthy ENUM('True', 'False') DEFAULT NULL,
    others ENUM('True', 'False') DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (email_id) REFERENCES users(email)
);

-- Each one of us inserted 5 entries in the users table making it a total of 15 entries initially,
-- starting with Ritika for the first 5, 
-- followed by Rutuja for the next 5,
-- and Naveen inserted the last 5 entries
INSERT INTO users (firstname, lastname, email, password, dob, gender, occupation, purpose, age_group)
VALUES
    ('John', 'Doe', CONCAT('john', 'doe', '@yahoo.com'), 'password1', '1990-05-15', 'male', 'Engineer', 'weekly progress tracking', '26-40'),
    ('Jane', 'Smith', CONCAT('jane', 'smith', '@gmail.com'), 'password2', '1985-08-22', 'female', 'Teacher', 'productivity', '26-40'),
    ('Michael', 'Johnson', CONCAT('michael', 'johnson', '@outlook.com'), 'password3', '1995-02-10', 'male', 'Doctor', 'accountability', '26-40'),
    ('Emily', 'Williams', CONCAT('emily', 'williams', '@edu.com'), 'password4', '2000-11-30', 'female', 'Student', 'habit building', '18-25'),
    ('David', 'Brown', CONCAT('david', 'brown', '@hotmail.com'), 'password5', '1978-07-03', 'male', 'Manager', 'weekly progress tracking', 'above 40'),
    ('Sarah', 'Miller', CONCAT('sarah', 'miller', '@yahoo.com'), 'password6', '1992-04-18', 'female', 'Software Developer', 'productivity', '26-40'),
    ('Ryan', 'Davis', CONCAT('ryan', 'davis', '@gmail.com'), 'password7', '1987-09-25', 'male', 'Artist', 'accountability', '26-40'),
    ('Olivia', 'Wilson', CONCAT('olivia', 'wilson', '@outlook.com'), 'password8', '1983-12-08', 'female', 'Writer', 'habit building', '26-40'),
    ('William', 'Moore', CONCAT('william', 'moore', '@edu.com'), 'password9', '2002-01-20', 'male', NULL, 'weekly progress tracking', 'under 18'),
    ('Emma', 'Taylor', CONCAT('emma', 'taylor', '@hotmail.com'), 'password10', '1975-06-12', 'female', 'Entrepreneur', 'productivity', 'above 40'),
    ('James', 'Anderson', CONCAT('james', 'anderson', '@yahoo.com'), 'password11', '1998-03-05', 'male', 'Consultant', 'accountability', '18-25'),
    ('Ava', 'Thomas', CONCAT('ava', 'thomas', '@gmail.com'), 'password12', '1993-10-14', 'female', 'Lawyer', 'habit building', '26-40'),
    ('Benjamin', 'Jackson', CONCAT('benjamin', 'jackson', '@outlook.com'), 'password13', '1980-09-02', 'male', 'Accountant', 'weekly progress tracking', 'above 40'),
    ('Sophia', 'Harris', CONCAT('sophia', 'harris', '@yahoo.com'), 'password14', '1989-07-29', 'female', 'Doctor', 'productivity', '26-40'),
    ('Ethan', 'White', CONCAT('ethan', 'white', '@edu.com'), 'password15', '2005-08-09', 'male', NULL, 'accountability', 'under 18');

-- Similarly for the habits table, Assuming some random habit data for each user, each one of us inserted 5 ntries in the same order as above,
-- Ritika (first 5) -> Rutuja (next 5) -> Naveen (last 5)
INSERT INTO habits (user_id, email_id, date, reading, walking, sleeping, gym, eating_healthy, others)
VALUES
    (1, 'johndoe@yahoo.com', '2024-04-07', 'True', 'True', 'True', 'False', 'True', 'False'),
    (2, 'janesmith@gmail.com', '2024-04-07', 'True', 'False', 'True', 'True', 'False', 'False'),
    (3, 'michaeljohnson@outlook.com', '2024-04-07', 'True', 'True', 'False', 'True', 'True', 'False'),
    (4, 'emilywilliams@edu.com', '2024-04-07', 'False', 'True', 'True', 'False', 'False', 'True'),
    (5, 'davidbrown@hotmail.com', '2024-04-07', 'True', 'True', 'True', 'True', 'True', 'True'),
    (6, 'sarahmiller@yahoo.com', '2024-04-07', 'False', 'True', 'True', 'False', 'True', 'True'),
    (7, 'ryandavis@gmail.com', '2024-04-07', 'True', 'True', 'True', 'True', 'False', 'False'),
    (8, 'oliviawilson@outlook.com', '2024-04-07', 'False', 'False', 'True', 'False', 'True', 'True'),
    (9, 'williammoore@edu.com', '2024-04-07', 'True', 'False', 'False', 'True', 'False', 'True'),
    (10, 'emmataylor@hotmail.com', '2024-04-07', 'True', 'True', 'True', 'True', 'True', 'False'),
    (11, 'jamesanderson@yahoo.com', '2024-04-07', 'False', 'True', 'False', 'False', 'True', 'True'),
    (12, 'avathomas@gmail.com', '2024-04-07', 'True', 'True', 'True', 'True', 'True', 'True'),
    (13, 'benjaminjackson@outlook.com', '2024-04-07', 'False', 'False', 'True', 'False', 'True', 'False'),
    (14, 'sophiaharris@yahoo.com', '2024-04-07', 'True', 'True', 'True', 'False', 'False', 'True'),
    (15, 'ethanwhite@edu.com', '2024-04-07', 'False', 'False', 'False', 'True', 'True', 'False');

-- For checking whether the entries are inserted properly we used the select statement, coded by Ritika
select * from habits;

-- Mood_diary table was created by Rutuja which included the contraints discussions from all members
CREATE TABLE mood_diary (
    user_id INT NOT NULL,
    habits_id INT NOT NULL,
    mood_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    reading_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    walking_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    sleeping_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    gym_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    eating_healthy_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    others_rating ENUM('1','2','3','4','5') DEFAULT NULL,
    comments VARCHAR(500),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (habits_id) REFERENCES habits(habit_id)
);

-- Similarly for the mood_diary table, Assuming some random data for each user, each one of us inserted 5 ntries in the same order as the first two tables,
-- Ritika (first 5) -> Rutuja (next 5) -> Naveen (last 5)
INSERT INTO mood_diary (user_id, habits_id, date, reading_rating, walking_rating, sleeping_rating, gym_rating, eating_healthy_rating, others_rating, comments)
VALUES
    (1, 47, '2024-04-07', '5', '4', '5', '3', '5', '4', 'Feeling great today!'),
    (2, 33, '2024-04-07', '4', '5', '4', '4', '3', '5', 'Had a productive day.'),
    (3, 34, '2024-04-07', '5', '4', '3', '5', '5', '4', 'Feeling energetic.'),
    (4, 35, '2024-04-07', '3', '5', '5', '2', '4', '5', 'Could use some improvement in reading habit.'),
    (5, 36, '2024-04-07', '4', '4', '4', '4', '4', '4', 'Maintaining a good routine.'),
    (6, 37, '2024-04-07', '5', '3', '5', '3', '4', '4', 'Feeling focused.'),
    (7, 38, '2024-04-07', '4', '4', '4', '4', '3', '3', 'Average day overall.'),
    (8, 39, '2024-04-07', '3', '3', '4', '2', '4', '3', 'Could improve sleeping habits.'),
    (9, 40, '2024-04-07', '4', '2', '2', '4', '3', '4', 'Good progress in gym.'),
    (10, 41, '2024-04-07', '5', '5', '5', '5', '5', '5', 'Excellent day overall.'),
    (11, 42, '2024-04-07', '3', '4', '2', '3', '4', '3', 'Need to work on sleeping habits.'),
    (12, 43, '2024-04-07', '5', '5', '5', '5', '5', '5', 'Feeling accomplished.'),
    (13, 44, '2024-04-07', '4', '3', '4', '2', '3', '3', 'Could improve eating habits.'),
    (14, 45, '2024-04-07', '5', '4', '5', '4', '5', '4', 'Great day overall.'),
    (15, 46, '2024-04-07', '3', '2', '2', '4', '3', '3', 'Need to be more consistent.');

-- Similarly like the habits table, for checking whether the data is inserted properly or not in the mood_diary table we used the select statement, coded by Rutuja
select * from mood_diary;
