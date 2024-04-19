/*
CTEs - Common Table Expressions
used to manipulate the complex subqueries data
once we cancel this query it's like it never existed
only created in memory rather than a tempdb file like a temp table would be
In general a cte acts like a subquery


So in general the purpose of CTEs is to be able to perform more advanced calculations 
something that you can't do within just one query.

Another reason to use CTEs is just the readability.
*/

WITH CTE_Employee AS
(
SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender, 
AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
FROM EmployeeDemographics Demo
JOIN EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
WHERE Salary > 45000
)
SELECT *
FROM CTE_Employee;


WITH CTE_Employee2 AS
(
SELECT Gender, AVG(Salary) AvgSalary, MAX(Salary) MaxSalary, MIN(Salary) MinSalary, COUNT(Salary) CountSalary
FROM EmployeeDemographics Demo
JOIN EmployeeSalary Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY Gender
)
SELECT AVG(AvgSalary)
FROM CTE_Employee2;