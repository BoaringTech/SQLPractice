-- This is to practice Subqueries
-- First started creating queries using JOINs
-- Then next step was to somehow make use of subqueries to answer the same problems.

-- Get all orders from customers in Ohio, New York, Oregon
SELECT * FROM orders AS o
INNER JOIN customers AS c
USING(customerid)
WHERE c.state IN ('OH','NY','OR');

-- Now use subqueries
SELECT * FROM orders
WHERE customerid IN (
    SELECT customerid FROM customers
    WHERE state IN ('OH','NY','OR')
)

-- Get all employees whose manager has the id = 110183
SELECT * FROM employees AS e
INNER JOIN dept_emp AS de
USING(emp_no)
INNER JOIN dept_manager AS dm
USING(dept_no)
WHERE dm.emp_no = 110183;

-- Now use subqueries
SELECT * FROM employees
WHERE emp_no IN (
    SELECT emp_no FROM dept_emp
    WHERE dept_no = (
        SELECT dept_no FROM dept_manager
        WHERE emp_no = 110183
    )
)
