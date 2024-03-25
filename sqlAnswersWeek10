### 1. Count Ways to Choose 2 Products with Combined Price Exactly 10

This query finds pairs of products whose prices add up to 10.

```sql
SELECT COUNT(*) * 2 AS combination_count
FROM Products p1, Products p2
WHERE p1.price + p2.price = 10 AND p1.id < p2.id;
```

### 2. Smallest Difference Between Two Products With Different Prices

```sql
SELECT MIN(ABS(p1.price - p2.price)) AS smallest_difference
FROM Products p1
JOIN Products p2 ON p1.id < p2.id
WHERE p1.price <> p2.price;
```

### 3. Balance of Each Account Based on Transactions

```sql
SELECT a.owner, COALESCE(SUM(t.`change`), 0) AS balance
FROM Accounts a
LEFT JOIN Transactions t ON a.id = t.account_id
GROUP BY a.id, a.owner;
```

### 4. Balance History for Uolevis Account


```sql
SELECT SUM(t.`change`) OVER (ORDER BY t.id) AS balance_history
FROM Transactions t
JOIN Accounts a ON t.account_id = a.id
WHERE a.owner = 'Uolevi';
```

### 5. Largest Balance of Each Account During Their History

```sql
WITH RunningBalances AS (
    SELECT a.owner, SUM(t.`change`) OVER (PARTITION BY t.account_id ORDER BY t.id) AS current_balance
    FROM Transactions t
    JOIN Accounts a ON t.account_id = a.id
)
SELECT owner, MAX(current_balance) AS largest_balance
FROM RunningBalances
GROUP BY owner;
```

### 6. Number of Different Correct Exercises Solved by Each Student


```sql
SELECT s.name, COUNT(DISTINCT t.exercise_id) AS correct_exercises
FROM Transmissions t
JOIN Students s ON t.student_id = s.id
WHERE t.state = 1
GROUP BY s.id, s.name;
```

### 7. Maximum Number of Transmissions to a Single Exercise by Each Student

```sql
SELECT s.name, MAX(transmission_count) AS max_transmissions
FROM (
    SELECT student_id, exercise_id, COUNT(*) AS transmission_count
    FROM Transmissions
    GROUP BY student_id, exercise_id
) AS SubQuery
JOIN Students s ON SubQuery.student_id = s.id
GROUP BY s.id, s.name;
```
