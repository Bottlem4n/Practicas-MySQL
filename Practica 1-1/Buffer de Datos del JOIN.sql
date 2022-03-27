use empleados_join;
-- Obtener el nombre del empleado, el depto donde trabaja y el puesto que tiene

-- Paso 1     hacer el join entre empleado y depto ver bufer de datos el cual

SELECT *
      FROM  EMPLEADO, DEPTO
      WHERE EMPLEADO.NUM_DEPTO=DEPTO.NUM_DEPTO ;

-- Paso 2   al buffer anterior hacerle el join con el puesto ver el nuevo buffer

SELECT *
      FROM  EMPLEADO, DEPTO, PUESTO
      WHERE EMPLEADO.NUM_DEPTO=DEPTO.NUM_DEPTO
      AND   EMPLEADO.NUM_PUESTO=PUESTO.NUM_PUESTO;
      
-- Paso 3  al buffer anterior hacer la proyección con lo que se solicito, ver el nuevo buffer      
      
SELECT EMPLEADO.NOMB, DEPTO.NOMB, PUESTO.NOMB 
       FROM  EMPLEADO, DEPTO, PUESTO
       WHERE EMPLEADO.NUM_DEPTO=DEPTO.NUM_DEPTO
       AND   EMPLEADO.NUM_PUESTO=PUESTO.NUM_PUESTO;
       
-- Paso 4  Ponemos los alias correspondientes
       
SELECT EMPLEADO.NOMB Empleado, DEPTO.NOMB Departamento, PUESTO.NOMB Puesto 
       FROM  EMPLEADO, DEPTO, PUESTO
       WHERE EMPLEADO.NUM_DEPTO=DEPTO.NUM_DEPTO
	AND   EMPLEADO.NUM_PUESTO=PUESTO.NUM_PUESTO;



