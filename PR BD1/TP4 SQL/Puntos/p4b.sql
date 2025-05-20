USE bd1;

SELECT patient_id
FROM patient p
WHERE (
	SELECT COUNT(doctor_id)
    FROM doctors_per_patients dp	-- ESTO CAMBIA
    WHERE p.patient_id = dp.patient_id)	-- ESTO CAMBIA
= (
	SELECT COUNT(DISTINCT d.doctor_id)
    FROM medical_review mw
		INNER JOIN doctor d ON mw.doctor_id = d.doctor_id
    WHERE p.patient_id = mw.patient_id
    AND p.patient_city = d.doctor_city
)
ORDER BY patient_id
LIMIT 100;
