EXPLAIN
SELECT count(a.patient_id)
FROM appointment a, patient p, doctor d, medical_review mr
WHERE a.patient_id = p.patient_id
	AND a.patient_id = mr.patient_id
	AND a.appointment_date = mr.appointment_date
	AND mr.doctor_id = d.doctor_id
	AND d.doctor_specialty = "Cardiology"
	AND p.patient_city = "Rosario"
