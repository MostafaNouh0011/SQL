/*
	String Fuctions

	SQL Server has many built-in functions
	
	Here are some of these most usable functions - LENGTH, TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

If you want more check this out: https://www.w3schools.com/sql/sql_ref_sqlserver.asp

*/

CREATE TABLE EmployeeErrors (
	EmployeeID varchar(50),
	FirstName varchar(50),
	LastName varchar(50)
);

INSERT INTO EmployeeErrors VALUES
('1001  ', 'Jimbo', 'Halbert'),
('  1002', 'Pamela', 'Beasely'),
('1005', 'TOby', 'Flenderson - Fired')

SELECT * FROM EmployeeErrors;

SELECT FirstName, LENGTH(FirstName)      -- Return the length of the first name of each employee
FROM EmployeeDemographics;

SELECT TRIM(EmployeeID)        -- Remove all blank spaces 
FROM EmployeeErrors;

SELECT LTRIM(EmployeeID)       -- Remove the left blank spaces
FROM EmployeeErrors;

SELECT RTRIM(EmployeeID)       -- Remove the right blank spaces
FROM EmployeeErrors;


SELECT LastName, REPLACE(LastName, ' - Fired', '') AS LastNameFixed
FROM EmployeeErrors;

SELECT FirstName, SUBSTRING(FirstName, 1, 3)         -- Extracts the selected characters from the string
FROM EmployeeErrors;

SELECT err.FirstName, SUBSTRING(err.FirstName, 1, 3), dem.FirstName, SUBSTRING(dem.FirstName, 1, 3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem
	ON SUBSTRING(err.FirstName, 1, 3) = SUBSTRING(dem.FirstName, 1, 3);


SELECT FirstName, UPPER(FirstName)         -- Convert the string to upper-case
FROM EmployeeErrors;

SELECT FirstName, LOWER(FirstName)         -- Convert the string to lower-case
FROM EmployeeErrors;