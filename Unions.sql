/*
Union - The UNION operator is used to combine the result-set of two or more SELECT statements.
    Every SELECT statement within UNION must have the same number of columns
    The columns must also have similar data types
    The columns in every SELECT statement must also be in the same order

The UNION operator selects all values without duplicates

Union all - Selects all values with duplicates

*/

-- Create Table 3:
CREATE TABLE WareHouseEmployeeDemographics (
    EmployeeID int, 
    FirstName varchar(50),
    LastName varchar(50),
    Age int, 
    Gender varchar(50)
);

INSERT INTO WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female');

SELECT *
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics;

SELECT *
FROM EmployeeDemographics
UNION ALL
SELECT *
FROM WareHouseEmployeeDemographics
ORDER BY EmployeeID;

-- It will work because the columns have similar data types
SELECT EmployeeID, FirstName, Age
FROM EmployeeDemographics
UNION ALL
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
ORDER BY EmployeeID;