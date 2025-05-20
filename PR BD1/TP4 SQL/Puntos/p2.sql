USE bd1;

SELECT *
FROM PATIENT p
WHERE NOT EXISTS (
    SELECT 1
    FROM APPOINTMENT a
    WHERE a.patient_id = p.patient_id
      AND a.contact_phone = p.secondary_phone
);
