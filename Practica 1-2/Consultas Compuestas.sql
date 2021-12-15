-- Conectarse a la B.D. hecha en las actividades anteriores.
USE EMPLEADOS_Join;

-- Verificar la información de la tablas

SELECT * FROM EMPLEADO;
SELECT * FROM DEPTO;
SELECT * FROM PUESTO;


select empleado.NUM_EMP as ' ', empleado.NOMB as Empleado, puesto.NOMB as Puesto,  jefes.NOMB as Jefe, puestos.NOMB as Puesto_Jefe
	from (empleado left join empleado jefes on empleado.NUM_JEFE = jefes.NUM_EMP) 
    join puesto on empleado.NUM_PUESTO = puesto.NUM_PUESTO
    left join puesto puestos on jefes.NUM_PUESTO = puestos.NUM_PUESTO;


select empleado.NUM_EMP as ' ', empleado.NOMB as Empleado, puesto.NOMB as Puesto,  jefes.NOMB as Jefe, puestos.NOMB as Puesto_Jefe
	from empleado left join empleado jefes on empleado.NUM_JEFE = jefes.NUM_EMP
    join puesto on empleado.NUM_PUESTO = puesto.NUM_PUESTO
    left join puesto puestos on jefes.NUM_PUESTO = puestos.NUM_PUESTO;

