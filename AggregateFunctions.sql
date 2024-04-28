/*
Aggregate functions in SQL condense sets of values into single results, often used with the GROUP BY clause to 
categorize data into groups and calculate a single value for each group.

Here are some examples: DISTINCT, COUNT, MAX, MIN, AVG, SUM Functions

*/


SELECT DISTINCT(EmployeeID)    -- Returns unique values in this row
FROM EmployeeDemographics;

SELECT COUNT(LastName)         -- Returns number of rows in this column
FROM EmployeeDemographics;

SELECT MAX(Salary)             -- Returns the largest value of the selected column
FROM EmployeeSalary;

SELECT MIN(Salary)             -- Returns the smallest value of the selected column
FROM EmployeeSalary;

SELECT AVG(Salary)             -- Returns the average value of a numeric column
FROM EmployeeSalary;

SELECT SUM(Salary)             -- Returns the total sum of a numeric column
FROM EmployeeSalary;  