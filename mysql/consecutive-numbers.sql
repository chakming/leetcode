SELECT DISTINCT l1.Num
FROM Logs l1
	,Logs l2
	,Logs l3
WHERE l2.Id = l1.Id + 1
	AND l3.Id = l2.Id + 1
	AND l1.Num = l2.Num
	AND l2.Num = l3.Num
