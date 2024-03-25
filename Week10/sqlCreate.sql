CREATE TABLE Accounts (
    id INT PRIMARY KEY,
    owner VARCHAR(255)
);

CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    account_id INT,
    change INT,
    FOREIGN KEY (account_id) REFERENCES Accounts(id)
);

CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Exercises (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Transmissions (
    id INT PRIMARY KEY,
    student_id INT,
    exercise_id INT,
    state BIT,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (exercise_id) REFERENCES Exercises(id)
);