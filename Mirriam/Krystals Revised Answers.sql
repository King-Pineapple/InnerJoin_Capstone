Select *
from [Bank_Transactions].[dbo].[people]

Select *
from [Bank_Transactions].[dbo].[transactions]
--Krystals Questions
--INNER JOIN
--21. Show the full name and email of every person who has made at least one withdrawal.
Select 
A.person_id,
A.first_name,
A.last_name,
A.email,
B.transaction_type
from [Bank_Transactions].[dbo].[people] A
inner join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
where transaction_type = 'Withdrawal'
Order by A.person_id

--23. List every person-transaction pair where the transaction amount is negative (money going out).
Select 
A.person_id,
A.first_name,
A.last_name,
B.amount,
B.transaction_type
from [Bank_Transactions].[dbo].[people] A
inner join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
where B.amount like '%-%'

--LEFT JOIN
--24. List every person along with their most recent transaction date (NULL if they have none).
Select distinct top 10 
B.transaction_date,
A.person_id,
A.first_name,
A.last_name
from [Bank_Transactions].[dbo].[people] A
left join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
order by B.transaction_date Desc

--26. Find people whose only transactions (if any) are deposits — including people with zero transactions.
Select 
A.person_id,
A.first_name,
A.last_name,
B.amount,
B.transaction_type
from [Bank_Transactions].[dbo].[people] A
left join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
where amount >= 0 and transaction_type ='deposit'

--RIGHT JOIN
--29. Find the total amount of money attached to transactions that have no matching person.
Select 
Sum(abs(B.amount)) as Total_Unassigned --abs is when you take a negative amount and converts it to a positive amount
from [Bank_Transactions].[dbo].[people] A
right join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
where B.person_id >10

--Full OuterJoin
--32. From that FULL OUTER JOIN result, count how many rows have a NULL person_id vs how many have a NULL transaction_id.
Select 
    sum(case when person_id is null then 1 else 0 end) as null_person_id,
    sum(case when transaction_id is null then 1 else 0 end) as null_transaction_id
from (
    Select A.person_id, B.transaction_id
    from [Bank_Transactions].[dbo].[people]  A
    full outer join [Bank_Transactions].[dbo].[transactions] B 
    on A.person_id = B.person_id)
    as Null_transactions

--AGGREGATION + JOIN
--34. Find each person's largest single transaction (MAX amount).
Select 
A.person_id,
A.first_name,
A.last_name,
Max(abs(B.amount)) as Highest_Amount
from [Bank_Transactions].[dbo].[people] A
join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
group by A.person_id,A.first_name,A.last_name
order by Highest_Amount desc

--36. Rank people by total transaction volume (sum of absolute amount) from highest to lowest.
Select 
A.person_id,
A.first_name,
A.last_name,
Sum(abs(B.amount)) as Total_Volume_Amount
from [Bank_Transactions].[dbo].[people] A
join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
Group by A.person_id,A.first_name,A.last_name
order by Total_Volume_Amount Desc

--38. Find which city has the highest total deposit amount.
Select 
A.city,
Max(B.amount) as Total_Volume_Per_City,
B.transaction_type
from [Bank_Transactions].[dbo].[people] A
join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
where B.transaction_type = 'Deposit'
Group by A.city,B.transaction_type
Order by Total_Volume_Per_City Desc

--FILTERING + JOIN
--40. Find all people who have made both a deposit AND a withdrawal.
Select 
A.person_id,
A.first_name,
A.last_name,
B.transaction_type
from [Bank_Transactions].[dbo].[people] A
join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
Where B.transaction_type in ('Deposit', 'Withdrawal')
order by A.person_id

--42. Find people who made a transaction in February 2025 but not in January 2025.
Select 
A.person_id,
A.first_name,
A.last_name,
B.transaction_date
from [Bank_Transactions].[dbo].[people] A
join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
where B.transaction_date like '%2025-02%' and B.transaction_date not like '%2025-01%'

--SELF-JOIN / COMPARISON
--44. Find pairs of people born in the same year (self-join on people using date_of_birth).
Select 
 A.person_id AS Person1_ID,
 A.date_of_birth AS Shared_Birth_Date,
 B.person_id AS Person2_ID
from [Bank_Transactions].[dbo].[people] A
join
[Bank_Transactions].[dbo].[people] B
on A.date_of_birth = B.date_of_birth 
and A.person_id < B.person_id
--This doesn't return anything because there are no pairs

--46. Find people whose total transaction amount is higher than the average across all people.
Select 
A.person_id,
avg(Abs(B.amount)) as Avg_Amount_Spent,
sum(abs(B.amount)) as Total_Amount
from [Bank_Transactions].[dbo].[transactions] A
join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
Group by A.person_id, B.amount
having avg(B.amount) < sum(B.amount)
Order by A.person_id, B.amount

--MULTIPLE / CHAINED JOINS
--48. Imagine a third table `transaction_categories (transaction_type, category_group)`. Join transactions → transaction_categories → people to show each person's spending by category_group.
Create table Transaction_categories
(transaction_type varchar (250),
Category_Group varchar (250)
)
Insert Into Transaction_categories
(transaction_type,Category_Group)
Select 
transaction_type,
case
When transaction_type = 'Deposit' then 'Deposits'
When transaction_type = 'Withdrawal'then 'Withdrawals'
When transaction_type = 'Payment'then 'Payments'
end
from [Bank_Transactions].[dbo].[transactions]


Select 
A.person_id,
A.first_name,
A.last_name,
B.transaction_type,
C.Category_Group,
sum(abs(B.amount)) as Total_Spending
from [Bank_Transactions].[dbo].[people] A
join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
join [Bank_Transactions].[dbo].[Transaction_categories] C
on C.transaction_type = B.transaction_type
group by
A.person_id,
A.first_name,
A.last_name,
B.transaction_type,
C.Category_Group

--or
Select 
A.person_id,
A.first_name,
A.last_name,
B.transaction_type,
sum(abs(B.amount)) as Total_Spending,
case
When transaction_type = 'Deposit' then 'Deposits'
When transaction_type = 'Withdrawal'then 'Withdrawals'
When transaction_type = 'Payment'then 'Payments'
end as Category_Group
from [Bank_Transactions].[dbo].[people] A
join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
group by
A.person_id,A.first_name,A.last_name,B.transaction_type

--TRICKY EDGE CASES
--50. Without using a WHERE clause, use conditional aggregation (CASE WHEN + SUM) to show each person's total deposits and total withdrawals as two separate columns in one row.
Select 
A.person_id,
A.first_name,
A.last_name,
Sum(case
When B.transaction_type = 'Deposit' then B.amount else 0
end) as Deposits,
Sum(abs(case
When B.transaction_type = 'Withdrawal'then B.amount else 0
end)) as Withdrawals
from [Bank_Transactions].[dbo].[people] A
inner join
[Bank_Transactions].[dbo].[transactions] B
on A.person_id=B.person_id
group by
A.person_id,
A.first_name,
A.last_name
