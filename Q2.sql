-- Find the top 5 departments with the LOWEST average treatment cost:

SELECT D.Department_ID, D.Department_Name,
AVG(B.Treatment_Cost) AS Avg_Treatment_Cost
FROM Department D
JOIN Bills B ON D.Department_ID = B.Department_ID
GROUP BY D.Department_ID, D.Department_Name
ORDER BY Avg_Treatment_Cost ASC
LIMIT 5;