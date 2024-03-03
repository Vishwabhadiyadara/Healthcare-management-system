-- Analysis of Disease Trends Over Time

WITH MonthlyDiagnoses AS (
    SELECT 
        YEAR(Diagnosis_Date) AS Year,
        MONTH(Diagnosis_Date) AS Month,
        Disease,
        COUNT(*) AS Number_of_Diagnoses,
        ROW_NUMBER() OVER (PARTITION BY YEAR(Diagnosis_Date), MONTH(Diagnosis_Date) ORDER BY COUNT(*) DESC) AS Disease_Rank
    FROM 
        Diagnosis
    GROUP BY 
        Year, Month, Disease
)
SELECT 
    Year,
    Month,
    Disease,
    Number_of_Diagnoses
FROM 
    MonthlyDiagnoses
WHERE 
    Disease_Rank = 1;