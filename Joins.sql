/*
Joins - A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

(INNER) JOIN - Returns records that have matching values in both tables
LEFT (OUTER) JOIN - Returns all records from the left table, and the matched records from the right table
RIGHT (OUTER) JOIN - Returns all records from the right table, and the matched records from the left table
FULL (OUTER) JOIN - Returns all records when there is a match in either left or right table

*/

-- Let's insert into table 1 some extra values:
INSERT INTO EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male');

SELECT *
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN EmployeeSalary                                           -- Like Union
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT *
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT *
FROM EmployeeDemographics
RIGHT OUTER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID;

-- To see who takes largest salary
SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
ORDER BY Salary DESC;

-- Average salary for salesmen
SELECT JobTitle, AVG(Salary)
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle;