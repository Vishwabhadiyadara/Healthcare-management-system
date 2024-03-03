-- Retrieve doctors who have not performed any treatments:

SELECT D.*
FROM Doctor D
LEFT JOIN Treats T ON D.Doctor_ID = T.Doctor_ID
WHERE T.Doctor_ID IS NULL;