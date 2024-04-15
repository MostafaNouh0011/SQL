/*
WHERE Statment - filters a result set to include only records that fulfill a specified condition.

*/

SELECT *
FROM EmployeeDemographics
WHERE LastName = 'Mick';              -- Where LastName equal 'Mick'

SELECT *
FROM EmployeeDemographics
WHERE LastName <> 'Mick';             -- Not equal

SELECT *
FROM EmployeeDemographics
WHERE Age > 30;                       -- Greater than and like it the >=, <, and <=

SELECT *
FROM EmployeeDemographics
WHERE Age BETWEEN 30 AND 32;          -- This 'll include 30, 31, 32

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%';             -- Search for a name that starts with S

SELECT *
FROM EmployeeDemographics
WHERE LastName IS NULL;

SELECT *
FROM EmployeeDemographics
WHERE LastName IS NOT NULL;


/*
GROUP BY:
- The GROUP BY statement groups rows that have the same 
values into summary rows, like "find the number of customers in each country".
- The GROUP BY statement is often used with aggregate 
functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

ORDER BY:
- The ORDER BY command is used to sort the result set in ascending or descending order.

*/

SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender;

SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY GenderCount DESC;                 -- By default it is ASC

SELECT *
FROM EmployeeDemographics
ORDER BY Age DESC;

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC;                           -- This is the same as above, 4 is the number of age column