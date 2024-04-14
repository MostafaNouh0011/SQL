/*
SELECT Statement: The SELECT statement is used to select data from a database.

*/

SELECT *                    -- Select all columns
FROM EmployeeDemographics;

SELECT TOP 5 *              -- Select first 5 rows or more if needed
FROM EmployeeDemographics;

SELECT FirstName, LastName  -- Select FirstName and LastName columns
FROM EmployeeDemographics;

/*
DISTINCT, COUNT, MAX, MIN, AVG, SUM Functions

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