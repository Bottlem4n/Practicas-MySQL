ALTER TABLE general ADD COLUMN goles_favor int AFTER puntos;

DELIMITER $$ 
DROP PROCEDURE IF EXISTS `sp_tablageneral`;
CREATE PROCEDURE `sp_tablageneral` ()
BEGIN
		SET SQL_SAFE_UPDATES = 0;
		delete from general;
		insert into general (select equipos.nom_equipo as Equipo
		, sum((equipos.num_eqpo = partidos.num_eqpo_loc or equipos.num_eqpo = partidos.num_eqpo_vis)) as Partidos_Jugados
		, sum((CASE
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) > 0 THEN 1
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) < 0 THEN 1
					ELSE 0
			END 
			)) as Partidos_Ganados
		,sum((CASE
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) = 0 THEN 1
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) = 0 THEN 1
					ELSE 0
			END 
			)) as Partidos_Empatados
		, sum((CASE
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) < 0 THEN 1
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) > 0 THEN 1
					ELSE 0
			END 
			)) as Partidos_Perdidos
		,sum((CASE
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) > 0 THEN 3
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) < 0 THEN 3
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc and (partidos.goles_loc - partidos.goles_vis) = 0 THEN 1
					WHEN equipos.num_eqpo = partidos.num_eqpo_vis and (partidos.goles_loc - partidos.goles_vis) = 0 THEN 1
					ELSE 0
			END 
			)) as Puntos
		,sum((CASE
					WHEN equipos.num_eqpo = partidos.num_eqpo_loc THEN (partidos.goles_loc - partidos.goles_vis)
                    WHEN equipos.num_eqpo = partidos.num_eqpo_vis THEN (partidos.goles_vis - partidos.goles_loc)
            END
            )) as Goles_Favor
		from (equipos left join partidos on equipos.num_eqpo = partidos.num_eqpo_loc or equipos.num_eqpo = partidos.num_eqpo_vis ) group by equipos.nom_equipo order by equipos.nom_equipo
		);

		SET SQL_SAFE_UPDATES = 1;
        select * from general;

END
$$
DELIMITER ;

call sp_tablageneral ();

-- Semana 5 cargar esta semana de partidos para la segunda corrida
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (5,5,1,2,0);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (5,6,2,1,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (5,7,3,3,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (5,8,4,2,2);

call sp_tablageneral ();

SELECT * FROM general;

SELECT * FROM PARTIDOS;