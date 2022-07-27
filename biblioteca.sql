--Parte 2

--Requerimiento 1--

CREATE DATABASE biblioteca;

CREATE TABLE ciudad(
    codigo_ciudad VARCHAR(55) NOT NULL,
    nombre_ciudad VARCHAR(55) NOT NULL,
    PRIMARY KEY (codigo_ciudad)
    );

CREATE TABLE comuna (
    codigo_comuna VARCHAR(55) NOT NULL,
    codigo_ciudad VARCHAR(55) NOT NULL,
    nombre_comuna VARCHAR(55) NOT NULL,
    PRIMARY KEY (codigo_comuna),
    FOREIGN KEY (codigo_ciudad) REFERENCES ciudad(codigo_ciudad)
);

CREATE TABLE socios (
    rut VARCHAR(10) NOT NULL,
    nombre VARCHAR(55) NOT NULL,
    apellido VARCHAR(55) NOT NULL,
    direccion VARCHAR(55) NOT NULL,
    telefono INT NOT NULL,
    codigo_comuna VARCHAR(55) NOT NULL,
    PRIMARY KEY (rut),
    FOREIGN KEY (codigo_comuna) REFERENCES comuna(codigo_comuna)
);

CREATE TABLE historial (
    rut_socio VARCHAR(10) NOT NULL,
    socio VARCHAR(55) NOT NULL,
    libro VARCHAR(55) NOT NULL,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (rut_socio) REFERENCES socios(rut)
);

CREATE TABLE libros (
    isbn VARCHAR(55) NOT NULL,
    titulos VARCHAR(55) NOT NULL,
    paginas SMALLINT NOT NULL,
    dias_prestamo SMALLINT NOT NULL,
    PRIMARY KEY (isbn)
);

--Tabla intermedia entre socios y libros

CREATE TABLE prestamo (
    rut_socio VARCHAR(10) NOT NULL REFERENCES socios(rut),
    libro_isbn VARCHAR(55) NOT NULL REFERENCES libros(isbn),
    PRIMARY KEY (rut_socio, libro_isbn)
);

CREATE TABLE autores (
    libro_isbn VARCHAR(55) NOT NULL,
    codigo_autor INT NOT NULL,
    nombre_autor VARCHAR(55) NOT NULL,
    apellido_autor VARCHAR(55) NOT NULL,
    nacimiento DATE NOT NULL,
    muerte DATE,
    tipo_autor VARCHAR(55) NOT NULL,
    FOREIGN KEY (libro_isbn) REFERENCES libros(isbn)
);

--Requerimiento 2 Ingreso datos tabla ciudad

INSERT INTO ciudad (codigo_ciudad, nombre_ciudad) VALUES (1, 'SANTIAGO');

--Ingreso datos tabla 'comuna'

INSERT INTO comuna (codigo_comuna, codigo_ciudad, nombre_comuna) VALUES (1, 1, 'LA REINA');
INSERT INTO comuna (codigo_comuna, codigo_ciudad, nombre_comuna) VALUES (2, 1, 'PROVIDENCIA');
INSERT INTO comuna (codigo_comuna, codigo_ciudad, nombre_comuna) VALUES (3, 1, 'MAIPU');
INSERT INTO comuna (codigo_comuna, codigo_ciudad, nombre_comuna) VALUES (4, 1, 'LAS CONDES');
INSERT INTO comuna (codigo_comuna, codigo_ciudad, nombre_comuna) VALUES (5, 1, 'CERRILLO');

--Ingreso datos table 'socios'

INSERT INTO socios (rut, nombre, apellido, direccion, telefono, codigo_comuna) VALUES ('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1', 911111111, 1);
INSERT INTO socios (rut, nombre, apellido, direccion, telefono, codigo_comuna) VALUES ('2222222-2', 'ANA', 'PEREZ', 'PASAJE 2', 922222222, 2);
INSERT INTO socios (rut, nombre, apellido, direccion, telefono, codigo_comuna) VALUES ('3333333-3', 'SANDRA' 'AGUILAR', 'AVENIDA 2', 933333333, 3);
INSERT INTO socios (rut, nombre, apellido, direccion, telefono, codigo_comuna) VALUES ('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3', 944444444, 4);
INSERT INTO socios (rut, nombre, apellido, direccion, telefono, codigo_comuna) VALUES ('5555555-5', 'SILVANA', 'MUNOZ', 'PASAJE 3', 955555555, 5);

--Ingreso datos tabla 'historial'

INSERT INTO historial (rut_socio, socio, libro, fecha_prestamo, fecha_devolucion) VALUES ('1111111-1', 'JUAN SOTO', 'CUENTOS DE TERROR', '20-01-2020', '27-01-2020');
INSERT INTO historial (rut_socio, socio, libro, fecha_prestamo, fecha_devolucion) VALUES ('5555555-5', 'SILVANA MUNOZ', 'POESIAS CONTEMPORANEAS', '20-01-2020', '30-01-2020');
INSERT INTO historial (rut_socio, socio, libro, fecha_prestamo, fecha_devolucion) VALUES ('1111111-1', 'SANDRA AGUILAR', 'HISTORIA DE ASIA', '22-01-2020', '30-01-2020');
INSERT INTO historial (rut_socio, socio, libro, fecha_prestamo, fecha_devolucion) VALUES ('1111111-1', 'ESTEBAN JEREZ', 'MANUAL DE MECANICA', '23-01-2020', '30-01-2020');
INSERT INTO historial (rut_socio, socio, libro, fecha_prestamo, fecha_devolucion) VALUES ('2222222-2', 'ANA PEREZ', 'CUENTOS DE TERROR', '27-01-2020', '04-02-2020');
INSERT INTO historial (rut_socio, socio, libro, fecha_prestamo, fecha_devolucion) VALUES ('1111111-1', 'JUAN SOTO', 'MANUAL DE MECANICA', '31-01-2020', '12-02-2020');
INSERT INTO historial (rut_socio, socio, libro, fecha_prestamo, fecha_devolucion) VALUES ('3333333-3', 'SANGRA AGUILAR', 'POESIAS CONTEMPORANEAS', '31-01-2020', '12-01-2020');

--Ingreso datos tabla 'libros'

INSERT INTO libros (isbn, titulos, paginas, dias_prestamo) VALUES ('111-1111111-111', 'CUENTOS DE TERROR', 344, 7);
INSERT INTO libros (isbn, titulos, paginas, dias_prestamo) VALUES ('222-2222222-222', 'POESIAS CONTEMPORANEAS', 167, 7);
INSERT INTO libros (isbn, titulos, paginas, dias_prestamo) VALUES ('333-3333333-333', 'HISTORIA DE ASIA', 511, 14);
INSERT INTO libros (isbn, titulos, paginas, dias_prestamo) VALUES ('444-4444444-444', 'MANUAL DE MECANICA', 298, 14);

--Ingreso datos tabla intermedia 'prestamo'

INSERT INTO prestamo (rut_socio, libro_isbn) VALUES ('1111111-1', '111-1111111-111');
INSERT INTO prestamo (rut_socio, libro_isbn) VALUES ('5555555-5', '222-2222222-222');
INSERT INTO prestamo (rut_socio, libro_isbn) VALUES ('3333333-3', '333-3333333-333');
INSERT INTO prestamo (rut_socio, libro_isbn) VALUES ('4444444-4', '444-4444444-444');
INSERT INTO prestamo (rut_socio, libro_isbn) VALUES ('2222222-2', '111-1111111-111');
INSERT INTO prestamo (rut_socio, libro_isbn) VALUES ('1111111-1', '444-4444444-444');
INSERT INTO prestamo (rut_socio, libro_isbn) VALUES ('3333333-3', '222-2222222-222');


--Ingreso datos tabla autores 

INSERT INTO autores (libro_isbn, codigo_autor, apellido_autor, nacimiento, muerte, tipo_autor) VALUES ('111-1111111-111', 3, 'JOSE', 'SALGADO', '01-01-1968', '01-01-2020', 'PRINCIPAL');
INSERT INTO autores (libro_isbn, codigo_autor, apellido_autor, nacimiento, muerte, tipo_autor) VALUES ('111-1111111-111', 4, 'ANA', 'SALGADO', '01-01-1972', NULL, 'COAUTOR');
INSERT INTO autores (libro_isbn, codigo_autor, apellido_autor, nacimiento, muerte, tipo_autor) VALUES ('222-2222222-222', 1, 'ANDRES', 'ULLOA', '01-01-1982', NULL, 'PRINCIPAL');
INSERT INTO autores (libro_isbn, codigo_autor, apellido_autor, nacimiento, muerte, tipo_autor) VALUES ('333-3333333-333', 2, 'SERGIO', 'MARDONES', '01-01-1950', '01-01-2012', 'PRINCIPAL');
INSERT INTO autores (libro_isbn, codigo_autor, apellido_autor, nacimiento, muerte, tipo_autor) VALUES ('111-1111111-111', 5, 'MARTIN', 'PORTA', '01-01-1976', NULL, 'PRINCIPAL');



--Requerimiento 3

--A

SELECT isbn, titulos, paginas FROM libros WHERE paginas < 300;

--B

SELECT codigo_autor, nombre_autor, apellido_autor, nacimiento FROM autores WHERE nacimiento > '01/01/1970';

--C

SELECT isbn, titulos FROM libros WHERE dias_prestamo = (SELECT MAX(dias_prestamo) FROM libros);

--D

SELECT rut_socio, socio, (fecha_devolucion - 7 - fecha_prestamo)*100 AS multa_despues_los_7_dias FROM historial;