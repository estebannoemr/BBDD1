USE bd1;

DROP TRIGGER IF EXISTS addAppointmentPorCliente;

DELIMITER //
CREATE TRIGGER addAppointmentPorCliente
AFTER INSERT ON appointment FOR EACH ROW
BEGIN
	UPDATE appointments_per_patient SET
		count_appointments = (count_appointments + 1),
		last_update = NOW(),
		user = CURRENT_USER()
	WHERE id_patient = NEW.patient_id;
END;
// DELIMITER ;
