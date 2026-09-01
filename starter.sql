-- ============================
-- TABLE 1: People (personal details)
-- ============================
--Create database Bank_Transactions


CREATE TABLE Bank_Transactions.dbo.people (
    person_id     INT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(100),
    phone         VARCHAR(20),
    city          VARCHAR(50),
    date_of_birth DATE
);

INSERT INTO Bank_Transactions.dbo.people (person_id, first_name, last_name, email, phone, city, date_of_birth) VALUES
(1,  'John',    'Smith',    'john.smith@email.com',    '0821234567', 'Cape Town',   '1985-03-12'),
(2,  'Sarah',   'Jones',    'sarah.jones@email.com',   '0827654321', 'Johannesburg','1990-07-22'),
(3,  'Michael', 'Brown',    'michael.brown@email.com', '0731122334', 'Durban',      '1978-11-05'),
(4,  'Emily',   'Davis',    'emily.davis@email.com',   '0845566778', 'Pretoria',    '1995-01-30'),
(5,  'David',   'Wilson',   'david.wilson@email.com',  '0619988776', 'Cape Town',   '1982-09-14'),
(6,  'Lisa',    'Miller',   'lisa.miller@email.com',   '0723344556', 'Bloemfontein','1988-05-19'),
(7,  'James',   'Taylor',   'james.taylor@email.com',  '0836677889', 'Port Elizabeth','1975-12-01'),
(8,  'Anna',    'Anderson', 'anna.anderson@email.com', '0812233445', 'Cape Town',   '1993-04-08'),
(9,  'Robert',  'Thomas',   'robert.thomas@email.com', '0798877665', 'Johannesburg','1980-06-25'),
(10, 'Karen',   'Jackson',  'karen.jackson@email.com', '0765544332', 'Durban',      '1998-02-17');

-- ============================
-- TABLE 2: Transactions (bank statements)
-- ============================
CREATE TABLE Bank_Transactions.dbo.transactions (
    transaction_id   INT PRIMARY KEY,
    person_id        INT,
    transaction_date DATE,
    description      VARCHAR(100),
    amount           DECIMAL(10,2),
    transaction_type VARCHAR(20)   -- e.g. 'Deposit', 'Withdrawal', 'Payment'
);

INSERT INTO Bank_Transactions.dbo.transactions (transaction_id, person_id, transaction_date, description, amount, transaction_type) VALUES
(1,  1, '2025-01-05', 'Salary Deposit',        15000.00, 'Deposit'),
(2,  1, '2025-01-07', 'Grocery Store',          -650.25, 'Withdrawal'),
(3,  2, '2025-01-06', 'Salary Deposit',        18500.00, 'Deposit'),
(4,  2, '2025-01-10', 'Electricity Bill',       -900.00, 'Payment'),
(5,  3, '2025-01-08', 'Freelance Payment',      7200.00, 'Deposit'),
(6,  3, '2025-01-12', 'Restaurant',             -420.50, 'Withdrawal'),
(7,  4, '2025-01-09', 'Salary Deposit',        12300.00, 'Deposit'),
(8,  4, '2025-01-15', 'Online Shopping',       -1250.00, 'Withdrawal'),
(9,  5, '2025-01-11', 'Salary Deposit',        20000.00, 'Deposit'),
(10, 5, '2025-01-16', 'Car Payment',           -3500.00, 'Payment'),
(11, 6, '2025-01-13', 'Salary Deposit',         9800.00, 'Deposit'),
(12, 6, '2025-01-18', 'Pharmacy',               -210.00, 'Withdrawal'),
(13, 7, '2025-01-14', 'Salary Deposit',        16200.00, 'Deposit'),
(14, 7, '2025-01-19', 'Rent Payment',          -6000.00, 'Payment'),
(15, 8, '2025-01-17', 'Salary Deposit',        11000.00, 'Deposit'),
(16, 8, '2025-01-20', 'Clothing Store',         -890.00, 'Withdrawal'),
(17, 9, '2025-01-18', 'Salary Deposit',        14500.00, 'Deposit'),
(18, 9, '2025-01-22', 'Internet Bill',          -750.00, 'Payment'),
(19, 10,'2025-01-19', 'Salary Deposit',        10200.00, 'Deposit'),
(20, 10,'2025-01-23', 'Fuel Station',           -560.00, 'Withdrawal'),
(21, 1, '2025-01-24', 'ATM Withdrawal',        -1000.00, 'Withdrawal'),
(22, 2, '2025-01-25', 'Insurance Payment',     -1200.00, 'Payment'),
(23, 3, '2025-01-26', 'Grocery Store',          -530.75, 'Withdrawal'),
(24, 4, '2025-01-27', 'Salary Bonus',           3000.00, 'Deposit'),
(25, 5, '2025-01-28', 'Restaurant',             -310.00, 'Withdrawal'),
(26, 6, '2025-01-29', 'Freelance Payment',      4500.00, 'Deposit'),
(27, 7, '2025-01-30', 'Gym Membership',         -450.00, 'Payment'),
(28, 8, '2025-02-01', 'Salary Deposit',        11000.00, 'Deposit'),
(29, 9, '2025-02-02', 'Car Insurance',         -1350.00, 'Payment'),
(30, 10,'2025-02-03', 'Online Shopping',        -670.00, 'Withdrawal'),
(31, 1, '2025-02-04', 'Salary Deposit',        15000.00, 'Deposit'),
(32, 2, '2025-02-05', 'Grocery Store',          -720.00, 'Withdrawal'),
(33, 3, '2025-02-06', 'Freelance Payment',      6100.00, 'Deposit'),
(34, 4, '2025-02-07', 'Phone Bill',             -399.00, 'Payment'),
(35, 5, '2025-02-08', 'Salary Deposit',        20000.00, 'Deposit'),
(36, 6, '2025-02-09', 'Pharmacy',               -180.00, 'Withdrawal'),
(37, 7, '2025-02-10', 'Salary Deposit',        16200.00, 'Deposit'),
(38, 8, '2025-02-11', 'Clothing Store',         -540.00, 'Withdrawal'),
(39, 9, '2025-02-12', 'Salary Deposit',        14500.00, 'Deposit'),
(40, 10,'2025-02-13', 'Fuel Station',           -610.00, 'Withdrawal'),
(41, 11,'2025-02-14', 'Unknown Deposit',        2000.00, 'Deposit'),
(42, 12,'2025-02-15', 'Unknown Payment',       -1500.00, 'Payment'),
(43, 1, '2025-02-16', 'Restaurant',             -260.00, 'Withdrawal'),
(44, 2, '2025-02-17', 'Salary Deposit',        18500.00, 'Deposit'),
(45, 3, '2025-02-18', 'ATM Withdrawal',        -800.00, 'Withdrawal'),
(46, 4, '2025-02-19', 'Grocery Store',          -410.00, 'Withdrawal'),
(47, 5, '2025-02-20', 'Rent Payment',          -7000.00, 'Payment'),
(48, 6, '2025-02-21', 'Salary Deposit',         9800.00, 'Deposit'),
(49, 7, '2025-02-22', 'Insurance Payment',     -1100.00, 'Payment'),
(50, 8, '2025-02-23', 'Freelance Payment',      3800.00, 'Deposit');

--24. List every person along with their most recent transaction date (NULL if they have none). 
--very good example of how LEFT JOIN, MAX(), GROUP BY, and ORDER BY work together.
--The p. means the column comes from the people table.

--These are the columns I want to see in my result.
--person_id
--first_name
--last_name
--most_recent_transaction_date
SELECT
    p.person_id,
    p.first_name,
    p.last_name,
    MAX(t.transaction_date) AS most_recent_transaction_date
FROM Bank_Transactions.dbo.people p
LEFT JOIN Bank_Transactions.dbo.transactions t
    ON p.person_id = t.person_id
GROUP BY
    p.person_id,
    p.first_name,
    p.last_name
ORDER BY p.person_id;

--25. Show all people and the number of transactions they've made, including 0 for those with none.

SELECT
    p.person_id,
    p.first_name,
    p.last_name,
    COUNT(t.transaction_id) AS transaction_count
FROM Bank_Transactions.dbo.people p
LEFT JOIN Bank_Transactions.dbo.transactions t
    ON p.person_id = t.person_id
GROUP BY
    p.person_id,
    p.first_name,
    p.last_name
ORDER BY p.person_id;

--26. Find people whose only transactions (if any) are deposits — including people with zero transactions.

SELECT
    p.person_id,
    p.first_name,
    p.last_name
FROM Bank_Transactions.dbo.people p
LEFT JOIN Bank_Transactions.dbo.transactions t
    ON p.person_id = t.person_id
GROUP BY
    p.person_id,
    p.first_name,
    p.last_name
HAVING
    SUM(
        CASE
            WHEN t.transaction_id IS NOT NULL
                 AND t.transaction_type <> 'Deposit'
            THEN 1
            ELSE 0
        END
    ) = 0
ORDER BY p.person_id;

--27. List all people and a column that says 'Has activity' or 'No activity' based on whether they appear in transactions.

SELECT
    p.person_id,
    p.first_name,
    p.last_name,
    CASE
        WHEN t.person_id IS NOT NULL THEN 'Has activity'
        ELSE 'No activity'
    END AS activity_status
FROM Bank_Transactions.dbo.people p
LEFT JOIN Bank_Transactions.dbo.transactions t
    ON p.person_id = t.person_id
GROUP BY
    p.person_id,
    p.first_name,
    p.last_name,
    t.person_id
ORDER BY p.person_id;