# 🧠 Habit Tracking WebApp

## 🌐 Overview

The **Habit Tracking WebApp** is a full-stack web application designed to help users improve their productivity, maintain a healthy lifestyle, and develop positive habits. The app allows users to track their daily routines, record their moods, and gain insightful correlations between their behavior patterns and emotional states. With a clean interface and robust functionality, the app is suited for users of all age groups who are looking to become more self-aware and motivated in their day-to-day lives.

---

## 🔗 Live WebApp

We have deployed the application on PythonAnywhere:  
🔗 **[Login to Habit Tracker](https://naveen15.pythonanywhere.com/login?next=%2Fhome)**

---

## 📁 GitHub Repository

Find the full source code, reports, and database here:  
📂 **[Hait-tracker GitHub Repo](https://github.com/rutujajangle/Habit-tracker)**

---

## 🎯 Purpose

The main goal of this project is to create a user-friendly and insightful habit tracking platform that:

- Encourages users to monitor and improve their daily habits.
- Helps users understand how their routines correlate with their moods.
- Promotes self-awareness and motivates lifestyle changes.

---

## ✅ Objectives

- Enable users to track their daily habits and moods in an intuitive way.
- Provide users with weekly summaries and personal insights.
- Foster long-term behavioral improvements through data-driven feedback.

---

## 💡 Key Features

1. **User Authentication**
   - Secure sign-up and login system with encrypted passwords.

2. **Habit Tracking**
   - Add, view, update, and delete daily habit entries.
   - Choose from existing habits or add custom ones.
   - Rate habits from 1 (poor) to 5 (very good) with visual color feedback.

3. **Mood Tracking**
   - Record daily mood alongside habit entries.
   - Maintain a mood diary with optional comments for self-reflection.

4. **User Insights**
   - View a history of habits and moods.
   - Access a weekly progress overview.

---

## 🛠️ Tools and Technologies

### 🔙 Backend
- **Python**
- **Flask (Micro Web Framework)**
- **SQLite3 (Relational Database)**
- **SQLAlchemy** (ORM for Flask)

### 🌐 Frontend
- **HTML**
- **Flask Templating**

### 🧰 Development Tools
- **Visual Studio Code**
- **MySQL Workbench** (for initial DB modeling)
- **pgAdmin4**
- **Jupyter Notebook**

### ☁️ Deployment
- **PythonAnywhere** (PaaS hosting platform)

---

## 🗃️ Database Design

- **User Table**
  - Fields: `First Name`, `Last Name`, `Email` (unique), `Login ID`, `Password` (encrypted), `Gender`, `Age`, `DOB`, `Occupation`, `Purpose`
  - Constraints: 
    - `Primary Key` on `ID`
    - `Unique` constraint on `Email`
    - `NOT NULL` constraint on critical fields

- **Habit Table**
  - Fields: `User ID`, `Habit Name`, `Date of Entry`, `Mood`
  - Constraints:
    - `Primary Key` on `ID`
    - `Foreign Key` on `User ID` referencing `User` table
    - `NOT NULL` constraints for essential fields

---
