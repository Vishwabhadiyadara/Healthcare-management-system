-- Patient Demographic Analysis for Targeted Healthcare Programs

SELECT 
    YEAR(CURRENT_DATE) - YEAR(Patient_DOB) AS Age,
    COUNT(*) AS Patient_Count,
    d.Disease
FROM 
    Patient p
JOIN 
    Diagnosis d ON p.Patient_ID = d.Patient_ID
GROUP BY 
    Age, d.Disease;
