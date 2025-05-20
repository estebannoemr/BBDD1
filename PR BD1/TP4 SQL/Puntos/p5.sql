USE bd1;

CREATE TABLE APPOINTMENTS_PER_PATIENT (
    idApP INT(11) PRIMARY KEY AUTO_INCREMENT,  -- Clave primaria con auto-incremento
    id_patient INT(11) NOT NULL,               -- Identificador del paciente, obligatorio
    count_appointments INT(11),                -- Cantidad de citas
    last_update DATETIME,                      -- Fecha y hora de la última actualización
    user VARCHAR(16),                          -- Usuario que realizó la última modificación
    FOREIGN KEY (id_patient) REFERENCES PATIENT(patient_id)  -- Llave foránea a la tabla PATIENT
);
