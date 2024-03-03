-- Doctor Specialization and Patient Outcomes

SELECT 
    dpt.Department_Name,
    d.Speciality,
    d.Doctor_Name,
    COUNT(t.Treatment_ID) AS Number_of_Treatments,
    AVG(b.Total) AS Average_Treatment_Cost
FROM 
    Doctor d
JOIN 
    Treatment t ON d.Doctor_ID = t.Doctor_ID
JOIN 
    Bills b ON t.Patient_ID = b.Patient_ID 
JOIN 
    Department dpt ON d.Department_ID = dpt.Department_ID
GROUP BY 
    dpt.Department_Name, d.Speciality, d.Doctor_Name;