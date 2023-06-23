/*

Cantidad de reclamos mensuales recibidos por cada local en función del día de la semana y rango horario.

Tiempo promedio de resolución de reclamos mensual según cada tipo de reclamo y rango etario de los operadores.
El tiempo de resolución debe calcularse en minutos y representa la diferencia entre la fecha/hora en que se realizó el reclamo y la fecha/hora que se resolvió.

Monto mensual generado en cupones a partir de reclamos.



Tiempo (año, mes)
Día (Se corresponde con los días de la semana: L-M-M-J-V-S-D)
Rango horario (De 8 a 00 cada 2 horas) o	08:00 - 10:00
o	10:00 - 12:00
o	….
o	23:00 - 00:00
Provincia/Localidad
Rango etario usuario/repartidor/operario
o	<25
o	25 - 35
o	35 – 55
o	>55
Tipo Medio de pago
Local
Tipo de Local/Categoría de Local
Tipo Movilidad
Tipo Paquete
Estados pedidos
Estado envíos mensajera
Estados reclamos

*/


USE GD1C2023
GO

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_H_Reclamos')
    DROP TABLE GAME_OF_JOINS.BI_H_Reclamos;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Local')
    DROP TABLE GAME_OF_JOINS.BI_D_Local;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Anio')
    DROP TABLE GAME_OF_JOINS.BI_D_Anio;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Mes')
    DROP TABLE GAME_OF_JOINS.BI_D_Mes;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Dias')
    DROP TABLE GAME_OF_JOINS.BI_D_Dias;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_RangoHorario')
    DROP TABLE GAME_OF_JOINS.BI_D_RangoHorario;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_RangoEtario')
    DROP TABLE GAME_OF_JOINS.BI_D_RangoEtario;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Categoria')
    DROP TABLE GAME_OF_JOINS.BI_D_Categoria;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_TipoLocal')
    DROP TABLE GAME_OF_JOINS.BI_D_TipoLocal;

IF OBJECT_ID('GAME_OF_JOINS.GetRangoHorario','AF') IS NOT NULL
	DROP FUNCTION GAME_OF_JOINS.GetRangoHorario;


CREATE TABLE GAME_OF_JOINS.BI_D_Anio (
	anio int IDENTITY(1900,1) PRIMARY KEY CHECK (anio > 0)
);

CREATE TABLE GAME_OF_JOINS.BI_D_Mes (
	mes int IDENTITY(1,1) PRIMARY KEY CHECK (mes > 0 AND mes <= 12)
);

CREATE TABLE GAME_OF_JOINS.BI_D_Dias (
	dia_id int IDENTITY(1,1) PRIMARY KEY,
	dia nvarchar(20) not null 
);

CREATE TABLE GAME_OF_JOINS.BI_D_RangoHorario (
	rango_horario_id int IDENTITY(1,1) PRIMARY KEY,
	rango_horario_desde nvarchar(5) not null,
	rango_horario_hasta nvarchar(5) not null,
);

CREATE TABLE GAME_OF_JOINS.BI_D_RangoEtario (
	rango_etario_id int IDENTITY(1,1) PRIMARY KEY,
	rango_etario_desde int not null,
	rango_etario_hasta int not null,
);

CREATE TABLE GAME_OF_JOINS.BI_D_Categoria (
	categoria_id int IDENTITY(1,1) PRIMARY KEY,
	categoria nvarchar(20)
);

CREATE TABLE GAME_OF_JOINS.BI_D_TipoLocal (
	tipo_local_id int IDENTITY(1,1) PRIMARY KEY,
	tipo_local nvarchar(40)
);

CREATE TABLE GAME_OF_JOINS.BI_D_Local (
	local_id int IDENTITY(1,1) PRIMARY KEY,
	nombre nvarchar(30),
	tipo_local_id int REFERENCES GAME_OF_JOINS.BI_D_TipoLocal(tipo_local_id),
	categoria_id INT REFERENCES GAME_OF_JOINS.BI_D_Categoria(categoria_id)
);

CREATE TABLE GAME_OF_JOINS.BI_H_Reclamos (
	reclamo_anio int not null,
	reclamo_mes int not null, 
	reclamo_dia int not null,
	reclamo_rango_horario int not null,
	reclamo_local int not null,
	reclamo_rango_etario_op int not null,
	reclamo_tiempo_resolucion int not null,
	reclamo_monto_cupon int not null
);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamos
ADD CONSTRAINT PK_BI_H_Reclamos PRIMARY KEY 
(
	reclamo_anio,
	reclamo_mes,
	reclamo_dia,
	reclamo_rango_horario,
	reclamo_local,
	reclamo_rango_etario_op
);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamos ADD CONSTRAINT FK_BI_H_Reclamos_Local
FOREIGN KEY (reclamo_local) REFERENCES GAME_OF_JOINS.BI_D_Local(local_id);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamos ADD CONSTRAINT FK_BI_H_Reclamos_RangoHorario
FOREIGN KEY (reclamo_rango_horario) REFERENCES GAME_OF_JOINS.BI_D_RangoHorario(rango_horario_id);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamos ADD CONSTRAINT FK_BI_H_Reclamos_RangoEtario
FOREIGN KEY (reclamo_rango_etario_op) REFERENCES GAME_OF_JOINS.BI_D_RangoEtario(rango_etario_id);

GO

----------------------------------------------------------TRASPASO DE INFORMACION DE OLTP A OLAP------------------------------------------------------

CREATE FUNCTION GAME_OF_JOINS.GetRangoHorario(@fecha DATETIME)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @rangoHorario NVARCHAR(50)

    -- Obtener la hora de la fecha
    DECLARE @hora INT
    SET @hora = DATEPART(HOUR, @fecha)

    -- Determinar el rango horario
    IF @hora >= 8 AND @hora < 10
        SET @rangoHorario = '08:00 - 09:59'
    ELSE IF @hora >= 10 AND @hora < 12
        SET @rangoHorario = '10:00 - 11:59'
    ELSE IF @hora >= 12 AND @hora < 14
        SET @rangoHorario = '12:00 - 13:59'
    ELSE IF @hora >= 14 AND @hora < 16
        SET @rangoHorario = '14:00 - 15:59'
    ELSE IF @hora >= 16 AND @hora < 18
        SET @rangoHorario = '16:00 - 17:59'
    ELSE IF @hora >= 18 AND @hora < 20
        SET @rangoHorario = '18:00 - 19:59'
    ELSE IF @hora >= 20 AND @hora < 22
        SET @rangoHorario = '20:00 - 21:59'
    ELSE IF @hora >= 22 OR @hora < 2
        SET @rangoHorario = '22:00 - 23:59'
    ELSE
        SET @rangoHorario = '00:00 - 01:59'

    RETURN @rangoHorario
END;
GO

INSERT INTO GAME_OF_JOINS.BI_D_Dias
	select TOP 1 'LUNES' from sys.tables
	UNION
	select TOP 1 'MARTES' from sys.tables
	UNION
	select TOP 1 'MIERCOLES' from sys.tables
	UNION
	select TOP 1 'JUEVES' from sys.tables
	UNION
	select TOP 1 'VIERNES' from sys.tables
	UNION
	select TOP 1 'SABADO' from sys.tables
	UNION
	select TOP 1 'DOMINGO' from sys.tables;
	
INSERT INTO GAME_OF_JOINS.BI_D_Categoria
	select categoria from GAME_OF_JOINS.Categoria
	union
	select TOP 1 'CATEGORIA2' from sys.tables
	union
	select TOP 1 'CATEGORIA3' from sys.tables
	union
	select TOP 1 'CATEGORIA4' from sys.tables


INSERT INTO GAME_OF_JOINS.BI_D_RangoEtario
	SELECT TOP 1 0, 25 from sys.tables
	UNION
	SELECT TOP 1 26, 35 from sys.tables
	UNION
	SELECT TOP 1 36, 55 from sys.tables
	UNION
	SELECT TOP 1 56, 100 from sys.tables


INSERT INTO GAME_OF_JOINS.BI_D_RangoHorario
	select top 1 '08:00', '09:59' from sys.tables
	UNION
	select top 1 '10:00', '11:59' from sys.tables
	UNION
	select top 1 '12:00', '13:59' from sys.tables
	UNION
	select top 1 '14:00', '15:59' from sys.tables
	UNION
	select top 1 '16:00', '17:59' from sys.tables
	UNION
	select top 1 '18:00', '19:59' from sys.tables
	UNION
	select top 1 '20:00', '21:59' from sys.tables
	UNION
	select top 1 '22:00', '23:59' from sys.tables

INSERT INTO GAME_OF_JOINS.BI_D_TipoLocal
	select local_tipo from GAME_OF_JOINS.LocalTipo

INSERT INTO GAME_OF_JOINS.BI_D_Local
	SELECT local_nombre, local_tipo_id, (SELECT TOP 1 categoria_id FROM GAME_OF_JOINS.BI_D_Categoria ORDER BY NEWID()) FROM
	GAME_OF_JOINS.LocalRegistrado

CREATE TABLE GAME_OF_JOINS.BI_H_Reclamo (
	reclamo_anio int not null,
	reclamo_mes int not null, 
	reclamo_dia int not null,
	reclamo_rango_horario int not null,
	reclamo_local int not null,
	reclamo_rango_etario_op int not null,
	reclamo_tiempo_resolucion int not null,
	reclamo_monto_cupon int not null
);

SELECT * FROM GAME_OF_JOINS.Reclamo R 

SELECT YEAR(reclamo_fecha_hora_creacion) AS ANIO, MONTH(reclamo_fecha_hora_creacion) AS MES, DATENAME(WEEKDAY, reclamo_fecha_hora_creacion) AS DIA FROM GAME_OF_JOINS.Reclamo R 

select R.*, C.cupon_monto_descuento from GAME_OF_JOINS.Reclamo R INNER JOIN GAME_OF_JOINS.CuponReclamo CR ON R.reclamo_nro = CR.reclamo_nro INNER JOIN GAME_OF_JOINS.Cupon C ON C.cupon_nro = CR.cupon_nro

SELECT * FROM gd_esquema.Maestra WHERE CUPON_MONTO > 0 AND RECLAMO_NRO IS NOT NULL
