USE bd1;


INSERT INTO appointment (patient_id, appointment_date, appointment_duration, contact_phone, observations, payment_card)
VALUES (10000036, NOW(), 30, '+54 9 3646 2798', 'Check-up', '9999999999999999');

SELECT * FROM appointment;