--Inner Joins
--20. List the description and amount of every transaction made by someone living in Durban.

SELECT p.[person_id], p.[first_name], p.[last_name], p.[city],t.[transaction_id]
FROM [Bank_Transactions].[dbo].[people] p
JOIN [Bank_Transactions].[dbo].[transactions] t
     ON p.[person_id] = t.[person_id]
WHERE p.[city] = 'Durban';

--22. Find all transactions made in January 2025, along with the person's full name.

SELECT CONCAT(p.first_name, ' ', p.last_name) AS full_name, t.[transaction_id], t.[transaction_date]
FROM [Bank_Transactions].[dbo].[people]  p
JOIN [Bank_Transactions].[dbo].[transactions]  t
    ON p.[person_id] = t.[person_id]
WHERE t.[transaction_date] LIKE '2025-01%';

--LEFT JOIN
--25. Show all people and the number of transactions they've made, including 0 for those with none.

SELECT p.[first_name], p.[last_name], COUNT(t.transaction_id) AS numb_transactions
FROM [Bank_Transactions].[dbo].[transactions]  t
LEFT JOIN [Bank_Transactions].[dbo].[people]  p
      ON p.[person_id] = t.[person_id]
 GROUP BY p.[first_name], p.[last_name];
     

--27. List all people and a column that says 'Has activity' or 'No activity' based on whether they appear in transactions.

/*SELECT p.[first_name], p.[last_name], t.[transaction_id],
CASE 
    WHEN t.[transaction_id] IS NOT NULL THEN  'Has Activity'
    ELSE 'No activity'
END AS activity_status
FROM [Bank_Transactions].[dbo].[people] AS p
LEFT JOIN [Bank_Transactions].[dbo].[transactions] AS t
      ON p.[person_id] = t.[person_id];

SELECT 
    p.[first_name],
    p.[last_name],
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM [Bank_Transactions].[dbo].[transactions] AS t
            WHERE t.[person_id] = p.[person_id]
        ) THEN 'Has activity'
        ELSE 'No activity'
    END AS activity_status
FROM [Bank_Transactions].[dbo].[people] AS p;
*/

SELECT DISTINCT
    p.[first_name],
    p.[last_name],
    CASE 
        WHEN t.[transaction_id] IS NOT NULL THEN 'Has activity'
        ELSE 'No activity'
    END AS activity_status
FROM [Bank_Transactions].[dbo].[people]  p
LEFT JOIN [Bank_Transactions].[dbo].[transactions]  t
    ON p.[person_id] = t.[person_id];
     


--RIGHT JOIN
--28. List every transaction along with the person's city — show NULL city for orphaned transactions.

SELECT  p.[first_name], p.[last_name], p.[city], t.[transaction_id]
FROM [Bank_Transactions].[dbo].[people] p
RIGHT JOIN [Bank_Transactions].[dbo].[transactions] t
    ON p.[person_id] = t.[person_id];
      

--30. Show all transactions ordered by amount, including a flag for whether the person_id is valid.
SELECT p.[person_id], p.[first_name], p.[last_name], t.[transaction_id], t.[amount],
CASE 
    WHEN p.[person_id] IS NULL THEN ' Not Valid'
    Else 'Valid'
END AS verication
FROM [Bank_Transactions].[dbo].[people] p
RIGHT JOIN [Bank_Transactions].[dbo].[transactions] t
    ON p.[person_id] = t.[person_id]
ORDER BY t.[amount];


--FULL OUTER JOIN
--31. Produce one combined view of people and transactions showing every person (even with no transactions) 
--and every transaction (even orphaned), with NULLs on whichever side is missing.

SELECT p.[person_id], p.[first_name], p.[last_name],p.[email], p.[phone], p.[city], p.[date_of_birth],
       t.[transaction_id], t.[transaction_type], t.[transaction_date], t.[description], t.[amount]
FROM Bank_Transactions.dbo.people p
FULL OUTER JOIN Bank_Transactions.dbo.transactions t 
        ON p.person_id = t.person_id; 

--AGGREGATION + JOIN
--33. Find the total number of transactions and total amount per city.

SELECT COUNT(t.transaction_id) AS total_transactions, SUM(t.amount) AS total_amount,
       p.[city]
FROM Bank_Transactions.dbo.transactions t 
JOIN Bank_Transactions.dbo.people p
     ON p.person_id = t.person_id
GROUP BY p.[city]
ORDER BY total_amount DESC;


--35. Find each person's smallest (most negative) transaction.

/*SELECT t.person_id,
    MIN(t.amount) AS smallest_transaction
FROM Bank_Transactions.dbo.transactions t
GROUP BY t.person_id
ORDER BY smallest_transaction;
*/

SELECT p.[person_id], p.[first_name], p.[last_name], t.[transaction_id],  MIN(t.amount) AS smallest_amount
FROM Bank_Transactions.dbo.transactions t 
JOIN Bank_Transactions.dbo.people p
     ON p.person_id = t.person_id
GROUP BY p.[person_id], p.[first_name], p.[last_name], t.[transaction_id] 
ORDER BY smallest_amount;


--37. Find the average number of transactions per person across the whole table.

/*SELECT p.person_id, AVG(num_transactions)
FROM (
    SELECT 
        t.person_id,
        COUNT(t.transaction_id) AS num_transactions
    FROM Bank_Transactions.dbo.transactions t
    GROUP BY person_id
) AS person_counts;
*/



SELECT DISTINCT p.[person_id], p.[first_name], p.[last_name],AVG(t.transaction_id) AS Avg_num_transactions
FROM Bank_Transactions.dbo.transactions t 
JOIN Bank_Transactions.dbo.people p
     ON p.person_id = t.person_id
GROUP BY p.[person_id], p.[first_name], p.[last_name] 
;


--FILTERING + JOIN
--39. Find all people who made at least one transaction over 10,000.

SELECT p.person_id, p.first_name, p.last_name, t.transaction_id, t.amount
FROM Bank_Transactions.dbo.people p
JOIN Bank_Transactions.dbo.transactions t
    ON p.person_id = t.person_id
WHERE t.amount > 10000;

--41. Find all transactions made by people NOT living in Cape Town.
SELECT p.person_id, p.first_name, p.last_name, t.transaction_id
FROM Bank_Transactions.dbo.people p
JOIN Bank_Transactions.dbo.transactions t
    ON p.person_id = t.person_id
WHERE p.city != 'Cape Town';



--43. List people who have exactly one transaction (not zero, not many).
SELECT p.person_id, p.first_name, p.last_name, COUNT(t.transaction_id) AS num_transaction
FROM Bank_Transactions.dbo.people p
JOIN Bank_Transactions.dbo.transactions t
    ON p.person_id = t.person_id
GROUP BY p.person_id, p.first_name, p.last_name
HAVING COUNT(t.transaction_id) = 1;


--SELF-JOIN/ COMPARISON (i left here)
--45. For each city with more than one person, list all the people in it side by side.



SELECT p.city,
       p.first_name + ' ' + p.last_name AS person1,
       B.first_name + ' ' + B.last_name AS person2
FROM Bank_Transactions.dbo.people p
JOIN Bank_Transactions.dbo.people B
  ON p.city = B.city
 AND p.person_id < B.person_id
WHERE p.city IN (
    SELECT city
    FROM Bank_Transactions.dbo.people
    GROUP BY city
    HAVING COUNT(person_id) > 1
)
ORDER BY p.city, person1, person2;



--MULTIPLE / CHAINED JOINS
--47. Imagine a third table `cities (city_name, region)`. Join people → transactions → cities to show each transaction's region.

SELECT 
    t.transaction_id,
    t.person_id,
    t.amount,
    p.first_name,
    p.last_name,
 case 
   when p.city = 'Cape Town' then 'Western Cape'
   when p.city = 'Bloemfontien' then 'Free State'
   when p.city = 'Durban' then 'KwaZulu Natal'
   when p.city = 'Johannesburg' then 'Gauteng'
   when p.city = 'Port Elizabeth' then 'Eastern Cape'
   when p.city = 'Pretoria' then 'Gauteng-Tswane'
end as Regions
FROM Bank_Transactions.dbo.people p
JOIN Bank_Transactions.dbo.transactions t
    ON p.person_id = t.person_id 
group by 
    t.transaction_id,
    t.person_id,
    t.amount,
    p.first_name,
    p.last_name,
    p.city

--TRICKY EDGE CASES
--49. Find people who exist in `people` but whose person_id never appears as a foreign key anywhere (same idea as an unused customer).

SELECT 
    p.person_id,
    p.first_name,
    p.last_name
FROM Bank_Transactions.dbo.people p
LEFT JOIN Bank_Transactions.dbo.transactions t
    ON p.person_id = t.person_id
WHERE t.person_id IS NULL;

