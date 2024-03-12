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
