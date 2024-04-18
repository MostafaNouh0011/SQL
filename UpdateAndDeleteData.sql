/*
Updating/Deleting Data

- The UPDATE statement is used to update or modify the data of an existing records in a table.
- The DELETE statement is used to delete existing records in a table.

*/

SELECT *
FROM EmployeeDemographics;

UPDATE EmployeeDemographics
SET EmployeeID = 1012 
WHERE FirstName = 'Holly' AND LastName = 'Flax';

UPDATE EmployeeDemographics
SET Age = 31, Gender = 'Female' 
WHERE EmployeeID = 1012;

-- Be careful when using delete
DELETE
FROM EmployeeDemographics
WHERE EmployeeID = 1005;

---------------------------------------------------------------------------------------------
/*
Aliasing - SQL aliases are used to give a table, or a column in a table, a temporary name,
to make names more readable.
An alias is created with the AS keyword.

*/

SELECT FirstName + ' ' + LastName AS FullName
FROM EmployeeDemographics;

SELECT Demo.EmployeeID
FROM EmployeeDemographics AS Demo;

SELECT Demo.EmployeeID, Sal.Salary
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID;

SELECT Demo.EmployeeID, Demo.FirstName, Demo.LastName, Sal.JobTitle, Ware.Age
FROM EmployeeDemographics AS Demo
LEFT JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN WareHouseEmployeeDemographics AS Ware
	ON Demo.EmployeeID = Ware.EmployeeID;

--------------------------------------------------------------------------------------------
/*
Partiotion by

*/

SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID;

SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY Gender;
