--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------DROP OBJECTS--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

USE GD1C2023
GO


 IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_DESVIOS_EN_SERVICIOS')
	DROP VIEW GAME_OF_JOINS.BI_DESVIOS_EN_SERVICIOS

 IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_MAYOR_CANTIDAD_PEDIDOS')
	DROP VIEW GAME_OF_JOINS.BI_V_MAYOR_CANTIDAD_PEDIDOS

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_PEDIDOS_Y_SERVICIOS_PROMEDIO')
	DROP VIEW GAME_OF_JOINS.BI_V_PEDIDOS_Y_SERVICIOS_PROMEDIO

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_PEDIDOS_Y_SERVICIOS_TOTALES')
	DROP VIEW GAME_OF_JOINS.BI_V_PEDIDOS_Y_SERVICIOS_TOTALES

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_PEDIDOS_Y_SERVICIOS_ENTREGADOS')
	DROP VIEW GAME_OF_JOINS.BI_V_PEDIDOS_Y_SERVICIOS_ENTREGADOS

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_RECLAMOS_MENSUALES')
	DROP VIEW GAME_OF_JOINS.BI_V_RECLAMOS_MENSUALES

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_TIEMPO_RESOLUCION_RECLAMOS')
	DROP VIEW GAME_OF_JOINS.BI_V_TIEMPO_RESOLUCION_RECLAMOS

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_MONTO_MENSUAL_CUPONES')
	DROP VIEW GAME_OF_JOINS.BI_V_MONTO_MENSUAL_CUPONES

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_CUPONES_USUARIO')
	DROP VIEW GAME_OF_JOINS.BI_V_CUPONES_USUARIO		

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_CALIFICACION_LOCAL')
	DROP VIEW GAME_OF_JOINS.BI_V_CALIFICACION_LOCAL		

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_MONTO_PEDIDO_LOCALIDAD')
	DROP VIEW GAME_OF_JOINS.BI_V_MONTO_PEDIDO_LOCALIDAD

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_MONTO_PEDIDOS_CANCELADOS')
	DROP VIEW GAME_OF_JOINS.BI_V_MONTO_PEDIDOS_CANCELADOS

IF EXISTS (SELECT 1 FROM sys.all_views where name = 'BI_V_VALOR_ASEGURADO_XPAQUETE')
	DROP VIEW GAME_OF_JOINS.BI_V_VALOR_ASEGURADO_XPAQUETE
	
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_H_ServicioMensajeria')
    DROP TABLE GAME_OF_JOINS.BI_H_ServicioMensajeria;
	
IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_H_Pedido')
    DROP TABLE GAME_OF_JOINS.BI_H_Pedido;

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

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Usuario')
    DROP TABLE GAME_OF_JOINS.BI_D_Usuario;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_OperadorReclamo')
    DROP TABLE GAME_OF_JOINS.BI_D_OperadorReclamo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_TipoReclamo')
	DROP TABLE GAME_OF_JOINS.BI_D_TipoReclamo

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_EstadoPedido')
    DROP TABLE GAME_OF_JOINS.BI_D_EstadoPedido;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_EstadoEnvio')
    DROP TABLE GAME_OF_JOINS.BI_D_EstadoEnvio;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Usuario')
    DROP TABLE GAME_OF_JOINS.BI_D_Usuario;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Repartidor')
    DROP TABLE GAME_OF_JOINS.BI_D_Repartidor;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Movilidad')
    DROP TABLE GAME_OF_JOINS.BI_D_Movilidad;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_TipoMedioDePago')
    DROP TABLE GAME_OF_JOINS.BI_D_TipoMedioDePago;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Localidad')
    DROP TABLE GAME_OF_JOINS.BI_D_Localidad;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Provincia')
    DROP TABLE GAME_OF_JOINS.BI_D_Provincia;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_Paquete')
    DROP TABLE GAME_OF_JOINS.BI_D_Paquete;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_RangoEtarioUsuarios')
    DROP TABLE GAME_OF_JOINS.BI_D_RangoEtarioUsuarios;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_RangoEtarioRepartidores')
    DROP TABLE GAME_OF_JOINS.BI_D_RangoEtarioRepartidores;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'BI_D_RangoEtarioOperadores')
    DROP TABLE GAME_OF_JOINS.BI_D_RangoEtarioOperadores;

IF EXISTS (SELECT 1 FROM sys.all_objects WHERE name = 'GetRangoHorario')
    DROP FUNCTION GAME_OF_JOINS.GetRangoHorario;

IF EXISTS (SELECT 1 FROM sys.all_objects WHERE name = 'GetRangoEtario')
	DROP FUNCTION GAME_OF_JOINS.GetRangoEtario


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------CREATE OBJECTS--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
	rango_etario varchar(15) not null
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

CREATE TABLE GAME_OF_JOINS.BI_D_Cupon (
	cupon_nro decimal(18,0) PRIMARY KEY,
	cupon_monto decimal(18,2),
	cupon_fecha_alta DATETIME
);

CREATE TABLE GAME_OF_JOINS.BI_D_RangoEtarioUsuarios (
	usuario_rango_etario_id int identity(1,1) PRIMARY KEY,
	usuario_rango_etario VARCHAR(15) NULL
);

CREATE TABLE GAME_OF_JOINS.BI_D_RangoEtarioRepartidores (
	repartidor_rango_etario_id int identity(1,1) PRIMARY KEY,
	repartidor_rango_etario VARCHAR(15) NULL
);

CREATE TABLE GAME_OF_JOINS.BI_D_RangoEtarioOperadores (
	operador_rango_etario_id int identity(1,1) PRIMARY KEY,
	operador_rango_etario VARCHAR(15) NULL
);

CREATE TABLE GAME_OF_JOINS.BI_D_Localidad(
	localidad_id int IDENTITY PRIMARY KEY,
	localidad nvarchar(255) null
);

CREATE TABLE GAME_OF_JOINS.BI_D_Provincia(
	provincia_id int IDENTITY PRIMARY KEY,
	provincia nvarchar(255) null
)

CREATE TABLE GAME_OF_JOINS.BI_D_EstadoPedido (
    estado_pedido_id int IDENTITY(1,1) PRIMARY KEY not null,
	estado nvarchar(50) null
);

CREATE TABLE GAME_OF_JOINS.BI_D_EstadoEnvio (
    estado_envio_id int IDENTITY(1,1) PRIMARY KEY not null,
	estado nvarchar(50) null
);

CREATE TABLE GAME_OF_JOINS.BI_D_Movilidad(
	movilidad_id decimal(18,0) PRIMARY KEY not null,
	movilidad nvarchar(256)
);

CREATE TABLE GAME_OF_JOINS.BI_D_TipoMedioDePago(
	tipo_medio_pago_id int IDENTITY(1,1) PRIMARY KEY,
	tipo_medio_pago nvarchar(50) NULL
);

CREATE TABLE GAME_OF_JOINS.BI_D_Paquete(
	paquete_id int IDENTITY(1,1) PRIMARY KEY,
	paquete_tipo nvarchar(50) NULL,
	paquete_tipo_precio decimal(18,2) NULL
);

CREATE TABLE GAME_OF_JOINS.BI_H_ServicioMensajeria (
	servicio_mensajeria_rango_etario_repartidor int not null REFERENCES GAME_OF_JOINS.BI_D_RangoEtarioRepartidores(repartidor_rango_etario_id),
	servicio_mensajeria_movilidad_repartidor decimal(18,0) not null REFERENCES GAME_OF_JOINS.BI_D_Movilidad(movilidad_id),
	servicio_mensajeria_estado_id int not null REFERENCES GAME_OF_JOINS.BI_D_EstadoEnvio(estado_envio_id),
	servicio_mensajeria_tipo_medio_pago_id int not null REFERENCES GAME_OF_JOINS.BI_D_TipoMedioDePago(tipo_medio_pago_id),
	servicio_mensajeria_tiempo_id int not null REFERENCES GAME_OF_JOINS.BI_D_Tiempo(tiempo_id),
	servicio_mensajeria_localidad_id int not null REFERENCES GAME_OF_JOINS.BI_D_Localidad(localidad_id),
	servicio_mensajeria_dia_semana_id int not null REFERENCES GAME_OF_JOINS.BI_D_Dias(dia_id),
	servicio_mensajeria_rango_horario_id int not null REFERENCES GAME_OF_JOINS.BI_D_RangoHorario(rango_horario_id),
	servicio_mensajeria_paquete int not null REFERENCES GAME_OF_JOINS.BI_D_Paquete(paquete_id),
	servicio_mensajeria_prom_valor_asegurado decimal(18,2) not null,
	servicio_mensajeria_prom_desvio decimal(18,2) not null,
	servicio_mensajeria_total_servicios int not null
);

ALTER TABLE GAME_OF_JOINS.BI_H_ServicioMensajeria
ADD CONSTRAINT PK_BI_H_ServicioMensajeria PRIMARY KEY 
(
    servicio_mensajeria_rango_etario_repartidor,
	servicio_mensajeria_movilidad_repartidor,
    servicio_mensajeria_estado_id,
    servicio_mensajeria_tipo_medio_pago_id,
    servicio_mensajeria_tiempo_id,
    servicio_mensajeria_localidad_id,
    servicio_mensajeria_dia_semana_id,
    servicio_mensajeria_rango_horario_id,
	servicio_mensajeria_paquete
);

CREATE TABLE GAME_OF_JOINS.BI_H_Pedido (
	pedido_usuario_rango_etario int NOT NULL REFERENCES GAME_OF_JOINS.BI_D_RangoEtarioUsuarios,
	pedido_local_id int not null REFERENCES GAME_OF_JOINS.BI_D_Local(local_id),
	pedido_repartidor_rango_etario int not null REFERENCES GAME_OF_JOINS.BI_D_RangoEtarioUsuarios, 
	pedido_movilidad_repartidor decimal(18,0) not null REFERENCES GAME_OF_JOINS.BI_D_Movilidad(movilidad_id),
	pedido_estado_id int not null REFERENCES GAME_OF_JOINS.BI_D_EstadoPedido(estado_pedido_id),
	pedido_tipo_medio_pago_id int not null REFERENCES GAME_OF_JOINS.BI_D_TipoMedioDePago(tipo_medio_pago_id),
	pedido_tiempo_id int not null REFERENCES GAME_OF_JOINS.BI_D_Tiempo(tiempo_id),
	pedido_localidad_id int not null REFERENCES GAME_OF_JOINS.BI_D_Localidad(localidad_id),
	pedido_dia_semana_id int not null REFERENCES GAME_OF_JOINS.BI_D_Dias(dia_id),
	pedido_rango_horario_id int not null REFERENCES GAME_OF_JOINS.BI_D_RangoHorario(rango_horario_id),
	pedido_total_cupones DECIMAL(18,2),
	pedido_prom_total DECIMAL(18,2),
	pedido_sum_total DECIMAL(18,2),
	pedido_cantidad int,
	pedido_prom_calificacion DECIMAL(12,2),
	pedido_prom_desvio decimal(18,2)
);

ALTER TABLE GAME_OF_JOINS.BI_H_Pedido
ADD CONSTRAINT PK_BI_H_Pedido PRIMARY KEY 
(	
	pedido_usuario_rango_etario,
	pedido_local_id,
	pedido_repartidor_rango_etario,
	pedido_movilidad_repartidor,
	pedido_tipo_medio_pago_id,
	pedido_tiempo_id,
	pedido_localidad_id,
	pedido_estado_id,
	pedido_dia_semana_id,
	pedido_rango_horario_id
);

CREATE TABLE GAME_OF_JOINS.BI_H_Reclamo (
	reclamo_tiempo_id int not null,
	reclamo_dia_semana_id int not null,
	reclamo_rango_horario_id int not null,
	reclamo_rango_etario_operador int not null,
	reclamo_tipo_reclamo int not null,
	reclamo_local_id int not null,
	reclamo_promedio_resolucion decimal(12,2),
	reclamo_cantidad_total int,
	reclamo_monto_total_cupon DECIMAL(18,2) not null
);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo
ADD CONSTRAINT PK_BI_H_Reclamo PRIMARY KEY 
(	
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

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_TipoReclamo
FOREIGN KEY (reclamo_tipo_reclamo) REFERENCES GAME_OF_JOINS.BI_D_TipoReclamo(tipo_reclamo_id);

ALTER TABLE GAME_OF_JOINS.BI_H_Reclamo ADD CONSTRAINT FK_BI_H_Reclamo_Local
FOREIGN KEY (reclamo_local_id) REFERENCES GAME_OF_JOINS.BI_D_Local(local_id);
GO

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
    DECLARE @rangoEtario INT

    DECLARE @edad INT
    SET @edad = DATEDIFF(YEAR, @fecha, GETDATE())

    -- Determinar el rango etario
    IF @edad < 25
        SET @rangoEtario = 1
    ELSE IF @edad >= 25 AND @edad <= 35
        SET @rangoEtario = 2
    ELSE IF @edad > 35 AND @edad <= 55
        SET @rangoEtario = 3
    ELSE
        SET @rangoEtario = 4
    
    RETURN @rangoEtario
END;
GO






--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------TRASPASO DE INFORMACION DE OLTP A OLAP------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


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
VALUES
    ('0 - 25'),
    ('26 - 35'),
    ('36 - 55'),
    ('56 - 200');


INSERT INTO GAME_OF_JOINS.BI_D_RangoHorario
VALUES
    ('08:00 - 09:59'),
    ('10:00 - 11:59'),
    ('12:00 - 13:59'),
    ('14:00 - 15:59'),
    ('16:00 - 17:59'),
    ('18:00 - 19:59'),
    ('20:00 - 21:59'),
    ('22:00 - 23:59');

INSERT INTO GAME_OF_JOINS.BI_D_TipoLocal
	select local_tipo from GAME_OF_JOINS.LocalTipo

INSERT INTO GAME_OF_JOINS.BI_D_Local
	SELECT local_nombre, local_tipo_id, (SELECT TOP 1 categoria_id FROM GAME_OF_JOINS.BI_D_Categoria ORDER BY NEWID()) FROM
	GAME_OF_JOINS.LocalRegistrado

INSERT INTO GAME_OF_JOINS.BI_D_Localidad
	SELECT L.localidad FROM GAME_OF_JOINS.Localidad L

INSERT INTO GAME_OF_JOINS.BI_D_Provincia
	SELECT P.provincia FROM GAME_OF_JOINS.Provincia P

INSERT INTO GAME_OF_JOINS.BI_D_EstadoPedido 
	SELECT E.estado FROM GAME_OF_JOINS.EstadoPedido E

INSERT INTO GAME_OF_JOINS.BI_D_EstadoEnvio 
	SELECT E.estado FROM GAME_OF_JOINS.EstadoEnvio E

INSERT INTO GAME_OF_JOINS.BI_D_Paquete
	SELECT paquete_tipo, paquete_tipo_precio FROM GAME_OF_JOINS.Paquete P

INSERT INTO GAME_OF_JOINS.BI_D_Movilidad
	SELECT * FROM GAME_OF_JOINS.Movilidad M
	
INSERT INTO GAME_OF_JOINS.BI_D_TipoMedioDePago
	SELECT tipo_medio_pago FROM GAME_OF_JOINS.TipoMedioDePago

INSERT INTO GAME_OF_JOINS.BI_D_TipoReclamo(tipo_reclamo) 
	SELECT tipo_reclamo FROM GAME_OF_JOINS.TipoReclamo

INSERT INTO GAME_OF_JOINS.BI_D_Cupon (cupon_nro, cupon_monto, cupon_fecha_alta)
	SELECT cupon_nro, cupon_monto_descuento, cupon_fecha_alta FROM GAME_OF_JOINS.Cupon

INSERT INTO GAME_OF_JOINS.BI_D_RangoEtarioUsuarios
	SELECT distinct GAME_OF_JOINS.GetRangoEtario(U.usuario_fecha_nacimiento) FROM GAME_OF_JOINS.Usuario U 

INSERT INTO GAME_OF_JOINS.BI_D_RangoEtarioOperadores
	SELECT distinct GAME_OF_JOINS.GetRangoEtario(O.operador_fecha_nacimiento) FROM GAME_OF_JOINS.OperadorReclamo O 

INSERT INTO GAME_OF_JOINS.BI_D_RangoEtarioRepartidores
	SELECT distinct GAME_OF_JOINS.GetRangoEtario(R.repartidor_fecha_nacimiento) FROM GAME_OF_JOINS.Repartidor R 

INSERT INTO GAME_OF_JOINS.BI_H_ServicioMensajeria (servicio_mensajeria_rango_etario_repartidor, servicio_mensajeria_movilidad_repartidor, servicio_mensajeria_estado_id, servicio_mensajeria_tipo_medio_pago_id, servicio_mensajeria_tiempo_id, servicio_mensajeria_localidad_id, servicio_mensajeria_dia_semana_id, servicio_mensajeria_rango_horario_id, servicio_mensajeria_paquete, servicio_mensajeria_prom_valor_asegurado, servicio_mensajeria_prom_desvio, servicio_mensajeria_total_servicios)
	SELECT RER.repartidor_rango_etario_id, M.movilidad_id, EE.estado_envio_id, TMP.tipo_medio_pago_id, TI.tiempo_id, LO.localidad_id, DI.dia_id, RH.rango_horario_id, P.paquete_id, AVG(S.servicio_mensajeria_valor_asegurado) AS PROM_VALOR_ASEGURADO, AVG(ABS(S.servicio_mensajeria_tiempo_estimado - DATEDIFF(MINUTE, S.servicio_mensajeria_fecha_solicitud, S.servicio_mensajeria_fecha_finalizacion))) AS DESVIO_PROMEDIO, COUNT(1) AS CANT_SERVICIOS_TOTALES
	FROM GAME_OF_JOINS.ServicioMensajeria S
	JOIN GAME_OF_JOINS.Repartidor R ON R.repartidor_dni = S.servicio_mensajeria_repartidor
	JOIN GAME_OF_JOINS.BI_D_Movilidad M ON R.repartidor_movilidad = M.movilidad_id
	JOIN GAME_OF_JOINS.BI_D_RangoEtarioRepartidores RER ON RER.repartidor_rango_etario_id = GAME_OF_JOINS.GetRangoEtario(R.repartidor_fecha_nacimiento)
	JOIN GAME_OF_JOINS.MedioDePago MP ON S.servicio_mensajeria_medio_pago = MP.medio_pago_id
	JOIN GAME_OF_JOINS.BI_D_EstadoEnvio EE ON S.servicio_mensajeria_estado_id = EE.estado_envio_id
	JOIN GAME_OF_JOINS.BI_D_Paquete P ON S.servicio_mensajeria_paquete = P.paquete_id
	INNER JOIN GAME_OF_JOINS.BI_D_Localidad LO ON LO.localidad_id = S.servicio_mensajeria_localidad
	INNER JOIN GAME_OF_JOINS.BI_D_TipoMedioDePago TMP ON TMP.tipo_medio_pago_id = MP.tipo_medio_pago_id
	INNER JOIN GAME_OF_JOINS.BI_D_Tiempo TI ON TI.anio = DATEPART(YEAR, S.servicio_mensajeria_fecha_solicitud) AND TI.mes = DATEPART(MONTH, S.servicio_mensajeria_fecha_solicitud)
	INNER JOIN GAME_OF_JOINS.BI_D_Dias DI ON DI.dia = DATENAME(WEEKDAY, S.servicio_mensajeria_fecha_solicitud)
	INNER JOIN GAME_OF_JOINS.BI_D_RangoHorario RH ON RH.rango_horario = GAME_OF_JOINS.GetRangoHorario(S.servicio_mensajeria_fecha_solicitud)
	GROUP BY RER.repartidor_rango_etario_id, M.movilidad_id, EE.estado_envio_id, TMP.tipo_medio_pago_id, TI.tiempo_id, LO.localidad_id, DI.dia_id, RH.rango_horario_id, P.paquete_id
GO

INSERT INTO GAME_OF_JOINS.BI_H_Reclamo 
	SELECT TI.tiempo_id, DI.dia_id, RH.rango_horario_id, REO.operador_rango_etario_id, TR.tipo_reclamo_id, L.local_id, AVG(DATEDIFF(MINUTE, R.reclamo_fecha_hora_creacion, R.reclamo_fecha_hora_solucion)) AS PROM_TIEMPO, COUNT(1) AS TOTAL_RECLAMOS, CASE WHEN SUM(C.cupon_monto) IS NULL THEN 0 ELSE SUM(C.cupon_monto) END AS CUPON_MONTO_TOTAL
	FROM GAME_OF_JOINS.Reclamo R
	JOIN GAME_OF_JOINS.OperadorReclamo OP ON OP.operador_id = R.reclamo_operador
	JOIN GAME_OF_JOINS.BI_D_RangoEtarioOperadores REO ON REO.operador_rango_etario = GAME_OF_JOINS.GetRangoEtario(OP.operador_fecha_nacimiento) 
	JOIN GAME_OF_JOINS.BI_D_TipoReclamo TR ON TR.tipo_reclamo_id = R.reclamo_tipo
	JOIN GAME_OF_JOINS.BI_D_Tiempo TI ON TI.anio = DATEPART(YEAR, R.reclamo_fecha_hora_creacion) AND TI.mes = DATEPART(MONTH, R.reclamo_fecha_hora_creacion)
	JOIN GAME_OF_JOINS.BI_D_Dias DI ON DI.dia = DATENAME(WEEKDAY, R.reclamo_fecha_hora_creacion)
	JOIN GAME_OF_JOINS.BI_D_RangoHorario RH ON RH.rango_horario = GAME_OF_JOINS.GetRangoHorario(R.reclamo_fecha_hora_creacion)
	LEFT JOIN GAME_OF_JOINS.CuponReclamo CR ON CR.reclamo_nro = R.reclamo_nro
	LEFT JOIN GAME_OF_JOINS.BI_D_Cupon C ON C.cupon_nro = CR.cupon_nro
	INNER JOIN GAME_OF_JOINS.Pedido P ON R.reclamo_pedido = P.pedido_nro
	JOIN GAME_OF_JOINS.BI_D_Local L ON P.pedido_local_id = L.local_id
	GROUP BY TI.tiempo_id, DI.dia_id, RH.rango_horario_id, REO.operador_rango_etario_id, TR.tipo_reclamo_id, L.local_id
GO


INSERT INTO GAME_OF_JOINS.BI_H_Pedido (pedido_usuario_rango_etario, pedido_repartidor_rango_etario, pedido_movilidad_repartidor, pedido_local_id, pedido_estado_id, pedido_tipo_medio_pago_id, pedido_tiempo_id, pedido_localidad_id, pedido_dia_semana_id, pedido_rango_horario_id, pedido_total_cupones, pedido_prom_total, pedido_sum_total, pedido_cantidad, pedido_prom_calificacion, pedido_prom_desvio)
	SELECT REU.usuario_rango_etario_id, RER.repartidor_rango_etario_id, M.movilidad_id, L.local_id, EP.estado_pedido_id, TMP.tipo_medio_pago_id, TI.tiempo_id, LO.localidad_id, DI.dia_id, RH.rango_horario_id, SUM(P.pedido_total_cupones) AS TOTAL_CUP, AVG(P.pedido_total_servicio) AS PROM_TOTAL, SUM(P.pedido_total_servicio) AS TOTAL, COUNT(1) AS CANT_PEDIDOS_TOTALES, AVG(P.pedido_calificacion) AS CALIF_PROM, AVG(ABS(P.pedido_tiempo_entrega_estimada - DATEDIFF(MINUTE, P.pedido_fecha_hora, P.pedido_fecha_hora_entrega))) AS DESVIO_PROMEDIO
	FROM GAME_OF_JOINS.Pedido P
	JOIN GAME_OF_JOINS.Usuario U ON P.pedido_usuario_dni = U.usuario_dni
	JOIN GAME_OF_JOINS.BI_D_RangoEtarioUsuarios REU ON REU.usuario_rango_etario_id = GAME_OF_JOINS.GetRangoEtario(U.usuario_fecha_nacimiento) 
	JOIN GAME_OF_JOINS.Repartidor R ON P.pedido_repartidor_dni = R.repartidor_dni
	JOIN GAME_OF_JOINS.BI_D_Movilidad M ON R.repartidor_movilidad = M.movilidad_id
	JOIN GAME_OF_JOINS.BI_D_RangoEtarioRepartidores RER ON RER.repartidor_rango_etario_id = GAME_OF_JOINS.GetRangoEtario(R.repartidor_fecha_nacimiento) 
	JOIN GAME_OF_JOINS.MedioDePago MP ON P.pedido_medio_pago_id = MP.medio_pago_id
	JOIN GAME_OF_JOINS.BI_D_EstadoPedido EP ON P.pedido_estado_id = EP.estado_pedido_id
	INNER JOIN GAME_OF_JOINS.DireccionUsuario DU ON DU.direccion_usuario_id = P.pedido_direccion_usuario_id
	INNER JOIN GAME_OF_JOINS.BI_D_Localidad LO ON LO.localidad_id = DU.direccion_usuario_localidad
	INNER JOIN GAME_OF_JOINS.BI_D_TipoMedioDePago TMP ON TMP.tipo_medio_pago_id = MP.tipo_medio_pago_id
	INNER JOIN GAME_OF_JOINS.BI_D_Tiempo TI ON TI.anio = DATEPART(YEAR, P.pedido_fecha_hora) AND TI.mes = DATEPART(MONTH, P.pedido_fecha_hora)
	INNER JOIN GAME_OF_JOINS.BI_D_Dias DI ON DI.dia = DATENAME(WEEKDAY, P.pedido_fecha_hora)
	INNER JOIN GAME_OF_JOINS.BI_D_RangoHorario RH ON RH.rango_horario = GAME_OF_JOINS.GetRangoHorario(P.pedido_fecha_hora)
	JOIN GAME_OF_JOINS.BI_D_Local L ON P.pedido_local_id = L.local_id
	GROUP BY REU.usuario_rango_etario_id, L.local_id, RER.repartidor_rango_etario_id, M.movilidad_id, EP.estado_pedido_id, TMP.tipo_medio_pago_id, TI.tiempo_id, LO.localidad_id, DI.dia_id, RH.rango_horario_id
GO

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------CREATE VIEWS------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--CAMBIO
CREATE VIEW GAME_OF_JOINS.BI_V_RECLAMOS_MENSUALES AS (
	SELECT 
		(SELECT local_nombre FROM GAME_OF_JOINS.BI_D_Local WHERE local_id = R.reclamo_local_id) as LOCAL,
		(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS ANIO,
		(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS MES,
		(SELECT dia FROM GAME_OF_JOINS.BI_D_Dias WHERE dia_id = R.reclamo_dia_semana_id) AS DIA_SEMANA, 
		(SELECT rango_horario FROM GAME_OF_JOINS.BI_D_RangoHorario WHERE rango_horario_id = R.reclamo_rango_horario_id) AS RANGO_HORARIO,
		SUM(R.reclamo_cantidad_total) AS TOTAL_RECLAMOS
	FROM GAME_OF_JOINS.BI_H_Reclamo R 
	GROUP BY reclamo_tiempo_id, R.reclamo_local_id, R.reclamo_dia_semana_id, R.reclamo_rango_horario_id
	) 
GO

--CAMBIO
CREATE VIEW GAME_OF_JOINS.BI_V_TIEMPO_RESOLUCION_RECLAMOS AS (
	SELECT
		(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS ANIO,
		(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS MES,
		(SELECT tipo_reclamo FROM GAME_OF_JOINS.BI_D_TipoReclamo TR WHERE TR.tipo_reclamo_id = R.reclamo_tipo_reclamo) AS TIPO_RECLAMO,
		(SELECT rango_etario_id from GAME_OF_JOINS.BI_D_RangoEtario RE WHERE RE.rango_etario_id = R.reclamo_rango_etario_operador) AS RANGO_ETARIO,
		SUM(R.reclamo_cantidad_total) AS TOTAL_RECLAMOS,
		AVG(R.reclamo_promedio_resolucion) AS PROMEDIO_RESOLUCION
	FROM GAME_OF_JOINS.BI_H_RECLAMO R
	GROUP BY reclamo_tiempo_id, reclamo_tipo_reclamo, reclamo_rango_etario_operador
)
GO

--CAMBIO
CREATE VIEW GAME_OF_JOINS.BI_V_MONTO_MENSUAL_CUPONES AS (
	SELECT 
		(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS ANIO,
		(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = R.reclamo_tiempo_id) AS MES, 
		SUM(R.reclamo_monto_total_cupon) AS MONTO_TOTAL
		FROM GAME_OF_JOINS.BI_H_Reclamo R
		GROUP BY reclamo_tiempo_id
)
GO

--NUEVA!
CREATE VIEW GAME_OF_JOINS.BI_V_CUPONES_USUARIO AS (
	SELECT 
		(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = P.pedido_tiempo_id) AS ANIO,
		(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = P.pedido_tiempo_id) AS MES,
		P.pedido_usuario_rango_etario AS RANGO_ETARIO_USUARIO,
		SUM(P.pedido_total_cupones) AS TOTAL_CUPONES
		FROM 
		GAME_OF_JOINS.BI_H_Pedido P
		GROUP BY P.pedido_tiempo_id, P.pedido_usuario_rango_etario
)
GO

--CAMBIO
CREATE VIEW GAME_OF_JOINS.BI_V_CALIFICACION_LOCAL AS (
	SELECT 
		(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = P.pedido_tiempo_id) AS ANIO,
		(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = P.pedido_tiempo_id) AS MES, 
		(SELECT local_nombre FROM GAME_OF_JOINS.BI_D_Local WHERE local_id = P.pedido_local_id) AS LOCAL,
		CAST(AVG(P.pedido_prom_calificacion) AS DECIMAL(2,1)) AS CALIFICACION_PROMEDIO
		FROM GAME_OF_JOINS.BI_H_Pedido P
		GROUP BY P.pedido_tiempo_id, P.pedido_local_id
)
GO

--CAMBIO
CREATE VIEW GAME_OF_JOINS.BI_V_MONTO_PEDIDO_LOCALIDAD AS (
	SELECT 
		(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = P.pedido_tiempo_id) AS ANIO,
		(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = P.pedido_tiempo_id) AS MES, 
		(SELECT localidad FROM GAME_OF_JOINS.BI_D_Localidad WHERE localidad_id = P.pedido_localidad_id) AS LOCALIDAD,
		AVG(P.pedido_prom_total) AS MONTO_PROMEDIO
		FROM GAME_OF_JOINS.BI_H_Pedido P
		GROUP BY P.pedido_tiempo_id, P.pedido_localidad_id
)
GO

--CAMBIO
CREATE VIEW GAME_OF_JOINS.BI_V_MONTO_PEDIDOS_CANCELADOS AS (
	SELECT 
		(SELECT dia FROM GAME_OF_JOINS.BI_D_Dias WHERE dia_id = P.pedido_dia_semana_id) AS DIA_SEMANA,
		(SELECT rango_horario FROM GAME_OF_JOINS.BI_D_RangoHorario WHERE rango_horario_id = P.pedido_rango_horario_id) AS RANGO_HORARIO,
		(SELECT local_nombre FROM GAME_OF_JOINS.BI_D_Local WHERE local_id = P.pedido_local_id) AS LOCAL,
		SUM(P.pedido_sum_total) AS MONTO_TOTAL
		FROM GAME_OF_JOINS.BI_H_Pedido P
		WHERE P.pedido_estado_id = 2
		GROUP BY P.pedido_dia_semana_id, P.pedido_rango_horario_id, P.pedido_local_id
)
GO
--CAMBIO
CREATE VIEW GAME_OF_JOINS.BI_V_VALOR_ASEGURADO_XPAQUETE AS (
	SELECT 
		(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = S.servicio_mensajeria_tiempo_id) AS ANIO,
		(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = S.servicio_mensajeria_tiempo_id) AS MES,
		(SELECT paquete_tipo FROM GAME_OF_JOINS.BI_D_Paquete WHERE paquete_id = S.servicio_mensajeria_paquete) AS TIPO_PAQUETE,
		AVG(S.servicio_mensajeria_prom_desvio) AS VALOR_ASEGURADO_PROMEDIO
		FROM GAME_OF_JOINS.BI_H_ServicioMensajeria S
		GROUP BY S.servicio_mensajeria_tiempo_id, S.servicio_mensajeria_paquete
)
GO

CREATE VIEW GAME_OF_JOINS.BI_V_PEDIDOS_Y_SERVICIOS_TOTALES AS (
	SELECT
		(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = T.pedido_tiempo_id) AS ANIO,
		(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = T.pedido_tiempo_id) AS MES, 
		l.localidad AS LOCALIDAD,
		pedido_repartidor_rango_etario, --cambio
		SUM(pedidos_entregados) + SUM(servicios_entregados) AS SERVICIOS_TOTALES
	FROM (
		SELECT
			pedido_tiempo_id,
			pedido_localidad_id,
			pedido_repartidor_rango_etario, -- cambio
			SUM(P.pedido_cantidad) AS pedidos_entregados,
			0 AS servicios_entregados
		FROM GAME_OF_JOINS.BI_H_Pedido P
		GROUP BY pedido_tiempo_id, pedido_localidad_id, pedido_repartidor_rango_etario
		UNION ALL
		SELECT
			servicio_mensajeria_tiempo_id,
			servicio_mensajeria_localidad_id,
			servicio_mensajeria_rango_etario_repartidor, -- cambio
			0 AS pedidos_entregados,
			SUM(S.servicio_mensajeria_total_servicios) AS servicios_entregados
		FROM GAME_OF_JOINS.BI_H_ServicioMensajeria S
		GROUP BY servicio_mensajeria_tiempo_id, servicio_mensajeria_localidad_id, servicio_mensajeria_rango_etario_repartidor -- cambio
	) AS T
	INNER JOIN GAME_OF_JOINS.BI_D_Tiempo TI ON T.pedido_tiempo_id = TI.tiempo_id
	INNER JOIN GAME_OF_JOINS.BI_D_Localidad l ON T.pedido_localidad_id = l.localidad_id
	GROUP BY T.pedido_tiempo_id, l.localidad, pedido_repartidor_rango_etario -- cambio
)
GO



CREATE VIEW GAME_OF_JOINS.BI_V_PEDIDOS_Y_SERVICIOS_ENTREGADOS AS (
	SELECT
		(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = T.pedido_tiempo_id) AS ANIO,
		(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = T.pedido_tiempo_id) AS MES, 
		l.localidad AS LOCALIDAD,
		pedido_repartidor_rango_etario AS RANGO_ETARIO_REPARTIDOR,
		SUM(pedidos_entregados) + SUM(servicios_entregados) AS SERVICIOS_CONCRETADOS
	FROM (
		SELECT
			pedido_tiempo_id,
			pedido_localidad_id,
			pedido_repartidor_rango_etario, --Cambio
			SUM(P.pedido_cantidad) AS pedidos_entregados,
			0 AS servicios_entregados
		FROM GAME_OF_JOINS.BI_H_Pedido P
		INNER JOIN GAME_OF_JOINS.BI_D_EstadoPedido EP ON EP.estado_pedido_id = P.pedido_estado_id
		WHERE EP.estado = 'Estado Mensajeria Entregado'
		GROUP BY pedido_tiempo_id, pedido_localidad_id, pedido_repartidor_rango_etario --cambio

		UNION ALL

		SELECT
			servicio_mensajeria_tiempo_id,
			servicio_mensajeria_localidad_id,
			servicio_mensajeria_rango_etario_repartidor,-- cambio
			0 AS pedidos_entregados,
			SUM(S.servicio_mensajeria_total_servicios) AS servicios_entregados
		FROM GAME_OF_JOINS.BI_H_ServicioMensajeria S
		INNER JOIN GAME_OF_JOINS.BI_D_EstadoEnvio EE ON S.servicio_mensajeria_estado_id = EE.estado_envio_id
		WHERE EE.estado = 'Estado Mensajeria Entregado'
		GROUP BY servicio_mensajeria_tiempo_id, servicio_mensajeria_localidad_id, servicio_mensajeria_rango_etario_repartidor --cambio 
	) AS T
	INNER JOIN GAME_OF_JOINS.BI_D_Tiempo TI ON T.pedido_tiempo_id = TI.tiempo_id
	INNER JOIN GAME_OF_JOINS.BI_D_Localidad l ON T.pedido_localidad_id = l.localidad_id
	GROUP BY T.pedido_tiempo_id, l.localidad, pedido_repartidor_rango_etario -- cambio
)
GO


CREATE VIEW GAME_OF_JOINS.BI_V_PEDIDOS_Y_SERVICIOS_PROMEDIO AS (
	SELECT E.ANIO, E.MES, E.LOCALIDAD, E.RANGO_ETARIO_REPARTIDOR, E.SERVICIOS_CONCRETADOS, T.SERVICIOS_TOTALES, (CAST(E.SERVICIOS_CONCRETADOS AS DECIMAL(4,1)) / CAST(T.SERVICIOS_TOTALES AS DECIMAL(4,1))) * 100 AS PORCENTAJE_SERVICIOS
	FROM GAME_OF_JOINS.BI_V_PEDIDOS_Y_SERVICIOS_ENTREGADOS E 
	INNER JOIN GAME_OF_JOINS.BI_V_PEDIDOS_Y_SERVICIOS_TOTALES T ON E.ANIO = T.ANIO AND E.MES = T.MES AND E.LOCALIDAD = T.LOCALIDAD AND E.RANGO_ETARIO_REPARTIDOR = T.PEDIDO_REPARTIDOR_RANGO_ETARIO
)
GO
--Día de la semana y franja horaria con mayor cantidad de pedidos según la localidad y categoría del local, para cada mes de cada año.

CREATE VIEW GAME_OF_JOINS.BI_V_MAYOR_CANTIDAD_PEDIDOS AS
	SELECT 
	(SELECT anio FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = P.pedido_tiempo_id) AS ANIO,
	(SELECT mes FROM GAME_OF_JOINS.BI_D_Tiempo WHERE tiempo_id = P.pedido_tiempo_id) AS MES,
	P.pedido_localidad_id AS LOCALIDAD, 
	TL.tipo_local_id, 
	(SELECT TOP 1 P1.pedido_dia_semana_id 
		FROM GAME_OF_JOINS.BI_H_Pedido P1 
		INNER JOIN GAME_OF_JOINS.BI_D_Local L1 ON P1.pedido_local_id = L1.local_id 
		WHERE P1.pedido_tiempo_id = P.pedido_tiempo_id AND P1.pedido_localidad_id = P.pedido_localidad_id AND L1.tipo_local_id = TL.tipo_local_id
		GROUP BY P1.pedido_dia_semana_id, P1.pedido_rango_horario_id
		ORDER BY SUM(P1.pedido_cantidad) DESC) AS DIA,
	(SELECT TOP 1 P1.pedido_rango_horario_id 
		FROM GAME_OF_JOINS.BI_H_Pedido P1 
		INNER JOIN GAME_OF_JOINS.BI_D_Local L1 ON P1.pedido_local_id = L1.local_id 
		WHERE P1.pedido_tiempo_id = P.pedido_tiempo_id AND P1.pedido_localidad_id = P.pedido_localidad_id AND L1.tipo_local_id = TL.tipo_local_id
		GROUP BY P1.pedido_dia_semana_id, P1.pedido_rango_horario_id
		ORDER BY SUM(P1.pedido_cantidad) DESC) AS RANGO_HORARIO,
	 SUM(P.pedido_cantidad) AS CANTIDAD_PEDIDOS FROM 
	GAME_OF_JOINS.BI_H_Pedido P
	INNER JOIN GAME_OF_JOINS.BI_D_Local L ON P.pedido_local_id = L.local_id
	INNER JOIN GAME_OF_JOINS.BI_D_TipoLocal TL ON L.tipo_local_id = TL.tipo_local_id
	GROUP BY P.pedido_tiempo_id, P.pedido_localidad_id, TL.tipo_local_id

GO

CREATE VIEW GAME_OF_JOINS.BI_DESVIOS_EN_SERVICIOS AS (
	SELECT DIA_SEMANA, RANGO_HORARIO, pedido_movilidad_repartidor, AVG(DESVIO_PROMEDIO) AS DESVIO_PROMEDIO FROM (
		SELECT
			(SELECT dia FROM GAME_OF_JOINS.BI_D_Dias WHERE dia_id = P.pedido_dia_semana_id) AS DIA_SEMANA,
			(SELECT rango_horario FROM GAME_OF_JOINS.BI_D_RangoHorario WHERE rango_horario_id = P.pedido_rango_horario_id) AS RANGO_HORARIO,
			P.pedido_movilidad_repartidor, -- cambio
			AVG(pedido_prom_desvio) AS DESVIO_PROMEDIO
		FROM GAME_OF_JOINS.BI_H_Pedido P
		INNER JOIN GAME_OF_JOINS.BI_D_EstadoPedido EP ON EP.estado_pedido_id = P.pedido_estado_id
		WHERE EP.estado = 'Estado Mensajeria Entregado'
		GROUP BY pedido_dia_semana_id, pedido_rango_horario_id, pedido_movilidad_repartidor --cambio

		UNION ALL

		SELECT
			(SELECT dia FROM GAME_OF_JOINS.BI_D_Dias WHERE dia_id = S.servicio_mensajeria_dia_semana_id) AS DIA_SEMANA,
			(SELECT rango_horario FROM GAME_OF_JOINS.BI_D_RangoHorario WHERE rango_horario_id = S.servicio_mensajeria_rango_horario_id) AS RANGO_HORARIO,
			S.servicio_mensajeria_movilidad_repartidor,
			AVG(servicio_mensajeria_prom_desvio) AS DESVIO_PROMEDIO
		FROM GAME_OF_JOINS.BI_H_ServicioMensajeria S
		INNER JOIN GAME_OF_JOINS.BI_D_EstadoEnvio EE ON S.servicio_mensajeria_estado_id = EE.estado_envio_id
		WHERE EE.estado = 'Estado Mensajeria Entregado'
		GROUP BY servicio_mensajeria_dia_semana_id, servicio_mensajeria_rango_horario_id, S.servicio_mensajeria_movilidad_repartidor--M.movilidad
	) AS T
	GROUP BY DIA_SEMANA, RANGO_HORARIO, pedido_movilidad_repartidor
)
GO

-- Cantidad de pedidos realizados, agrupados por localidad y tipo de local ordenados segun dia y franja horaria de mayor demanda 
SELECT * FROM GAME_OF_JOINS.BI_V_MAYOR_CANTIDAD_PEDIDOS 

--Cantidad de reclamos mensuales recibidos por cada local en funcion del dia de la semana y rango horario.
SELECT * FROM GAME_OF_JOINS.BI_V_RECLAMOS_MENSUALES

--Tiempo promedio de resolución de reclamos mensual segun cada tipo de reclamo y rango etario de los operadores.
--El tiempo de resolucion debe calcularse en minutos y representa la diferencia entre la fecha/hora en que se realizo el reclamo y la fecha/hora que se resolvio.
SELECT * FROM GAME_OF_JOINS.BI_V_TIEMPO_RESOLUCION_RECLAMOS

--Monto mensual generado en cupones a partir de reclamos.
SELECT * FROM GAME_OF_JOINS.BI_V_MONTO_MENSUAL_CUPONES

--Monto total de los cupones utilizados por mes en funcion del rango etario de los usuarios. (PODEMOS ASUMIR QUE AL SER CUPONES UTILIZADOS Y NO GENERADOS, LA FECHA A ANALIZAR ES LA DE LA CREACION DEL PEDIDO)
SELECT * FROM GAME_OF_JOINS.BI_V_CUPONES_USUARIO

--Promedio de cali?cacion mensual por local.
SELECT * FROM GAME_OF_JOINS.BI_V_CALIFICACION_LOCAL

--Valor promedio mensual que tienen los envios de pedidos en cada localidad.
SELECT * FROM GAME_OF_JOINS.BI_V_MONTO_PEDIDO_LOCALIDAD

--Monto total no cobrado por cada local en función de los pedidos cancelados según el día de la semana y la franja horaria (cuentan como pedidos cancelados tanto los que cancela el usuario como el local).
SELECT * FROM GAME_OF_JOINS.BI_V_MONTO_PEDIDOS_CANCELADOS

--Promedio mensual del valor asegurado (valor declarado por el usuario) de los paquetes enviados a través del servicio de mensajería en función del tipo de paquete.
SELECT * FROM GAME_OF_JOINS.BI_V_VALOR_ASEGURADO_XPAQUETE

--Porcentaje de pedidos y mensajería entregados mensualmente según el rango etario de los repartidores y la localidad.
--Este indicador se debe tener en cuenta y sumar tanto los envíos de pedidos como los de mensajería.
--El porcentaje se calcula en función del total general de pedidos y envíos mensuales entregados.
SELECT * FROM GAME_OF_JOINS.BI_V_PEDIDOS_Y_SERVICIOS_PROMEDIO

--Desvío promedio en tiempo de entrega según el tipo de movilidad, el día de la semana y la franja horaria.
--El desvío debe calcularse en minutos y representa la diferencia entre la fecha/hora en que se realizó el pedido y la fecha/hora que se entregó en comparación con los minutos de tiempo estimados.
--Este indicador debe tener en cuenta todos los envíos, es decir, sumar tanto los envíos de pedidos como los de mensajería.
SELECT * FROM GAME_OF_JOINS.BI_DESVIOS_EN_SERVICIOS

