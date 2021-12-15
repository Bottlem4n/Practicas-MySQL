CREATE DATABASE IF NOT EXISTS  db_test;
USE db_test;

CREATE TABLE IF NOT EXISTS alumno(
	id_alumno INT,
    nombre VARCHAR (20),
    id_carrera INT DEFAULT 5,
    promedio DECIMAL (18,2),
    Fecha_act_prom DATETIME,
    PRIMARY KEY (id_alumno)
);
    
CREATE TABLE IF NOT EXISTS AlumnoPromedioHist(
	id_consec INT AUTO_INCREMENT,
    id_alumno INT,
    nombre VARCHAR (20),
    promedio DECIMAL (18,2),
    Hist_Date DATETIME,
    PRIMARY KEY (id_consec)
);

INSERT INTO alumno (id_alumno,nombre,promedio) values 
					(1,'Luis',7.5),
                    (2,'Mary',8.5),
                    (3,'Paty',9.5),
                    (4,'Perla',10.0);
                    
SELECT * FROM alumno;
SELECT * FROM alumnopromediohist;

SELECT 'Actual' as Origen, id_alumno as id, nombre, promedio from alumno
UNION ALL SELECT 'Historico' as Origen, id_alumno as id, nombre, promedio from alumnopromediohist;

DELIMITER $$
	DROP TRIGGER IF EXISTS AlumnoPromedioAfterUpdate;
	CREATE TRIGGER AlumnoPromedioAfterUpdate
	BEFORE UPDATE ON alumno FOR EACH ROW
		BEGIN
			IF OLD.promedio <> new.promedio THEN
				INSERT INTO alumnopromediohist(id_alumno, nombre, promedio, Hist_Date)
				VALUES(OLD.id_alumno, old.nombre, old.promedio, NOW());
                -- update Alumno set Fecha_act_prom = CURRENT_TIMESTAMP() where id_alumno NEW.id_alumno;
			END IF;
		END
$$ DELIMITER ;


update Alumno set promedio = 7.5 where id_alumno = 1;
update Alumno set promedio = 8.5 where id_alumno = 2;
update Alumno set promedio = 9.5 where id_alumno = 3;
update Alumno set promedio = 10 where id_alumno = 4;

update Alumno set promedio = 10.0 where id_alumno = 1;
update Alumno set promedio = 5.0 where id_alumno = 2;
update Alumno set promedio = 6.0 where id_alumno = 3;
update Alumno set promedio = 7.5 where id_alumno = 4;
update Alumno set promedio = 8.5 where id_alumno = 1;

SELECT 'Actual' as Origen, id_alumno as id, nombre, promedio, Fecha_act_prom from alumno
UNION ALL SELECT 'Historico' as Origen, id_alumno as id, nombre, promedio, Hist_Date from alumnopromediohist 
ORDER BY nombre, Origen;

select * from Alumno;
select * from AlumnoPromedioHist;

-- drop table Alumno;
TRUNCATE TABLE AlumnoPromedioHist;