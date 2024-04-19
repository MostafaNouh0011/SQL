/*
Subqueries - A subquery is a query that is nested inside a SELECT, INSERT, UPDATE, DELETE, or WHERE statement,
or inside another subquery.

*/


-- Subquery in select
SELECT EmployeeID, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
FROM EmployeeSalary;

-- How to it with partition by
Select EmployeeID, Salary, Avg(Salary) Over() As AllAvgSalary
From EmployeeSalary;

-- Why group by doesn't work
Select EmployeeID, Salary, Avg(Salary) As AllAvgSalary
From EmployeeSalary
Group by EmployeeID, Salary
Order by 1, 2;


-- Subquery in from
Select a.EmployeeID, a.AllAvgSalary
From (Select EmployeeID, Salary, Avg(Salary) Over () As AllAvgSalary
	  From EmployeeSalary) a;


-- Subquery in where
Select EmployeeID, JobTitle, Salary
From EmployeeSalary
Where EmployeeID in (Select EmployeeID 
					 From EmployeeDemographics
					 Where Age > 30);