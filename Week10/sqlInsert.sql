INSERT INTO Accounts (id, owner) VALUES (1, 'Uolevi');
INSERT INTO Accounts (id, owner) VALUES (2, 'Maija');
INSERT INTO Accounts (id, owner) VALUES (3, 'Kaaleppi');

INSERT INTO Transactions (id, account_id, change) VALUES (1, 1, 500);
INSERT INTO Transactions (id, account_id, change) VALUES (2, 2, 300);
INSERT INTO Transactions (id, account_id, change) VALUES (3, 1, -100);
INSERT INTO Transactions (id, account_id, change) VALUES (4, 2, 100);
INSERT INTO Transactions (id, account_id, change) VALUES (5, 2, -300);

INSERT INTO Students (id, name) VALUES (1, 'Uolevi');
INSERT INTO Students (id, name) VALUES (2, 'Maija');
INSERT INTO Students (id, name) VALUES (3, 'Kaaleppi');

INSERT INTO Exercises (id, name) VALUES (1, 'T1');
INSERT INTO Exercises (id, name) VALUES (2, 'T2');
INSERT INTO Exercises (id, name) VALUES (3, 'T3');

INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (1, 1, 1, 0);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (2, 1, 1, 0);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (3, 1, 2, 1);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (4, 1, 2, 0);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (5, 1, 1, 1);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (6, 2, 2, 1);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (7, 2, 3, 0);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (8, 1, 2, 0);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (9, 1, 2, 1);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (10, 2, 2, 1);
INSERT INTO Transmissions (id, student_id, exercise_id, state) VALUES (11, 2, 2, 1);