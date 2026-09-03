SQL JOIN Practice Project
📌 Project Overview

This project was completed as part of a Data Engineering learning project in collaboration with Mirriam.

The objective of the project was to strengthen our understanding of SQL JOINs and learn how to retrieve, combine, filter, and analyse data stored across related database tables.

The project primarily used two tables:

people — containing information about individuals, including their person_id, name, city, email, and date of birth.
transactions — containing financial transaction information, with person_id used to connect transactions to people.

We worked through a series of SQL questions that progressively covered different types of JOINs and more advanced SQL concepts.

🎯 Project Objectives

The main objectives of this project were to:

Understand how SQL JOINs connect related tables.
Practise INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.
Work with aggregate functions such as SUM(), COUNT(), AVG(), MAX(), and MIN().
Use GROUP BY and HAVING to analyse grouped data.
Apply filtering conditions to joined datasets.
Identify records with missing relationships.
Use self-joins to compare records within the same table.
Work with chained and multiple JOINs.
Use conditional aggregation with CASE WHEN.
Analyse transaction activity and customer behaviour.
🗄️ Database Structure
People

The people table contains information about individuals.

Example fields include:

person_id
first_name
last_name
email
city
date_of_birth
Transactions

The transactions table contains financial transaction information.

Example fields include:

transaction_id
person_id
transaction_date
transaction_type
amount
description

The relationship between the tables is established through:

people.person_id = transactions.person_id

This relationship allows us to combine information about a person with their associated transactions.

🔗 SQL JOINs Covered
1. INNER JOIN

An INNER JOIN was used to return records where a matching record exists in both tables.

Examples included:

Finding transactions made by people living in Durban.
Finding people who have made withdrawals.
Finding transactions from January 2025 together with the person's name.
Finding transactions where money was going out.

These questions helped demonstrate how JOINs can be used to combine related information from multiple tables.

2. LEFT JOIN

A LEFT JOIN was used to ensure that every person was included, even if they had no transactions.

Examples included:

Finding each person's most recent transaction.
Counting the number of transactions per person.
Identifying people whose transactions are only deposits.
Determining whether a person has any transaction activity.

This was particularly useful for identifying people who had zero transactions.

3. RIGHT JOIN

A RIGHT JOIN was used to ensure that every transaction was included, even when there was no matching person.

Examples included:

Finding the city associated with each transaction.
Identifying orphaned transactions.
Calculating the total value of transactions without a matching person.
Checking whether a person_id is valid.

This demonstrated how JOINs can be used to identify data quality issues and unmatched records.

4. FULL OUTER JOIN

A FULL OUTER JOIN was used to combine all people and all transactions, regardless of whether a matching record existed.

This allowed us to identify:

People without transactions.
Transactions without matching people.
Missing relationships between the two tables.
NULL values on either side of the relationship.

We also analysed the resulting dataset to determine how many records contained missing people or missing transactions.

📊 Aggregation + JOINs

The project also introduced aggregate analysis using JOINs.

We used functions such as:

COUNT()
SUM()
AVG()
MAX()
MIN()

Examples included:

Calculating the total number of transactions per city.
Calculating total transaction amounts.
Finding each person's largest transaction.
Finding each person's smallest transaction.
Ranking people according to their total transaction volume.
Calculating the average number of transactions per person.
Finding the city with the highest total deposit amount.

These questions demonstrated how JOINs and aggregation can be combined to produce meaningful business insights.

🔍 Filtering + JOINs

We also used JOINs together with filtering conditions to answer questions about transaction behaviour.

Examples included:

Finding people who made a transaction over 10,000.
Finding people who made both deposits and withdrawals.
Finding transactions made by people outside Cape Town.
Comparing transaction activity between January and February 2025.
Identifying people with exactly one transaction.

These exercises helped demonstrate how SQL can be used to answer specific business questions from relational data.

🔄 Self-JOINs

A SELF JOIN was introduced to compare records within the same table.

Examples included:

Finding pairs of people born in the same year.
Comparing people who live in the same city.
Identifying cities containing multiple people.

A self-join allows a table to be joined to itself using different aliases.

For example:

FROM people p1
JOIN people p2
    ON YEAR(p1.date_of_birth) = YEAR(p2.date_of_birth)
⛓️ Multiple / Chained JOINs

The project also introduced the concept of joining more than two tables.

For example:

people
   ↓
transactions
   ↓
cities

This type of relationship can be used to retrieve additional information about a transaction, such as the region associated with the person's city.

We also explored the concept of connecting:

transactions
      ↓
transaction_categories
      ↓
people

This demonstrates how relational databases can connect multiple datasets together to create more comprehensive analysis.

🧩 Tricky Edge Cases

The final questions focused on more advanced SQL logic and data quality.

These included identifying:

People who exist in the people table but have never appeared as a foreign key in transactions.
People with no transaction activity.
Orphaned transactions.
Deposit and withdrawal totals for each person.

One of the final exercises introduced conditional aggregation using:

CASE WHEN

combined with:

SUM()

This allowed deposits and withdrawals to be displayed as separate columns for each person without using a WHERE clause.

🛠️ Technologies Used
Microsoft SQL Server
SQL Server Management Studio (SSMS)
SQL
Relational database concepts
JOIN operations
Aggregate functions
Conditional aggregation
🤝 Collaboration

This project was completed collaboratively by:

Krystal & Mirriam

We worked together to understand the database relationships, interpret the questions, develop SQL queries, and analyse the results.

The collaboration helped reinforce the importance of communicating SQL logic clearly and checking query results to ensure they answered the intended question.

📚 Key Concepts Learned

Through this project, we gained practical experience with:

INNER JOIN
LEFT JOIN
RIGHT JOIN
FULL OUTER JOIN
SELF JOIN
GROUP BY
HAVING
WHERE
COUNT()
SUM()
AVG()
MAX()
MIN()
CASE WHEN
Conditional aggregation
Subqueries
Data quality checks
NULL handling
Foreign key relationships
Orphaned records
Relational database analysis
💡 Key Takeaway

The project demonstrated how SQL JOINs are fundamental to data engineering and data analysis.

Rather than analysing tables independently, JOINs allow data from different sources to be connected and transformed into useful information.

The exercises progressed from basic JOIN operations to more advanced techniques involving aggregation, filtering, self-joins, multiple-table relationships, and conditional logic.

This provided practical experience in using SQL to solve real-world data questions and strengthened our understanding of how relational databases work.

## 🤝 Collaboration

This project was completed collaboratively by:

**Krystal & Mirriam**

To ensure that the workload was shared fairly, we split the SQL questions as equally as we could between us. Each person was responsible for solving their assigned questions independently, which gave us the opportunity to apply the SQL concepts individually while still working toward the same project goal.

After completing our assigned questions, we reviewed each other’s answers. This allowed us to compare our SQL logic, identify errors or areas for improvement, and discuss different approaches to solving the same problem. Reviewing each other’s work also helped us strengthen our understanding of JOINs, filtering, aggregation, and relational database concepts.

The collaboration helped reinforce the importance of **clear communication, independent problem-solving, peer review, and validating SQL results** to ensure that queries correctly answered the intended business questions.


👩‍💻 Authors

Krystal &
Mirriam

Data Engineering Project — SQL JOIN Practice