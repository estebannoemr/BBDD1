USE bd1;

SELECT patient_id
FROM patient p
WHERE (
	SELECT COUNT(doctor_id)
    FROM doctor d
    WHERE p.patient_city = d.doctor_city)
= (
	SELECT COUNT(DISTINCT d.doctor_id)
    FROM medical_review mw
		INNER JOIN doctor d ON mw.doctor_id = d.doctor_id
    WHERE p.patient_id = mw.patient_id
    AND p.patient_city = d.doctor_city
)
ORDER BY patient_id
LIMIT 100;
