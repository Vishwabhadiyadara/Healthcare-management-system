-- Appointment Scheduling Efficiency

SELECT 
    Doctor_ID,
    COUNT(Appointment_ID) AS Total_Appointments,
    AVG(TIMESTAMPDIFF(MINUTE, Appointment_Time, Next_Appointment_Time)) AS Average_Wait_Time
FROM 
    (SELECT 
         a.Doctor_ID, 
         a.Appointment_ID, 
         a.Appointment_Time, 
         LEAD(a.Appointment_Time) OVER (PARTITION BY a.Doctor_ID ORDER BY a.Appointment_Time) AS Next_Appointment_Time
     FROM 
         Appointment a) AS Appointments
GROUP BY 
    Doctor_ID;