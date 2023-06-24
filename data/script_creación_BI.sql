/*

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

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_RECLAMOS_MENSUALES')
	DROP VIEW GAME_OF_JOINS.BI_V_RECLAMOS_MENSUALES

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_TIEMPO_RESOLUCION_RECLAMOS')
	DROP VIEW GAME_OF_JOINS.BI_V_TIEMPO_RESOLUCION_RECLAMOS
	
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_H_Reclamo')
    DROP TABLE GAME_OF_JOINS.BI_H_Reclamo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Local')
    DROP TABLE GAME_OF_JOINS.BI_D_Local;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Tiempo')
    DROP TABLE GAME_OF_JOINS.BI_D_Tiempo;

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

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Cupon')
    DROP TABLE GAME_OF_JOINS.BI_D_Cupon;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_OperadorReclamo')
    DROP TABLE GAME_OF_JOINS.BI_D_OperadorReclamo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_TipoReclamo')
	DROP TABLE GAME_OF_JOINS.BI_D_TipoReclamo

IF EXISTS (SELECT 1 FROM sys.all_objects WHERE name = 'GetRangoHorario')
    DROP FUNCTION GAME_OF_JOINS.GetRangoHorario;

IF EXISTS (SELECT 1 FROM sys.all_objects WHERE name = 'GetRangoEtario')
	DROP FUNCTION GAME_OF_JOINS.GetRangoEtario

CREATE TABLE GAME_OF_JOINS.BI_D_Tiempo (
	tiempo_id int IDENTITY(1,1) PRIMARY KEY,
	anio int not null CHECK (anio > 0),
	mes int not null CHECK (mes > 0 AND mes <= 12)
);

CREATE TABLE GAME_OF_JOINS.BI_D_Dias (
	dia_id int IDENTITY(1,1) PRIMARY KEY,
	dia nvarchar(20) not null 
);

CREATE TABLE GAME_OF_JOINS.BI_D_RangoHorario (
	rango_horario_id int IDENTITY(1,1) PRIMARY KEY,
	rango_horario nvarchar(15) not null
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

CREATE TABLE GAME_OF_JOINS.BI_D_TipoReclamo (
	tipo_reclamo_id int IDENTITY(1,1) PRIMARY KEY,
	tipo_reclamo nvarchar(40)
);

CREATE TABLE GAME_OF_JOINS.BI_D_Local (
	local_id int IDENTITY(1,1) PRIMARY KEY,
	local_nombre nvarchar(30),
	tipo_local_id int REFERENCES GAME_OF_JOINS.BI_D_TipoLocal(tipo_local_id),
	categoria_id INT REFERENCES GAME_OF_JOINS.BI_D_Categoria(categoria_id)
);

CREATE TABLE GAME_OF_JOINS.BI_D_OperadorReclamo (
	operador_id int PRIMARY KEY,
	operador_dni decimal(18,0),
	operador_nombre nvarchar(40),
	operador_apellido nvarchar(40),
	operador_fecha_nacimiento date
);

CREATE TABLE GAME_OF_JOINS.BI_D_Cupon (
	cupon_id int IDENTITY(1,1) PRIMARY KEY,
	cupon_nro decimal(18,0),
	cupon_monto decimal(18,0)
);

CREATE TABLE GAME_OF_JOINS.BI_H_Reclamo (
	reclamo_nro DECIMAL(18,0) not null,
	reclamo_tiempo_id int not null,
	reclamo_dia_semana_id int not null,
	reclamo_rango_horario_id int not null,
	reclamo_rango_etario_operador int not null,
	reclamo_tipo_reclamo int not null,
	reclamo_local_id int not null,
	reclamo_fecha_creacion datetime not null,
	reclamo_fecha_solucion datetime not null,
);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo
ADD CONSTRAINT PK_BI_H_Reclamo PRIMARY KEY 
(	
	reclamo_nro,
	reclamo_tiempo_id,
	reclamo_dia_semana_id,
	reclamo_rango_horario_id,
	reclamo_rango_etario_operador,
	reclamo_tipo_reclamo,
	reclamo_local_id
);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_Tiempo
FOREIGN KEY (reclamo_tiempo_id) REFERENCES GAME_OF_JOINS.BI_D_Tiempo(tiempo_id);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_DiaSemana
FOREIGN KEY (reclamo_dia_semana_id) REFERENCES GAME_OF_JOINS.BI_D_Dias(dia_id);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_RangoHorario
FOREIGN KEY (reclamo_rango_horario_id) REFERENCES GAME_OF_JOINS.BI_D_RangoHorario(rango_horario_id);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_RangoEtario
FOREIGN KEY (reclamo_rango_etario_operador) REFERENCES GAME_OF_JOINS.BI_D_RangoEtario(rango_etario_id);

/*
ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_OperadorReclamo
FOREIGN KEY (reclamo_operador_id) REFERENCES GAME_OF_JOINS.BI_D_OperadorReclamo(operador_id);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_Cupon
FOREIGN KEY (reclamo_cupon_id) REFERENCES GAME_OF_JOINS.BI_D_Cupon(cupon_id);
*/

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_TipoReclamo
FOREIGN KEY (reclamo_tipo_reclamo) REFERENCES GAME_OF_JOINS.BI_D_TipoReclamo(tipo_reclamo_id);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_Local
FOREIGN KEY (reclamo_local_id) REFERENCES GAME_OF_JOINS.BI_D_Local(local_id);
GO
----------------------------------------------------------TRASPASO DE INFORMACION DE OLTP A OLAP-----------------------------------------------------

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

CREATE FUNCTION GAME_OF_JOINS.GetRangoEtario(@fecha DATE)
RETURNS INT
AS
BEGIN
    DECLARE @RangoEtario INT

    -- Obtener la edad a partir de la fecha
    DECLARE @edad INT
    SET @edad = DATEDIFF(YEAR, @fecha, GETDATE())

    -- Obtener el índice del rango de fechas
    SELECT @RangoEtario = RE.rango_etario_id
    FROM GAME_OF_JOINS.BI_D_RangoEtario RE
    WHERE @edad BETWEEN RE.rango_etario_desde AND RE.rango_etario_hasta

    RETURN @RangoEtario
END;
GO

INSERT INTO GAME_OF_JOINS.BI_D_Tiempo
SELECT DISTINCT DATEPART(YEAR, reclamo_fecha_hora_creacion) AS YEAR, DATEPART(MONTH, reclamo_fecha_hora_creacion) AS MONTH FROM GAME_OF_JOINS.Reclamo R
UNION
SELECT DISTINCT DATEPART(YEAR, P.pedido_fecha_hora) AS YEAR, DATEPART(MONTH, P.pedido_fecha_hora) AS MONTH FROM GAME_OF_JOINS.Pedido P
UNION
SELECT DISTINCT DATEPART(YEAR, S.servicio_mensajeria_fecha_solicitud) AS YEAR, DATEPART(MONTH, S.servicio_mensajeria_fecha_solicitud) AS MONTH FROM GAME_OF_JOINS.ServicioMensajeria S 
ORDER BY YEAR,MONTH 

INSERT INTO GAME_OF_JOINS.BI_D_Dias
	select TOP 1 'Monday' from sys.tables
	UNION
	select TOP 1 'Tuesday' from sys.tables
	UNION
	select TOP 1 'Wednesday' from sys.tables
	UNION
	select TOP 1 'Thursday' from sys.tables
	UNION
	select TOP 1 'Friday' from sys.tables
	UNION
	select TOP 1 'Saturday' from sys.tables
	UNION
	select TOP 1 'Sunday' from sys.tables;
	
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
	SELECT TOP 1 56, 200 from sys.tables

INSERT INTO GAME_OF_JOINS.BI_D_RangoHorario
	select top 1 '08:00 - 09:59' from sys.tables
	UNION
	select top 1 '10:00 - 11:59' from sys.tables
	UNION
	select top 1 '12:00 - 13:59' from sys.tables
	UNION
	select top 1 '14:00 - 15:59' from sys.tables
	UNION
	select top 1 '16:00 - 17:59' from sys.tables
	UNION
	select top 1 '18:00 - 19:59' from sys.tables
	UNION
	select top 1 '20:00 - 21:59' from sys.tables
	UNION
	select top 1 '22:00 - 23:59' from sys.tables

INSERT INTO GAME_OF_JOINS.BI_D_TipoLocal
	select local_tipo from GAME_OF_JOINS.LocalTipo

INSERT INTO GAME_OF_JOINS.BI_D_Local
	SELECT local_nombre, local_tipo_id, (SELECT TOP 1 categoria_id FROM GAME_OF_JOINS.BI_D_Categoria ORDER BY NEWID()) FROM
	GAME_OF_JOINS.LocalRegistrado

INSERT INTO GAME_OF_JOINS.BI_D_TipoReclamo
	SELECT tipo_reclamo FROM GAME_OF_JOINS.TipoReclamo

INSERT INTO GAME_OF_JOINS.BI_D_OperadorReclamo (operador_id, operador_dni, operador_nombre, operador_apellido, operador_fecha_nacimiento)
	SELECT operador_id, operador_dni, operador_nombre, operador_apellido, operador_fecha_nacimiento FROM GAME_OF_JOINS.OperadorReclamo

INSERT INTO GAME_OF_JOINS.BI_H_Reclamo
	SELECT R.reclamo_nro, TI.tiempo_id, DI.dia_id, RH.rango_horario_id, RE.rango_etario_id, TR.tipo_reclamo_id, L.local_id, reclamo_fecha_hora_creacion, reclamo_fecha_hora_solucion
	FROM GAME_OF_JOINS.Reclamo R
	JOIN GAME_OF_JOINS.BI_D_TipoReclamo TR ON TR.tipo_reclamo_id = R.reclamo_tipo
	JOIN GAME_OF_JOINS.BI_D_Tiempo TI ON TI.anio = DATEPART(YEAR, R.reclamo_fecha_hora_creacion) AND TI.mes = DATEPART(MONTH, R.reclamo_fecha_hora_creacion)
	JOIN GAME_OF_JOINS.BI_D_Dias DI ON DI.dia = DATENAME(WEEKDAY, R.reclamo_fecha_hora_creacion)
	JOIN GAME_OF_JOINS.BI_D_RangoHorario RH ON RH.rango_horario = GAME_OF_JOINS.GetRangoHorario(R.reclamo_fecha_hora_creacion)
	JOIN GAME_OF_JOINS.BI_D_OperadorReclamo OP ON OP.operador_id = R.reclamo_operador
	JOIN GAME_OF_JOINS.BI_D_RangoEtario RE ON RE.rango_etario_id = GAME_OF_JOINS.GetRangoEtario(OP.operador_fecha_nacimiento)
	INNER JOIN GAME_OF_JOINS.Pedido P ON R.reclamo_pedido = P.pedido_nro
	JOIN GAME_OF_JOINS.BI_D_Local L ON P.pedido_local_id = L.local_id
GO

-- CREATE VIEWS

CREATE VIEW GAME_OF_JOINS.BI_V_RECLAMOS_MENSUALES AS (
	SELECT 
		(SELECT TOP 1 local_nombre FROM GAME_OF_JOINS.BI_D_Local WHERE local_id = R.reclamo_local_id) as LOCAL,
		(SELECT TOP 1 anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS ANIO,
		(SELECT TOP 1 mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS MES,
		(SELECT dia FROM GAME_OF_JOINS.BI_D_Dias WHERE dia_id = R.reclamo_dia_semana_id) AS DIA_SEMANA, 
		(SELECT rango_horario FROM GAME_OF_JOINS.BI_D_RangoHorario WHERE rango_horario_id = R.reclamo_rango_horario_id) AS RANGO_HORARIO,
		 COUNT(1) AS TOTAL_PEDIDOS 
	FROM GAME_OF_JOINS.BI_H_Reclamo R 
	GROUP BY reclamo_tiempo_id, R.reclamo_local_id, R.reclamo_dia_semana_id, R.reclamo_rango_horario_id
	) 
GO


CREATE VIEW GAME_OF_JOINS.BI_V_TIEMPO_RESOLUCION_RECLAMOS AS (
	SELECT
		(SELECT TOP 1 anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS ANIO,
		(SELECT TOP 1 mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS MES,
		(SELECT TOP 1 tipo_reclamo FROM GAME_OF_JOINS.BI_D_TipoReclamo TR WHERE TR.tipo_reclamo_id = R.reclamo_tipo_reclamo) AS TIPO_RECLAMO,
		(SELECT TOP 1 rango_etario_id from GAME_OF_JOINS.BI_D_RangoEtario RE WHERE RE.rango_etario_id = R.reclamo_rango_etario_operador) AS RANGO_ETARIO,
		COUNT(1) AS TOTAL_PEDIDOS,
		AVG(DATEDIFF(MINUTE, R.reclamo_fecha_creacion, R.reclamo_fecha_solucion)) AS PROMEDIO_RESOLUCION
	FROM GAME_OF_JOINS.BI_H_RECLAMO R
	GROUP BY reclamo_tiempo_id, reclamo_tipo_reclamo, reclamo_rango_etario_operador
)
GO
