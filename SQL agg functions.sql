# COUNT() - return single value, COUNT(*) works

SELECT *
FROM salaries
ORDER BY salary DESC
LIMIT 10;

SELECT COUNT(DISTINCT from_date)
FROM salaries

#exercise

SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

# SUM - work only numeric data

SELECT SUM(salary)
FROM salaries;

# exercise
SELECT SUM(salary)
FROM salaries
WHERE from_date > '1997-01-01';

# MIN & MAX

SELECT MIN(salary)
FROM salaries;

# Exercise

SELECT MIN(emp_no)
FROM employees;

SELECT MAX(emp_no)
FROM employees;

# AVG() : AVERAGE OF ALL NON-NULL VALUES

SELECT ROUND(AVG(salary))
FROM salaries;

#Exercise
SELECT AVG(salary)
FROM salaries
WHERE from_date > '1997-01-01';




# ROUND(#, deciaml_places)
# exercise



SELECT ROUND(AVG(salary),2)
FROM salaries
WHERE from_date > '1997-01-01';

# IFNULL() and COALESCE()
/*
IFNULL(expression_1,expression_2)
- returns the first of the two indicated values if the data value
found in the table is not null, and returns the second value
if there is a null value.
- prints the returned value in the column of the output

*/

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name
FROM
    departments_dup;
    
    
/*
COALESCE(expression 1, expression 2, ... expression N)
- allows you to insert N arguments in the parentheses
- always return a single value of the ones we have
within parentheses, and this value will be the first non-null
value of this list, reading the values from left to right. 
*/

SELECT *
FROM departments_dup
ORDER BY dept_no;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_mananger
FROM
    departments_dup
ORDER BY dept_no ASC;


# COALESCE() can help visualize a prototype of the table's final ver. 
SELECT 
    dept_no,
    dept_name,
    COALESCE('department manager name') AS fake_col
FROM
    departments_dup;

# exercise

SELECT IFNULL(dept_no,'N/A') as dept_no,
IFNULL(dept_name, 'Department name not provided') as dept_name,
COALESCE(dept_no,dept_name) as dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

