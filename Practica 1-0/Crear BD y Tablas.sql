create database Ventas_Pr1;

use Ventas_Pr1;

create table cat_clie
(
id_clie int not null,
nom_clie varchar (25),
tel varchar (15),
dir varchar (30),
primary key (id_clie)
);

create table factura
( id_fact int not null,
  id_clie int not null,
  total_fact decimal(65,2),
  fecha_fact date,
  tipo varchar (5),
  primary key (id_fact),
  foreign key (id_clie) references cat_clie (id_clie)
  );
  
create table articulo
(  id_art int not null,
   nom_art varchar (25),
   prec_art decimal(65,2),
   primary key (id_art)
   );

create table det_fact
(
  id_fact int not null,
  id_art int not null,
  cant_art float,
  primary key (id_fact, id_art),
  foreign key (id_art) references articulo (id_art),
  foreign key (id_fact) references factura (id_fact)
  );

select * from cat_clie