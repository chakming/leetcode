SELECT Department.NAME AS `Department`
	,Employee.NAME AS `Employee`
	,Employee.Salary AS `Salary`
FROM Employee
INNER JOIN (
	SELECT Employee.DepartmentId
		,Employee.Salary
		,COUNT(DISTINCT (EmployeeB.Salary)) AS `Rank`
	FROM Employee
	LEFT JOIN Employee AS `EmployeeB` ON Employee.DepartmentId = EmployeeB.DepartmentId
		AND Employee.Salary < EmployeeB.Salary
	GROUP BY Employee.DepartmentId
		,Employee.Salary
	HAVING Rank < 3
	) AS `MaxSalaryEmployee` ON Employee.Salary = MaxSalaryEmployee.Salary
	AND Employee.DepartmentId = MaxSalaryEmployee.DepartmentId
INNER JOIN Department ON Employee.DepartmentId = Department.Id
ORDER BY Department.Id ASC
	,Employee.Salary DESC
