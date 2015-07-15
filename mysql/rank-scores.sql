SELECT S1.Score AS `Score`
	,COUNT(DISTINCT (S2.Score)) AS `Rank`
FROM Scores S1
LEFT JOIN Scores S2 ON S1.Score <= S2.Score
GROUP BY S1.Id
HAVING Rank > 0
ORDER BY Rank ASC
