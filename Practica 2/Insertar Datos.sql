-- Insertar datos de Inquilinos
insert into inquilino values (13,'Luis Montiel','LUMO-43',43,5599766);
insert into inquilino values (3,'Juanito Banana','JUBA-32',32,5586768);
insert into inquilino values (25,'Osvaldo','OSVA-36',36,5557447);
insert into inquilino values (14,'Paulo','PAUL-28',28,5593761);
insert into inquilino values (19,'Alex Lora','ALLO-45',45,5595768);
insert into inquilino values (20,'Leticia','LETI-33',33,5574537);
insert into inquilino values (1,'Betty','BETT-29',29,5532146);

-- Insertar datos clasificacion
insert into clasificacion values (1,'Lujo',5200);
insert into clasificacion values (2,'Regular',4200);
insert into clasificacion values (3,'Economico',3200);

-- Insertar datos caracteristica
insert into caracteristica values('VP','Con vista a la Playa',40);
insert into caracteristica values('VC','Con vista Cancha de Tenis',10);
insert into caracteristica values('CC','Con Cable',40);
insert into caracteristica values('CT','Cancha de Tenis',10);
insert into caracteristica values('VA','Con vista a la alberca',30);

-- Insertar datos depto
insert into depto values (1,13,3,'si','si','si',1);
insert into depto values (2,null,3,'si','si','si',1);
insert into depto values (3,3,2,'no','no','si',3);
insert into depto values (4,13,2,'no','si','si',2);
insert into depto values (5,25,2,'no','si','si',2);
insert into depto values (6,1,3,'si','si','si',1);
insert into depto values (7,null,3,'si','si','si',1);
insert into depto values (8,14,2,'no','no','si',3);
insert into depto values (9,19,2,'no','si','si',2);
insert into depto values (10,20,2,'no','si','si',2);
insert into depto values (28,3,2,'no','no','si',3);
insert into depto values (40,19,2,'no','si','si',2);

-- Insertar datos cajon
insert into cajon values (70,'Zona C',40);
insert into cajon values (28,'Zona A',3);
insert into cajon values (29,'Zona A',3);
insert into cajon values (null,null,9);
insert into cajon values (20,'Zona D',10);

-- Insertar datos depto_caracteristicas
insert into depto_caracteristicas values(1,'VP');
insert into depto_caracteristicas values(1,'VC');
insert into depto_caracteristicas values(1,'CC');
insert into depto_caracteristicas values(2,'CT');
insert into depto_caracteristicas values(2,'VA');
insert into depto_caracteristicas values(3,null);
insert into depto_caracteristicas values(4,'CC');
insert into depto_caracteristicas values(4,'CT');
insert into depto_caracteristicas values(5,'VA');
insert into depto_caracteristicas values(5,'CC');