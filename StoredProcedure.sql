
/*
	Stored Procedures
	
Stored procedures are a way to save your SQL code that you can reuse over and over again.

So if you have an SQL query that you write over and over again, save it as a stored procedure, and then just call it to execute it.

You can also pass parameters to a stored procedure, so that the stored procedure can act based on the parameter value(s) that is passed.

*/

-- Create a Stored Procedure
CREATE PROCEDURE TEST
AS
SELECT * FROM EmployeeDemographics
GO;

-- Execute a Stored Procedure
EXEC TEST;


CREATE PROCEDURE Temp_Employee_Proc
AS
CREATE TABLE #Tem_Employee (
	JobTitle varchar(50),
	EmployeesPerJob int,
	AvgAge int,
	AvgSalary int
);
INSERT INTO #Tem_Employee
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle;

SELECT * FROM #Tem_Employee
GO;

EXEC Temp_Employee_Proc;

-- Stored Procedure With a Parameter
CREATE PROCEDURE SelectEmployee 
@TheName nvarchar(50)
AS
SELECT * FROM EmployeeDemographics
WHERE FirstName = @TheName
GO;

EXEC SelectEmployee @TheName = 'Michael';