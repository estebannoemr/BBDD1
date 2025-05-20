USE bd1;

CREATE VIEW doctors_per_patients AS
    SELECT p.patient_id, d.doctor_id
    FROM patient p
		INNER JOIN doctor d ON p.patient_city = d.doctor_city;
    -- ORDER BY p.dniCliente;
