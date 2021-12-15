create database revistas;
use revistas;

create table frecuencia
(
	id_frec varchar(1) not null,
    nomb_frec varchar (10) not null,
    primary key (id_frec)
);

select * from frecuencia;

create table revista
(
	id_rev int not null,
    nom_rev varchar(20) not null,
    id_frec varchar(1) not null,
    primary key (id_rev),
    foreign key (id_frec) references frecuencia (id_frec)
);

select * from revista;

create table ejemplar
(
	id_ejem int not null,
    id_rev int not null,
    fecha_ejem date not null,
    precio_ejem decimal (10,2) not null,
    num_pag_ejem int not null,
    primary key (id_ejem, id_rev),
    foreign key (id_rev) references revista (id_rev)
);

select * from ejemplar;

create table articulo
(
	id_art int not null,
    nom_art varchar(50) not null,
    num_pag_art int not null,
    primary key (id_art)
);

select * from articulo;

create table ejem_art
(
	id_rev int not null,
    id_ejem int not null,
    id_art int not null,
    primary key(id_rev, id_art,id_ejem),
    foreign key (id_rev) references revista (id_rev),
    foreign key (id_art) references articulo (id_art),
    foreign key (id_ejem) references ejemplar (id_ejem)
);

select * from ejem_art;

create table autor
(
	id_autor varchar (2) not null,
    nom_aut varchar (20) not null,
    rfc_aut varchar (20),
    pseudo_id varchar (2),
    primary key (id_autor),
    foreign key (pseudo_id) references autor (id_autor)
);

select * from autor;

create table art_aut
(
	id_art int not null,
    id_autor varchar (2) not null,
    primary key (id_art,id_autor),
    foreign key (id_art) references articulo (id_art),
    foreign key (id_autor) references autor (id_autor)
);

select * from art_aut;
