-- Creating the database
CREATE DATABASE IF NOT EXISTS SQLExercises;
USE SQLExercises;

-- Creating tables
CREATE TABLE IF NOT EXISTS Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    price INT
);

CREATE TABLE IF NOT EXISTS Words (
    id INT AUTO_INCREMENT PRIMARY KEY,
    word VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Memberships (
    user_id INT,
    group_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (group_id) REFERENCES Groups(id)
);

CREATE TABLE IF NOT EXISTS Accounts (
    id INT PRIMARY KEY,
    owner VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Transactions (
    id INT PRIMARY KEY,
    account_id INT,
    `change` INT,
    FOREIGN KEY (account_id) REFERENCES Accounts(id)
);

CREATE TABLE IF NOT EXISTS Students (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Exercises (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Transmissions (
    id INT PRIMARY KEY,
    student_id INT,
    exercise_id INT,
    state BIT,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (exercise_id) REFERENCES Exercises(id)
);

-- Inserting data
INSERT INTO Products (id, name, price) VALUES 
(1, 'celery', 5), 
(2, 'turnip', 3), 
(3, 'radish', 5), 
(4, 'cucumber', 6), 
(5, 'apple', 3), 
(6, 'pear', 4);

INSERT INTO Words (id, word) VALUES 
(1, 'apina'), 
(2, 'banana'), 
(3, 'cembalo'), 
(4, 'omena'), 
(5, 'Liisa'), 
(6, 'Maija'), 
(7, 'Uolevi');

INSERT INTO Users (id, username) VALUES 
(1, 'uolevi'), 
(2, 'maija'), 
(3, 'kaaleppi'), 
(4, 'liisa');

INSERT INTO Groups (id, name) VALUES 
(1, 'bunnies'), 
(2, 'puppies');

INSERT INTO Memberships (user_id, group_id) VALUES 
(1, 1), 
(1, 2), 
(2, 1), 
(4, 2);

INSERT INTO Accounts (id, owner) VALUES 
(1, 'Uolevi'), 
(2, 'Maija'), 
(3, 'Kaaleppi');

INSERT INTO Transactions (id, account_id, `change`) VALUES 
(1, 1, 500), 
(2, 2, 300), 
(3, 1, -100), 
(4, 2, 100), 
(5, 2, -300);

INSERT INTO Students (id, name) VALUES 
(1, 'Uolevi'), 
(2, 'Maija'), 
(3, 'Kaaleppi');

INSERT INTO Exercises (id, name) VALUES 
(1, 'T1'), 
(2, 'T2'), 
(3, 'T3');

INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES 
(1, 1, 1, 0), 
(2, 1, 1, 0), 
(3, 1, 2, 1), 
(4, 1, 2, 0), 
(5, 1, 1, 1), 
(6, 2, 2, 1), 
(7, 2, 3, 0), 
(8, 1, 2, 0), 
(9, 1, 2, 1), 
(10, 2, 2, 1), 
(11, 2, 2, 1);

-- 1. Count Ways to Choose 2 Products with Combined Price Exactly 10
SELECT COUNT(*) * 2 AS combination_count
FROM Products p1, Products p2
WHERE p1.price + p2.price = 10 AND p1.id < p2.id;

-- 2. Smallest Difference Between Two Products With Different Prices
SELECT MIN(ABS(p1.price - p2.price)) AS smallest_difference
FROM Products p1
JOIN Products p2 ON p1.id < p2.id
WHERE p1.price <> p2.price;

-- 3. Balance of Each Account Based on Transactions
SELECT a.owner, COALESCE(SUM(t.`change`), 0) AS balance
FROM Accounts a
LEFT JOIN Transactions t ON a.id = t.account_id
GROUP BY a.id, a.owner;

-- 4. Balance History for Uolevi's Account
SELECT SUM(t.`change`) OVER (ORDER BY t.id) AS balance_history
FROM Transactions t
JOIN Accounts a ON t.account_id = a.id
WHERE a.owner = 'Uolevi';

-- 5. Largest Balance of Each Account During Their History
WITH RunningBalances AS (
    SELECT a.owner, SUM(t.`change`) OVER (PARTITION BY t.account_id ORDER BY t.id) AS current_balance
    FROM Transactions t
    JOIN Accounts a ON t.account_id = a.id
)
SELECT owner, MAX(current_balance) AS largest_balance
FROM RunningBalances
GROUP BY owner;

-- 6. Number of Different Correct Exercises Solved by Each Student
SELECT s.name, COUNT(DISTINCT t.exercise_id) AS correct_exercises
FROM Transmissions t
JOIN Students s ON t.student_id = s.id
WHERE t.state = 1
GROUP BY s.id, s.name;

-- 7. Maximum Number of Transmissions to a Single Exercise by Each Student
SELECT s.name, MAX(transmission_count) AS max_transmissions
FROM (
    SELECT student_id, exercise_id, COUNT(*) AS transmission_count
    FROM Transmissions
    GROUP BY student_id, exercise_id
) AS SubQuery
JOIN Students s ON SubQuery.student_id = s.id
GROUP BY s.id, s.name;

