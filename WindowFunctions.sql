/*
	Window Functions

Window functions apply to aggregate and ranking functions over a particular window (set of rows). 
OVER clause is used with window functions to define that window. 

OVER clause does two things : 
	1. Partitions rows to form a set of rows. (PARTITION BY clause is used) 
	2. Orders rows within those partitions into a particular order. (ORDER BY clause is used) 

*/

-- Try an example without window function
Select Gender, Avg(Salary) As SalaryAvg
From EmployeeDemographics Dem
Join EmployeeSalary Sal
	On Dem.EmployeeID = Sal.EmployeeID
Group by Gender;

-- If I want to add additional information like first name and age  -  This will not work
Select FirstName, Age, Gender, Avg(Salary) As SalaryAvg
From EmployeeDemographics Dem
Join EmployeeSalary Sal
	On Dem.EmployeeID = Sal.EmployeeID
Group by Gender;

-- So we will use window function
Select FirstName, Age, Gender, Avg(Salary) Over(Partition by Gender)
From EmployeeDemographics Dem
Join EmployeeSalary Sal
	On Dem.EmployeeID = Sal.EmployeeID;

-- Let's calculate rolling total
Select FirstName, Age, Gender, Salary, Sum(Salary) Over(Partition by Gender Order by Dem.EmployeeID) As RollingTotal
From EmployeeDemographics Dem
Join EmployeeSalary Sal
	On Dem.EmployeeID = Sal.EmployeeID;


Select Dem.EmployeeID, FirstName, Gender, Salary, 
ROW_NUMBER() OVER(PARTITION BY Gender ORDER BY Salary DESC) As RowNum, 
RANK() OVER(PARTITION BY Gender ORDER BY Salary DESC) As RankNum
From EmployeeDemographics Dem
Join EmployeeSalary Sal
	On Dem.EmployeeID = Sal.EmployeeID;
