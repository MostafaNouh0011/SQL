/*
Temp Tables - Temporary Tables
It is designed to store temporary data that is needed for a short duration and doesn't require a permanent storage solution.

*/

CREATE TABLE #Temp_Employee (
	EmployeeID int, 
	JobTitle varchar(100), 
	Salary int
);

SELECT *
FROM #Temp_Employee;

INSERT INTO #Temp_Employee VALUES
(1001, 'HR', 45000)

-- We can quickly select all of the data from a specific table and insert that into a temp table 
INSERT INTO #Temp_Employee
SELECT *
FROM EmployeeSalary;


CREATE TABLE #Tem_Employee2 (
	JobTitle varchar(50),
	EmployeesPerJob int,
	AvgAge int,
	AvgSalary int
);

INSERT INTO #Tem_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle;

SELECT * FROM #Tem_Employee2;


-- For whatever reason you need to run it multiple times 
DROP TABLE IF EXISTS #Tem_Employee2        -- so adding that just to make sure things run smoothly
CREATE TABLE #Tem_Employee2 (
	JobTitle varchar(50),
	EmployeesPerJob int,
	AvgAge int,
	AvgSalary int
);

INSERT INTO #Tem_Employee2
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle;

SELECT * FROM #Tem_Employee2;