CREATE DATABASE SQLExercises;

USE SQLExercises;

CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    price INT
);

CREATE TABLE Words (
    id INT AUTO_INCREMENT PRIMARY KEY,
    word VARCHAR(255)
);

CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255)
);

CREATE TABLE Groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE Memberships (
    user_id INT,
    group_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (group_id) REFERENCES Groups(id)
);


INSERT INTO Products (id, name, price) VALUES (1, 'celery', 5);
INSERT INTO Products (id, name, price) VALUES (2, 'turnip', 3);
INSERT INTO Products (id, name, price) VALUES (3, 'radish', 5);
INSERT INTO Products (id, name, price) VALUES (4, 'cucumber', 6);
INSERT INTO Products (id, name, price) VALUES (5, 'apple', 3);
INSERT INTO Products (id, name, price) VALUES (6, 'pear', 4);

INSERT INTO Words (id, word) VALUES (1, 'apina');
INSERT INTO Words (id, word) VALUES (2, 'banana');
INSERT INTO Words (id, word) VALUES (3, 'cembalo');
INSERT INTO Words (id, word) VALUES (4, 'omena');
INSERT INTO Words (id, word) VALUES (5, 'Liisa');
INSERT INTO Words (id, word) VALUES (6, 'Maija');
INSERT INTO Words (id, word) VALUES (7, 'Uolevi');

INSERT INTO Users (id, username) VALUES (1, 'uolevi');
INSERT INTO Users (id, username) VALUES (2, 'maija');
INSERT INTO Users (id, username) VALUES (3, 'kaaleppi');
INSERT INTO Users (id, username) VALUES (4, 'liisa');

INSERT INTO Groups (id, name) VALUES (1, 'bunnies');
INSERT INTO Groups (id, name) VALUES (2, 'puppies');

INSERT INTO Memberships (user_id, group_id) VALUES (1, 1);
INSERT INTO Memberships (user_id, group_id) VALUES (1, 2);
INSERT INTO Memberships (user_id, group_id) VALUES (2, 1);
INSERT INTO Memberships (user_id, group_id) VALUES (4, 2);



-- 1. Get products with unique prices
SELECT name FROM Products WHERE price IN (
    SELECT price FROM Products GROUP BY price HAVING COUNT(*) = 1
);

-- 2. Get the first word in alphabetical order
SELECT * FROM Words ORDER BY word ASC LIMIT 1;

-- 3. Get all words except the first in alphabetical order
SELECT * FROM Words WHERE word > (
    SELECT word FROM Words ORDER BY word ASC LIMIT 1
) ORDER BY word ASC;

-- 4. Get all words containing the letter 'i'
SELECT * FROM Words WHERE word LIKE '%i%';

-- 5. Get all words beginning with the letter 'a'
SELECT * FROM Words WHERE word LIKE 'a%';

-- 6. Get all words with exactly 5 letters and second letter 'p'
SELECT * FROM Words WHERE LENGTH(word) = 5 AND SUBSTRING(word, 2, 1) = 'p';

-- 7. Get all words with exactly two 'a' letters
SELECT * FROM Words WHERE LENGTH(word) - LENGTH(REPLACE(word, 'a', '')) = 2;

-- 8. Get the number of groups each user is in (groups per user)
SELECT Users.id, Users.username, COUNT(Memberships.group_id) AS number_of_groups FROM Users
LEFT JOIN Memberships ON Users.id = Memberships.user_id
GROUP BY Users.id
ORDER BY number_of_groups;

-- 9. Get the number of users in each group
SELECT Groups.id, Groups.name, COUNT(Memberships.user_id) AS number_of_users FROM Groups
LEFT JOIN Memberships ON Groups.id = Memberships.group_id
GROUP BY Groups.id;

-- 10. Get all users who are part of more than one group
SELECT Users.id, Users.username FROM Users
JOIN Memberships ON Users.id = Memberships.user_id
GROUP BY Users.id
HAVING COUNT(Memberships.group_id) > 1;

-- 11. Get all the users who are in at least one same group as the user 'uolevi'
SELECT DISTINCT Users.id, Users.username FROM Memberships
JOIN Users ON Memberships.user_id = Users.id
WHERE Memberships.group_id IN (
    SELECT group_id FROM Memberships
    JOIN Users ON Memberships.user_id = Users.id
    WHERE Users.username = 'uolevi'
);

-- 12. Get all the members who are not in any of the same groups as the user 'uolevi'
SELECT DISTINCT Users.id, Users.username FROM Users
WHERE Users.id NOT IN (
    SELECT Memberships.user_id FROM Memberships
    WHERE group_id IN (
        SELECT group_id FROM Memberships
        JOIN Users ON Memberships.user_id = Users.id
        WHERE Users.username = 'uolevi'
    )
);

-- 13. Get the words in alphabetical order, without case sensitivity
SELECT * FROM Words ORDER BY LOWER(word) ASC;

-- 14. Get the product with the cheapest price. If there are several, pick the first one in alphabetical order.
SELECT * FROM Products WHERE price = (
    SELECT MIN(price) FROM Products
) ORDER BY name ASC LIMIT 1;
