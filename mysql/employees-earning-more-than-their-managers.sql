SELECT e1.NAME
FROM Employee e1
LEFT OUTER JOIN Employee e2 ON e1.ManagerId = e2.Id
	AND e1.Salary > e2.Salary
WHERE e2.Id IS NOT NULL
