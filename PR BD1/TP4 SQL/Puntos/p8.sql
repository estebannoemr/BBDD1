USE bd1;

DROP PROCEDURE IF EXISTS agregarAppointment;

DELIMITER //
CREATE PROCEDURE agregarAppointment
(
	IN idPaciente INT,
    IN idDoctor INT,
    IN durCita INT,
	IN telContacto VARCHAR(45),
	IN nombreMedicacion VARCHAR(30)
    
    -- IN diaCita DATETIME,
    -- IN appointment_address VARCHAR(255) NO ESTA EN LA TABLA
)
BEGIN
	-- Declarar una variable local
    DECLARE diaCita DATETIME;

    -- Asignar el valor de NOW() a la variable
    SET diaCita = NOW();
    
    -- DECLARE ciudad VARCHAR(50);
    -- DECLARE tarjeta VARCHAR(20);
    
    -- SELECT patient_address
	-- INTO dirCliente
    -- FROM patient p
    -- WHERE p.patient_id = patient_id;
    
    -- IF pagoConTarjetaPrimaria = 1 THEN
	-- SELECT tarjetaPrimaria INTO tarjeta
    -- FROM patient p
	-- WHERE p.patient_id = patient_id;
	-- ELSE
	-- SELECT tarjetaSecundaria INTO tarjeta
	-- FROM patient p
	-- WHERE p.patient_id = patient_id;
    -- END IF;
    
    START TRANSACTION;
    INSERT INTO appointment (
		patient_id, appointment_date, appointment_duration,
        contact_phone, observations, payment_card
	) VALUES (
		idPaciente, diaCita, durCita,
        telContacto, NULL, NULL);
	
    INSERT INTO medical_review (
		patient_id, appointment_date, doctor_id
	) VALUES (
		idPaciente, diaCita, idDoctor);
	
    INSERT INTO prescribed_medication (
		patient_id, appointment_date, medication_name
	) VALUES (
		idPaciente, diaCita, nombreMedicacion
    );
    COMMIT;
END;
// DELIMITER ;
