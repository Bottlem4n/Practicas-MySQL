create database complejo;
use complejo;

create table inquilino 
(
	id_inquilino int not null,
    nombre varchar (25),
    rfc varchar (11),
    edad int,
    telefono varchar (10),
    primary key (id_inquilino)
);

select * from inquilino;

create table clasificacion
(
	id_clasificacion int not null,
    descrip_clasificacion varchar (25),
    monto_renta decimal (65,2),
    primary key (id_clasificacion)
);

select * from clasificacion;

create table caracteristica
(
	id_caract varchar (2) not null,
    descrip_caract varchar (25),
    monto_car decimal (65,2),
    primary key (id_caract)
);

select * from caracteristica;

create table depto
(
	id_depto int not null,
    id_inquilino int,
    num_rec int,
    chimenea varchar (2),
    lavaplatos varchar (2),
    cocina_int varchar (2),
    id_clasificacion int not null,
    primary key (id_depto),
    foreign key (id_inquilino) references inquilino (id_inquilino),
    foreign key (id_clasificacion) references clasificacion (id_clasificacion)
);

select * from depto;

create table cajon
(
	id_cajon int,
    ubicacion varchar (8),
    id_depto int not null,
    foreign key (id_depto) references depto (id_depto)
);

select * from cajon;

create table depto_caracteristicas
(
	id_depto int not null,
    id_caract varchar (2),
    foreign key (id_depto) references depto (id_depto),
    foreign key (id_caract) references caracteristica (id_caract)
);

select * from depto_caracteristicas;