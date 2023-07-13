
INSERT INTO PACIENTE (nss, nombre, apellido, domicilio, codigo_postal, telefono, nro_historial_clinico, observaciones)
VALUES (22558, 'Antonio', 'Magallanes', 'Dos Pindo 260', 3640, NULL, 1932, NULL);
UPDATE PACIENTE SET telefono = '3745-589174' WHERE nss = 22558;
SELECT CONCAT(apellido, ', ', nombre) AS paciente, observaciones AS observacion_registrada
FROM PACIENTE
WHERE observaciones IS NOT NULL;
SELECT CONCAT(PACIENTE.apellido, ', ', PACIENTE.nombre) AS paciente, MEDICO.especialidad
FROM PACIENTE
JOIN INGRESO ON PACIENTE.nro_historial_clinico = INGRESO.nro_historia_paciente
JOIN MEDICO ON INGRESO.matricula_medico = MEDICO.matricula;
DELETE FROM MEDICO
WHERE matricula NOT IN (SELECT DISTINCT matricula_medico FROM INGRESO);
SELECT nro_cama, COUNT(*) AS usos
FROM INGRESO
GROUP BY nro_cama
ORDER BY usos DESC;
SELECT CONCAT(apellido, ', ', nombre) AS paciente, COUNT(*) AS cantidad_ingresos
FROM PACIENTE
JOIN INGRESO ON PACIENTE.nro_historial_clinico = INGRESO.nro_historia_paciente
GROUP BY paciente
HAVING COUNT(*) >= 4;
