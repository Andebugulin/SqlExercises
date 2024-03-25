# SqlQueries

### 1. Get products with unique prices
```sql
SELECT name FROM Products WHERE price IN (
    SELECT price FROM Products GROUP BY price HAVING COUNT(*) = 1
);
```

### 2. Get the first word in alphabetical order
```sql
SELECT * FROM Words ORDER BY word ASC LIMIT 1;
```

### 3. Get all words except the first in alphabetical order
```sql
SELECT * FROM Words WHERE word > (
    SELECT word FROM Words ORDER BY word ASC LIMIT 1
) ORDER BY word ASC;
```

### 4. Get all words containing the letter 'i'
```sql
SELECT * FROM Words WHERE word LIKE '%i%';
```

### 5. Get all words beginning with the letter 'a'
```sql
SELECT * FROM Words WHERE word LIKE 'a%';
```

### 6. Get all words with exactly 5 letters and second letter 'p'
```sql
SELECT * FROM Words WHERE LENGTH(word) = 5 AND SUBSTRING(word, 2, 1) = 'p';
```

### 7. Get all words with exactly two 'a' letters
```sql
SELECT * FROM Words WHERE LENGTH(word) - LENGTH(REPLACE(word, 'a', '')) = 2;
```

### 8. Get the number of groups each user is in (groups per user)
```sql
SELECT Users.id, Users.username, COUNT(Memberships.group_id) AS number_of_groups FROM Users
LEFT JOIN Memberships ON Users.id = Memberships.user_id
GROUP BY Users.id
ORDER BY number_of_groups;
```

### 9. Get the number of users in each group
```sql
SELECT Groups.id, Groups.name, COUNT(Memberships.user_id) AS number_of_users FROM Groups
LEFT JOIN Memberships ON Groups.id = Memberships.group_id
GROUP BY Groups.id;
```

### 10. Get all users who are part of more than one group
```sql
SELECT Users.id, Users.username FROM Users
JOIN Memberships ON Users.id = Memberships.user_id
GROUP BY Users.id
HAVING COUNT(Memberships.group_id) > 1;
```

### 11. Get all the users who are in at least one same group as the user 'uolevi'
Assuming you have a user named 'uolevi' in your Users table:
```sql
SELECT DISTINCT Users.id, Users.username FROM Memberships
JOIN Users ON Memberships.user_id = Users.id
WHERE Memberships.group_id IN (
    SELECT group_id FROM Memberships
    JOIN Users ON Memberships.user_id = Users.id
    WHERE Users.username = 'uolevi'
);
```

### 12. Get all the members who are not in any of the same groups as the user 'uolevi'
```sql
SELECT DISTINCT Users.id, Users.username FROM Users
WHERE Users.id NOT IN (
    SELECT Memberships.user_id FROM Memberships
    WHERE group_id IN (
        SELECT group_id FROM Memberships
        JOIN Users ON Memberships.user_id = Users.id
        WHERE Users.username = 'uolevi'
    )
);
```

### 13. Get the words in alphabetical order, without case sensitivity
```sql
SELECT * FROM Words ORDER BY LOWER(word) ASC;
```

### 14. Get the product with the cheapest price. If there are several, pick the first one in alphabetical order.
```sql
SELECT * FROM Products WHERE price = (
    SELECT MIN(price) FROM Products
) ORDER BY name ASC LIMIT 1;
```
