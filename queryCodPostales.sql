CREATE DATABASE codigosPostales
USE codigosPostales

SELECT * FROM asentamientos

CREATE TABLE estados(
idEstado INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
nomEstado NVARCHAR(MAX)
)

CREATE TABLE municipios(
idMun INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
cve INT,
nomMun NVARCHAR(MAX),
idEstado INT FOREIGN KEY (idEstado) REFERENCES estados (idEstado)
);

CREATE TABLE codPostales(
idCP INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
codPostal INT,
nomColonia NVARCHAR(MAX),
idMun INT 
);

SELECT * FROM codPostales

INSERT INTO estados (nomEstado)
SELECT DISTINCT d_estado
FROM asentamientos

INSERT INTO municipios(cve, nomMun, idEstado)
SELECT DISTINCT c_mnpio, D_mnpio, c_estado
FROM asentamientos

INSERT INTO codPostales(codPostal,nomColonia,idMun)
SELECT DISTINCT d_codigo, d_asenta, c_mnpio
FROM asentamientos



