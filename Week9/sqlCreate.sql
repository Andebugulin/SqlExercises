CREATE DATABASE SQLExercises;

USE SQLExercises;
GO

CREATE TABLE Products (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    price INT
);

CREATE TABLE Words (
    id INT PRIMARY KEY,
    word VARCHAR(255)
);

CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(255)
);

CREATE TABLE Groups (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Memberships (
    user_id INT,
    group_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (group_id) REFERENCES Groups(id)
);