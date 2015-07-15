SELECT Department.NAME AS `Department`
	,Employee.NAME AS `Employee`
	,Employee.Salary AS `Salary`
FROM Employee
INNER JOIN (
	SELECT MAX(Salary) AS `Salary`
		,DepartmentId
	FROM Employee
	GROUP BY DepartmentId
	) AS `MaxSalaryEmployee` ON Employee.Salary = MaxSalaryEmployee.Salary
	AND Employee.DepartmentId = MaxSalaryEmployee.DepartmentId
INNER JOIN Department ON Employee.DepartmentId = Department.Id
