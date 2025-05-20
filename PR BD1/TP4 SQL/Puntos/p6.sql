USE bd1;

DELIMITER //
CREATE PROCEDURE storedProcedure() BEGIN
    DECLARE salir INT DEFAULT 0;
    DECLARE id_paciente INT(11);
    DECLARE cant INT(11);
    
    -- Definir el cursor para calcular el número de citas para cada paciente
	DECLARE contar CURSOR FOR 
		SELECT a.patient_id, COUNT(a.patient_id) -- AS cantAppointments		-- var contadora
		FROM appointment a
		GROUP BY a.patient_id;
	
    -- Manejar finalización del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET salir = 1;
	
    -- Iniciar la transacción
    START TRANSACTION;
    
		-- Abrir el cursor
        OPEN contar;
        
        -- Iterar sobre cada fila en el cursor
        agregar: LOOP
            FETCH NEXT FROM contar INTO id_paciente, cant;
            
            IF salir = 1 THEN
                LEAVE agregar;
            END IF;
            
            INSERT INTO appointments_per_patient(
                id_patient,		-- columna del appointments_per_patient
                count_appointments,
                last_update,
                user		
            ) VALUES (
                id_paciente,
                cant,
                NOW(),
                CURRENT_USER()
            );
        END LOOP;
    
	-- Cerrar el cursor
    CLOSE contar;
	
    -- Confirmar la transacción
    COMMIT;
END;
// DELIMITER ;