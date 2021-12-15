create database partidos01;
use partidos01;

create table grupos 
(
	num_gpo int,
    nom_grupo varchar (30),
    primary key (num_gpo)
);

-- Información de Grupos
insert into grupos (num_gpo,nom_grupo) values (1,'GRUPO A');
insert into grupos (num_gpo,nom_grupo) values (2,'GRUPO B');

create table equipos
(
	num_eqpo int,
    ciudad varchar (30),
    num_gpo int,
    nom_equipo varchar (30),
    primary key (num_eqpo),
    foreign key (num_gpo) references grupos (num_gpo)
);

-- Información de Equipos
insert into equipos (num_eqpo,ciudad,num_gpo,nom_equipo) values (1,'DISTRITO FEDERAL',1,'AMERICA');
insert into equipos (num_eqpo,ciudad,num_gpo,nom_equipo) values (2,'TORREON',1,'SANTOS');
insert into equipos (num_eqpo,ciudad,num_gpo,nom_equipo) values (3,'GUANAJUATO',1,'LEON');
insert into equipos (num_eqpo,ciudad,num_gpo,nom_equipo) values (4,'TOLUCA',1,'TOLUCA');
insert into equipos (num_eqpo,ciudad,num_gpo,nom_equipo) values (5,'DISTRITO FEDERAL',2,'CRUZ AZUL');
insert into equipos (num_eqpo,ciudad,num_gpo,nom_equipo) values (6,'MORELIA',2,'MORELIA');
insert into equipos (num_eqpo,ciudad,num_gpo,nom_equipo) values (7,'GUADALAJARA',2,'CHIVAS');
insert into equipos (num_eqpo,ciudad,num_gpo,nom_equipo) values (8,'TUXTLA',2,'CHIAPAS FC');

create table jugadores
(
	num_jug int,
    nom_jug varchar (30),
    posicion varchar (30),
    goles_anotados int default 0,
    num_eqpo int,
    primary key (num_jug,num_eqpo),
    foreign key (num_eqpo) references equipos (num_eqpo)
);

-- Agregar los jugadores
-- Chiapas

insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (21,'Oscar Jiménez','POR',15,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (1,'Alfredo Frausto','POR',6,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (12,'Antonio Pérez','POR',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (2,'Javier David Muñoz','DEF',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (3,'William Paredes','DEF',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (16,'David Mendieta','DEF',1,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (4,'Uriel Álvarez','DEF',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (20,'Félix Araujo','DEF',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (26,'Roberto Carlos Juárez','DEF',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (25,'Miguel Ángel Martínez','DEF',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (5,'Alvaro Ortiz','DEF',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (13,'Ricardo Balderas Orozco','DEF',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (27,'Manuel Jiménez','DEF',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (17,'David Toledo','MED',1,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (24,'Luis Alfonso Rodríguez','MED',1,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (6,'Luis Robles Ramírez','MED',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (15,'César de la Peña','MED',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (11,'César Villaluz','MED',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (7,'Moisés Adrián Velasco','MED',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (30,'Hugo Bueno','MED',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (1000,'Segundo Castillo','MED',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (31,'Edson Iván Silva','MED',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (10,'Carlos Ochoa','DEL',7,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (9,'Lucas Viatri','DEL',4,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (8,'Sergio Santana','DEL',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (14,'Mauricio Romero','DEL',3,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (23,'Martín Zúñiga','DEL',1,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (18,'Avilés Hurtado','DEL',4,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (22,'Orlando Javier Rincón','DEL',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (28,'Francisco Torres','DEL',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (1001,'Ivan Gonzalo Bella','DEL',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (29,'David Salazar Zepeda','DEL',0,8);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (19,'Mario Ortiz','DEL',0,8);

-- Morelia
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (3,'Federico Vilar','POR',21,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (12,'Higinio Bucio','POR',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (1,'Carlos Felipe Rodríguez','POR',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (2,'Enrique Pérez','DEF',1,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (6,'Joel Huiqui','DEF',1,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (19,'José Antonio Olvera','DEF',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (4,'Luis Fernando Silva','DEF',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (24,'Rodrigo Godínez','DEF',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (15,'Juan Carlos Arellano','DEF',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (23,'Daniel Silva','DEF',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (25,'Jesús Castillo Ugarte','DEF',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (26,'Christian Valdez','MED',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (29,'Rodrigo Salinas','MED',1,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (11,'Edgar Andrade','MED',3,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (7,'José María Cárdenas','MED',2,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (22,'Armando Zamorano','MED',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (28,'Carlos Morales','MED',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (17,'José Hibert Alberto Ruíz','MED',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (13,'Jorge Alejandro Zárate','MED',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (8,'Aldo Leao Ramírez','DEL',3,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (9,'Héctor Raúl Mancilla','DEL',8,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (10,'Jefferson Montero','DEL',5,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (20,'Santiago Trellez','DEL',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (21,'Juan José Govea','DEL',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (14,'Ever Guzmán','DEL',0,6);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (16,'Eder Guerrero','DEL',0,6);

-- Toluca
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (1,'Alfredo Talavera','POR',8,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (22,'César Lozano','POR',5,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (66,'Sergio Arturo Pérez','POR',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (12,'Miguel Ángel Centeno','POR',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (3,'Fausto Pinto','DEF',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (4,'Paulo Da Silva','DEF',2,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (6,'Carlos Gerardo Rodríguez','DEF',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (2,'Francisco Gamboa','DEF',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (16,'Óscar Ricardo Rojas','DEF',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (14,'Edgar Dueñas','DEF',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (8,'Aarón Galindo','DEF',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (20,'Miguel Almazán','DEF',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (13,'Héctor Acosta','DEF',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (5,'Wilson Tiago Mathias','MED',2,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (10,'Antonio Naelson','MED',1,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (24,'Richard Ortiz','MED',2,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (15,'Antonio Ríos','MED',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (18,'Xavier Iván Baez','MED',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (26,'Erbin Alejandro Trejo','MED',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (21,'Gabriel Velasco','MED',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (11,'Carlos Esquivel','DEL',2,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (27,'Isaác Brizuela','DEL',3,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (7,'Pablo Velázquez','DEL',9,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (19,'Edy Germán Brambila','DEL',2,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (29,'Raúl Nava','DEL',4,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (23,'Edgar Benítez','DEL',0,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (9,'Juan Carlos Cacho','DEL',1,4);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (25,'Daniel Gonzalez Vega','DEL',0,4);

-- Santos
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (1,'Oswaldo Sánchez','POR',15,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (32,'Julio José González','POR',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (2,'Oswaldo Alanís Pantoja','DEF',1,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (5,'César Alberto Ibáñez','DEF',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (66,'José Javier Abella','DEF',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (14,'Néstor Alejandro Araujo','DEF',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (23,'Felipe Baloy','DEF',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (19,'Rafael Alejandro Figueroa','DEF',1,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (20,'Osmar Mares','DEF',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (1000,'Alejandro Martínez','DEF',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (8,'Juan Pablo Rodríguez','MED',1,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (17,'Rodolfo Salinas','MED',1,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (70,'Jesús Alonso Escoboza','MED',2,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (11,'Néstor Calderón','MED',1,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (10,'Mauro Cejas','MED',2,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (6,'Marc Crosas','MED',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (54,'Héctor Joya','MED',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (3,'Carlos Darwin Quintero','DEL',1,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (24,'Oribe Peralta','DEL',10,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (15,'Eduardo Herrera','DEL',1,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (27,'Javier Orozco','DEL',2,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (9,'Andres Yair Renteria','DEL',1,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (64,'Mario Alberto Cárdenas','DEL',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (49,'Carlos Parra','DEL',0,2);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (57,'Kenyi Fernando Adachi','DEL',0,2);

-- America
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (23,'Moisés Muñoz','POR',8,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (1,'Hugo Alfonso González','POR',1,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (24,'Luis Pineda','POR',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (12,'Carlos Aurelio López','POR',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (22,'Paul Nicolás Aguilar','DEF',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (2,'Francisco Javier Rodríguez','DEF',1,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (19,'Miguel Layún','DEF',3,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (3,'Aquivaldo Mosquera','DEF',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (6,'Juan Carlos Valenzuela','DEF',1,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (16,'Adrián Aldrete','DEF',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (4,'Erik,Alan,Pimentel','DEF',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (25,'Carlos Alberto Gutiérrez','DEF',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (90,'Jonathan Alejandro Sánchez Hdz','DEF',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (26,'Juan Carlos Medina','MED',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (14,'Rubens Sambueza','MED',3,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (10,'Osvaldo David Martínez','MED',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (5,'Jesús Antonio Molina','MED',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (8,'Andrés Andrade','MED',1,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (18,'Christian Bermúdez','MED',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (30,'Omar Nicolás Govea','MED',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (27,'Jesús Antonio Leal','MED',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (20,'Gil Cordero','MED',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (28,'Alejandro Esteban Muñóz','MED',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (15,'Luis Ángel Mendoza','DEL',3,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (9,'Raúl Alonso Jiménez','DEL',7,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (11,'Luis Gabriel Rey','DEL',4,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (7,'Narciso Mina','DEL',3,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (17,'Antonio López','DEL',0,1);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (29,'Roger Llergo','DEL',0,1);

-- CHIVAS
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (3,'Kristian Omar Álvarez','DEF',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (16,'Miguel Ángel Ponce','DEF',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (15,'Víctor Peráles','DEF',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (27,'Hedgardo Marin','DEF',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (34,'Raúl López','DEF',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (18,'Edgar Iván Solís','DEF',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (5,'Patricio Araujo','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (10,'Marco Fabian de la Mora','MED',3,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (28,'Giovani Hernández','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (6,'Omar Esparza','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (14,'Jorge Enríquez','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (25,'Antonio Gallardo','MED',1,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (13,'Abraham Coronado','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (29,'Michael Pérez','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (24,'Carlos Ernesto Cisneros','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (30,'Javier Eduardo López','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (33,'Ángel Zaldívar Caviedes','MED',1,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (31,'Miguel Basulto','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (35,'Bryan Leyva','MED',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (17,'Jesús Enrique Sánchez','DEL',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (21,'Carlos Eduardo Fierro','DEL',1,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (7,'Rafael Márquez','DEL',5,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (11,'Aldo de Nigris','DEL',1,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (9,'Miguel Sabah','DEL',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (32,'Octavio Villanueva','DEL',0,7);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (20,'Giovanny Casillas','DEL',0,7);

-- Cruz Azul
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (1,'José de Jesús Corona','POR',14,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (12,'Guillermo Allison','POR',1,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (4,'Julio César Domínguez','DEF',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (14,'Luis Amaranto Perea','DEF',1,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (5,'Alejandro Castro','DEF',1,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (16,'Jair Pereira','DEF',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (28,'Rogelio Chávez','DEF',1,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (15,'Gerardo Flores','DEF',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (76,'Manuel Madrid','DEF',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (8,'Israel Castro','MED',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (10,'Christian Giménez','MED',2,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (6,'Gerardo Torrado','MED',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (13,'Allam Bello','MED',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (80,'Rodrigo Fernández','MED',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (78,'Jesús Henestrosa Vega','MED',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (9,'Hugo Mariano Pavone','DEL',5,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (18,'Sergio Javier Nápoles','DEL',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (11,'Joao Rojas','DEL',5,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (19,'Jerónimo Amione','DEL',1,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (7,'Pablo Barrera','DEL',1,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (33,'Mauro Formica','DEL',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (20,'Achille Emana','DEL',0,5);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (32,'Jesús Alberto Lara','DEL',0,5);

-- LEON
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (25,'William Paul Yarbrough','POR',11,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (16,'Christian Martínez','POR',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (28,'César Alejandro Ríos','POR',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (19,'Jonny Magallón','DEF',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (4,'Rafael Márquez','DEF',1,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (7,'Edwin William Hernández','DEF',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (35,'Juan Ignacio González','DEF',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (5,'Fernando Navarro','DEF',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (32,'Onay Pineda','DEF',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (3,'Arturo Ortiz','DEF',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (2,'Juan Carlos Pineda','DEF',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (30,'Irvin Enríquez','DEF',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (21,'Luis Antonio Delgado','DEF',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (23,'Juan José Vázquez','MED',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (8,'Elias Hernández','MED',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (27,'Carlos Alberto Peña','MED',1,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (20,'Eisner Iván Loboa','MED',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (18,'Hernán Darío Burbano','MED',2,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (10,'Luis Montes','MED',2,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (29,'Aldo Rocha','MED',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (24,'José Pozos','MED',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (9,'Matias Britos','DEL',1,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (17,'Mauro Boselli','DEL',6,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (11,'Franco Faustino Arizala','DEL',2,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (13,'Mauricio Castañeda','DEL',1,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (31,'Jorge Calderón','DEL',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (34,'Manuel Flores','DEL',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (33,'Oscar Eduardo Suárez','DEL',0,3);
insert into jugadores (num_jug,nom_jug,posicion,goles_anotados,num_eqpo) values (83,'José Jair Ruíz Vargas','DEL',0,3);


create table partidos
(
	semana int,
    num_eqpo_loc int,
    num_eqpo_vis int,
    goles_loc int,
    goles_vis int,
    primary key (semana,num_eqpo_loc,num_eqpo_vis),
    foreign key (num_eqpo_loc) references equipos (num_eqpo),
	foreign key (num_eqpo_vis) references equipos (num_eqpo)
);


-- Partidos Jugados
-- Semana 1
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (1,1,5,2,0);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (1,2,6,1,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (1,3,7,3,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (1,4,8,2,2);

-- Semana 2
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (2,8,1,2,4);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (2,7,2,0,0);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (2,6,3,1,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (2,5,4,2,2);

-- Semana 3
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (3,1,6,3,1);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (3,2,5,1,4);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (3,3,8,0,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (3,4,7,2,2);

-- Semana 4
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (4,7,1,4,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (4,8,2,1,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (4,5,3,3,2);
insert into partidos (semana,num_eqpo_loc,num_eqpo_vis,goles_loc, Goles_vis) values (4,6,4,2,2);

