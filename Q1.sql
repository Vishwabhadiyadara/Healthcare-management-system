-- List doctors who have treated patients for multiple different diseases in a single appointment:

SELECT DISTINCT D.Doctor_ID, D.Doctor_Name
FROM Treats T
JOIN Diagnosis DS ON T.Patient_ID = DS.Patient_ID AND T.Doctor_ID = DS.Doctor_ID
JOIN Doctor D ON T.Doctor_ID = D.Doctor_ID
WHERE T.Treatment_ID IN (
    SELECT Treatment_ID
    FROM Diagnosis
    GROUP BY Treatment_ID
    HAVING COUNT(DISTINCT Disease) > 1
);