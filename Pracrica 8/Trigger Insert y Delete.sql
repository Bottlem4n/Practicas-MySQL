CREATE DATABASE IF NOT EXISTS StockArticulos;
USE StockArticulos;
SET @TRIGGER_DISABLED = 0; -- Esta variable nos ayudara para emular desactivar los TRIGGERS, ya que MYSQL no lo tiene nativamente

CREATE TABLE Articulos
(
	ID INT,
    NOMBRE VARCHAR(100),
    STOCK DECIMAL (18,2),
    PRIMARY KEY (ID)
);

CREATE TABLE Movimientos 
(
	TRANSACCION INT,
    FECHA DATE DEFAULT (CURDATE()),
    ARTICULO_ID INT,
    CANTIDAD DECIMAL (18,2),
    TIPO CHAR(1) CHECK (TIPO = 'E' OR TIPO = 'S'),
    PRIMARY KEY (TRANSACCION),
    FOREIGN KEY (ARTICULO_ID) REFERENCES Articulos(ID)
);

INSERT INTO Articulos (ID, NOMBRE, STOCK) values (1,'Monitores',0),(2,'CPU',0),(3,'Mouse',0); 

SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;

DELIMITER $$
	CREATE TRIGGER MovimientosInsert
	AFTER INSERT 
    ON Movimientos FOR EACH ROW
	BEGIN
		IF @TRIGGER_DISABLED = 0 THEN
			IF NEW.TIPO = 'E' 
				THEN
					UPDATE Articulos SET STOCK = STOCK + NEW.CANTIDAD WHERE Articulos.ID = NEW.ARTICULO_ID;
				ELSE
					UPDATE Articulos SET STOCK = STOCK - NEW.CANTIDAD WHERE Articulos.ID = NEW.ARTICULO_ID;
			END IF;
		END IF;
    END

$$ DELIMITER ;

DELIMITER $$
	CREATE TRIGGER MovimientosDelete
	AFTER DELETE 
    ON Movimientos FOR EACH ROW
	BEGIN
		IF @TRIGGER_DISABLED = 0 THEN
			IF OLD.TIPO = 'E' 
				THEN
					UPDATE Articulos SET STOCK = STOCK - OLD.CANTIDAD WHERE Articulos.ID = OLD.ARTICULO_ID;
				ELSE
					UPDATE Articulos SET STOCK = STOCK + OLD.CANTIDAD WHERE Articulos.ID = OLD.ARTICULO_ID;
			END IF;
		END IF;
    END

$$ DELIMITER ;

SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
SELECT * FROM Movimientos;

INSERT INTO Movimientos (TRANSACCION,ARTICULO_ID,FECHA,CANTIDAD,TIPO) VALUES (1,1,curdate(),100,'E'),(2,2,curdate(),50,'E');

SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
SELECT * FROM Movimientos;

INSERT INTO Movimientos (TRANSACCION,ARTICULO_ID,FECHA,CANTIDAD,TIPO) 
		VALUES (3,1,curdate(),100,'E'),
				(4,2,curdate(),5,'E'),
                (5,2,curdate(),5,'S'),
                (6,2,curdate(),5,'S'),
                (7,1,curdate(),200,'S');
                
SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
SELECT * FROM Movimientos;

SELECT ARTICULO_ID, SUM(CASE WHEN TIPO = 'E' THEN CANTIDAD ELSE - CANTIDAD END) AS PARCIAL
	FROM Movimientos
    GROUP BY ARTICULO_ID;
    
INSERT INTO Movimientos (TRANSACCION,ARTICULO_ID,FECHA,CANTIDAD,TIPO) 
		VALUES (8,1,curdate(),10,'E'),
				(9,3,curdate(),5,'S'),
                (10,2,curdate(),5,'S');
                
SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
SELECT * FROM Movimientos;

DELETE FROM Movimientos WHERE TRANSACCION = 1;

SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
SELECT * FROM Movimientos;

DELETE FROM Movimientos WHERE TRANSACCION = 4;

SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
SELECT * FROM Movimientos;

DELETE FROM Movimientos;

SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
SELECT * FROM Movimientos;

SET @TRIGGER_DISABLED = 1; -- Desactivamos los Triggers
SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
INSERT INTO Movimientos (TRANSACCION,ARTICULO_ID,FECHA,CANTIDAD,TIPO) VALUES (11,1,curdate(),100,'E');

SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
SELECT * FROM Movimientos;
        
SET @TRIGGER_DISABLED = 0; -- Activamos los Triggers
INSERT INTO Movimientos (TRANSACCION,ARTICULO_ID,FECHA,CANTIDAD,TIPO) VALUES (12,1,curdate(),100,'E');

SELECT Ar.ID, Ar.NOMBRE, Ar.STOCK FROM Articulos Ar;
SELECT * FROM Movimientos;


SELECT * FROM Articulos;
UPDATE Articulos SET STOCK = 0;
SELECT * FROM Movimientos;
DELETE FROM Movimientos where ARTICULO_ID > 0;