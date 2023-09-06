
--crea una base de datos con el nombre dbMarket2023 con los siguientes archivos
CREATE DATABASE dbMarket2023
use dbMarket2023;

ON PRIMARY
(
    NAME = Market2023,
    FILENAME = 'C:/VENTAS/Market2023.mdf',
    SIZE = 15MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
)
LOG ON
(
    NAME = Market2023_Data,
    FILENAME = 'C:/VENTAS/Market2023.ndf',
    SIZE = 30MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 25%
)
LOG ON
(
    NAME = Market2023_Log,
    FILENAME = 'C:/VENTAS/Market2023.ldf',
    SIZE = 60MB,
    MAXSIZE = 150MB,
    FILEGROWTH = 20%
);

--Crea los siguientes Esquemas
CREATE SCHEMA EsquemaPersona;
CREATE SCHEMA EsquemaProducto;
CREATE SCHEMA EsquemaVentas;

--Procedemos a crear la tabla persona con los respectivos ejercicios
/*
CREATE TABLE Persona (
    IDPER INT PRIMARY KEY,
    DNIPER CHAR(8),
    NOMPER VARCHAR(50),
    APEPER VARCHAR(50),
    EMAPER VARCHAR(50),
    CELPER CHAR(9),
    TIPPER CHAR(1),
    ESTPER CHAR(1),
    FECNACPER DATE
);

INSERT INTO Persona (IDPER, DNIPER, NOMPER, APEPER, EMAPER, CELPER, TIPPER, ESTPER, FECNACPER) VALUES
(200, '77889955', 'Alberto', 'Solano Pariano', 'alberto.parriona@empresa.com', '998456321', 'V', 'A', '1970-02-10'),
(201, '45781233', 'Alicia', 'Garcia Campos', 'alicia.garcia@gmail.com', '929185236', 'C', 'A', '1980-03-20'),
(202, '15487922', 'Juana', 'Avila Chumpitaz', 'juana.avila@gmail.com', '923568741', 'C', 'A', '1986-06-06'),
(203, '22116633', 'Ana', 'Enriquez Flores', 'ana.enriquez@empresa.com', '978884551', 'V', 'A', '1970-02-10'),
(204, '88741589', 'Claudia', 'Perales Ortiz', 'claudia.perales@yahoo.com', '997845263', 'C', 'A', '1981-07-25'),
(205, '45122587', 'Mario', 'Barrios Martinez', 'marrio.barrios@outloo.com', '986525874', 'C', 'A', '1987-10-10'),
(206, '15258564', 'Brunela', 'Tarazona Guerra', 'brunela.tarazona@gmail.com', '986525877', 'C', 'A', '1990-06-06');
*/
--El identificador de la tabla es auto_increment de acuerdo a la grafica
--El estado de la Persona Por Default es A de activo.
--El campo FECNACPER es Fecha de Nacimiento de Tipo Date.
--El tipo de Persona se refiere V a Vendedor y C a cliente.


-- La nueva TABLA PERSONA con lo que se esta Pidiendo seria ASI
CREATE TABLE Persona (
    IDPER INT IDENTITY(1,1) PRIMARY KEY,
    DNIPER CHAR(8),
    NOMPER VARCHAR(50),
    APEPER VARCHAR(50),
    EMAPER VARCHAR(50),
    CELPER CHAR(9),
    TIPPER CHAR(1),
    ESTPER CHAR(1) DEFAULT 'A',
    FECNACPER DATE
);

INSERT INTO Persona (DNIPER, NOMPER, APEPER, EMAPER, CELPER, TIPPER, FECNACPER) VALUES
('77889955', 'Alberto', 'Solano Pariano', 'alberto.parriona@empresa.com', '998456321', 'V', '1970-02-10'),
('45781233', 'Alicia', 'Garcia Campos', 'alicia.garcia@gmail.com', '929185236', 'C', '1980-03-20'),
('15487922', 'Juana', 'Avila Chumpitaz', 'juana.avila@gmail.com', '923568741', 'C', '1986-06-06'),
('22116633', 'Ana', 'Enriquez Flores', 'ana.enriquez@empresa.com', '978884551', 'V', '1970-02-10'),
('88741589', 'Claudia', 'Perales Ortiz', 'claudia.perales@yahoo.com', '997845263', 'C', '1981-07-25'),
('45122587', 'Mario', 'Barrios Martinez', 'marrio.barrios@outloo.com', '986525874', 'C', '1987-10-10'),
('15258564', 'Brunela', 'Tarazona Guerra', 'brunela.tarazona@gmail.com', '986525877', 'C', '1990-06-06');


--Procedemos a crear la tabla CATEGORIA con los respectivos registros
CREATE TABLE Categoria (
    IDCAT INT PRIMARY KEY,
    NOMCAT VARCHAR(50)
);

INSERT INTO Categoria (IDCAT, NOMCAT) VALUES
(10, 'Abarrotes'),
(20, 'Carnes y Pollo'),
(30, 'Higiene y Limpieza');

--Procedemos a crear la tabla producto con los respectivos registros

CREATE TABLE Producto (
    CODPROD CHAR(3) PRIMARY KEY,
    NOMPRO VARCHAR(50),
    PREPRO DECIMAL(6,2),
    STOCKPRO INT,
    IDCATPRO INT,
    ESTPRO CHAR(1) DEFAULT 'A',
    FOREIGN KEY (IDCATPRO) REFERENCES Categoria(IDCAT)
);

INSERT INTO Producto (CODPROD, NOMPRO, PREPRO, STOCKPRO, IDCATPRO) VALUES
('P01', 'Arroz', 4.65, 50, 10),
('P02', 'Azucar', 3.45, 60, 10),
('P03', 'Pollo Fresco', 8.70, 20, 20),
('P04', 'Lomo Fino', 18.50, 40, 20),
('P05', 'Detergente Opal', 8.75, 60, 30),
('P06', 'Suavizante Ariel', 7.85, 30, 30);
