-- Comprehensive Patient Billing Report

SELECT 
    b.Bill_ID,
    p.Patient_Name,
    b.Patient_ID,
    SUM(b.Equipment_Cost) AS Equipment_Costs,
    SUM(b.Medical_Cost) AS Medical_Costs,
    SUM(b.Treatment_Cost) AS Treatment_Costs,
    SUM(b.Total) AS Total_Bill
FROM 
    Bills b
JOIN 
    Patient p ON b.Patient_ID = p.Patient_ID
GROUP BY 
    b.Bill_ID, p.Patient_Name, b.Patient_ID;