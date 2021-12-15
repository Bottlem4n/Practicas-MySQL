-- Insertar Frecuencias
insert into frecuencia values ('Q', 'Quincenal');
insert into frecuencia values ('M', 'Mensual');
insert into frecuencia values ('T', 'Trimestal');

select * from frecuencia;

-- Insertar Revistas
insert into revista values (1,'Mecanica Popular','M');
insert into revista values (2,'TV Novelas','Q');
insert into revista values (3,'Byte','T');

select * from revista;

-- Insertar Ejemplares
insert into ejemplar values (1,1,'2013-11-01',45.00,60);
insert into ejemplar values (2,1,'2013-12-01',50.00,55);
insert into ejemplar values (3,1,'2014-01-01',55.00,65);
insert into ejemplar values (1,2,'2013-11-01',45.00,70);
insert into ejemplar values (2,2,'2013-12-01',50.00,65);
insert into ejemplar values (1,3,'2013-10-01',100.00,100);
insert into ejemplar values (2,3,'2013-11-01',100.00,110);
insert into ejemplar values (3,3,'2013-12-01',100.00,120);
insert into ejemplar values (4,3,'2014-01-01',105.00,110);
insert into ejemplar values (5,3,'2014-02-01',105.00,115);

select * from ejemplar;

-- Insertar Articulos
insert into articulo values (1,'Compra Amortiguadores',10);
insert into articulo values (2,'Novelas Mexicanas',30);
insert into articulo values (3,'Cambio de Llantas',20);
insert into articulo values (4,'Faros de Halogeno',25);
insert into articulo values (5,'Traccion 4x4',25);
insert into articulo values (6,'Afinacion Fuel Inj.',20);
insert into articulo values (7,'Ford Fiesta',10);
insert into articulo values (8,'Teatro Mexicano',30);
insert into articulo values (9,'Valvulas',5);
insert into articulo values (10,'Compra de Anillos',35);
insert into articulo values (11,'Pistones Diesel',20);
insert into articulo values (12,'Camisas para Motor',20);
insert into articulo values (13,'Servidores HP',20);
insert into articulo values (14,'Manejadores de BD',20);
insert into articulo values (15,'Lenguajes 3G',20);
insert into articulo values (16,'Sistemas Operativos',20);
insert into articulo values (17,'Servidores DELL',20);
insert into articulo values (18,'Novelas Colombianas',20);
insert into articulo values (19,'Novelas Venezolanas',20);
insert into articulo values (20,'Comedia Mexiana',35);

select * from articulo;

-- Insertar Ejemplares-Articulos
insert into ejem_art values (1,1,1);
insert into ejem_art values (1,1,6); 
insert into ejem_art values (1,1,3); 
insert into ejem_art values (1,1,7); 
insert into ejem_art values (1,2,4); 
insert into ejem_art values (1,2,5); 
insert into ejem_art values (1,2,9); 
insert into ejem_art values (1,3,10); 
insert into ejem_art values (1,3,11); 
insert into ejem_art values (1,3,12); 
insert into ejem_art values (2,1,2); 
insert into ejem_art values (2,1,18); 
insert into ejem_art values (2,1,19); 
insert into ejem_art values (2,2,8); 
insert into ejem_art values (2,2,20); 
insert into ejem_art values (3,1,13); 
insert into ejem_art values (3,1,14); 
insert into ejem_art values (3,1,15); 
insert into ejem_art values (3,1,16); 
insert into ejem_art values (3,1,17); 

select * from ejem_art;

-- Insertar Autores
insert into autor values ('A1','Juanito Salinas','JUSA123491',NULL);
insert into autor values ('A2','Vianney Rey','VIRE432192',NULL);
insert into autor values ('A3','Quijote',NULL,'A7');
insert into autor values ('A4','Carmen Solorzano','CASO657599',NULL);
insert into autor values ('A5','Marylin Monroe',NULL,'A2');
insert into autor values ('A6','John Date','JODAT123456',NULL);
insert into autor values ('A7','Luis Sanchez','LISA678988',NULL);
insert into autor values ('A8','Sancho',NULL,'A1');
insert into autor values ('A9','El Cuervo',NULL,'A1');

select * from autor;

-- Insertar Articulos-Autores
insert into art_aut values (1,'A1');
insert into art_aut values (2,'A1');
insert into art_aut values (3,'A3');
insert into art_aut values (4,'A8');
insert into art_aut values (5,'A9');
insert into art_aut values (6,'A7');
insert into art_aut values (7,'A1');
insert into art_aut values (8,'A2');
insert into art_aut values (9,'A3');
insert into art_aut values (10,'A8');
insert into art_aut values (11,'A9');
insert into art_aut values (12,'A7');
insert into art_aut values (13,'A5');
insert into art_aut values (14,'A5');
insert into art_aut values (15,'A4');
insert into art_aut values (16,'A4');
insert into art_aut values (17,'A6');
insert into art_aut values (18,'A2');
insert into art_aut values (19,'A2');
insert into art_aut values (20,'A2');

select * from art_aut;