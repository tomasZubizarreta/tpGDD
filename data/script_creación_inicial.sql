USE GD1C2023
GO


IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'ServicioMensajeria')
    DROP TABLE GAME_OF_JOINS.ServicioMensajeria;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'CuponPedido')
    DROP TABLE GAME_OF_JOINS.CuponPedido;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'CuponReclamo')
    DROP TABLE GAME_OF_JOINS.CuponReclamo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Cupon')
    DROP TABLE GAME_OF_JOINS.Cupon;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'TipoCupon')
    DROP TABLE GAME_OF_JOINS.TipoCupon;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Reclamo')
    DROP TABLE GAME_OF_JOINS.Reclamo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'OperadorReclamo')
    DROP TABLE GAME_OF_JOINS.OperadorReclamo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Paquete')
    DROP TABLE GAME_OF_JOINS.Paquete;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Pedido')
    DROP TABLE GAME_OF_JOINS.Pedido;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'MedioDePago')
    DROP TABLE GAME_OF_JOINS.MedioDePago;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'TipoMedioDePago')
    DROP TABLE GAME_OF_JOINS.TipoMedioDePago;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Tarjeta')
    DROP TABLE GAME_OF_JOINS.Tarjeta;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Repartidor')
    DROP TABLE GAME_OF_JOINS.Repartidor;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Categoria')
    DROP TABLE GAME_OF_JOINS.Categoria;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'ProductoLocal')
    DROP TABLE GAME_OF_JOINS.ProductoLocal;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Movilidad')
    DROP TABLE GAME_OF_JOINS.Movilidad;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'AtencionLocal')
    DROP TABLE GAME_OF_JOINS.AtencionLocal;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'LocalRegistrado')
    DROP TABLE GAME_OF_JOINS.LocalRegistrado;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'DireccionLocal')
    DROP TABLE GAME_OF_JOINS.DireccionLocal;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'DireccionUsuario')
    DROP TABLE GAME_OF_JOINS.DireccionUsuario;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Usuario')
    DROP TABLE GAME_OF_JOINS.Usuario;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'EstadoPedido')
    DROP TABLE GAME_OF_JOINS.EstadoPedido;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'EstadoEnvio')
    DROP TABLE GAME_OF_JOINS.EstadoEnvio;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'EstadoReclamo')
    DROP TABLE GAME_OF_JOINS.EstadoReclamo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'TipoReclamo')
    DROP TABLE GAME_OF_JOINS.TipoReclamo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'LocalTipo')
    DROP TABLE GAME_OF_JOINS.LocalTipo;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Localidad')
    DROP TABLE GAME_OF_JOINS.Localidad;

IF EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Provincia')
    DROP TABLE GAME_OF_JOINS.Provincia;

------------------------------------DROP PROCEDURES PRE MIGRACION------------------------------------
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_usuario' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_usuario;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_pedido' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_pedido;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_repartidor' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_repartidor;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_envio' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_envio;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_servicio_mensajeria' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_servicio_mensajeria;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_paquete' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_paquete;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_tarjeta' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_tarjeta;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_medio_pago' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_medio_pago;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_tipo_medio_pago' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_tipo_medio_pago;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_operador_reclamo' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_operador_reclamo;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_tipo_cupon' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_tipo_cupon;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_cupon' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_cupon;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_reclamo' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_reclamo;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_cupon_reclamo' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_cupon_reclamo;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_local' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_local;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_direccion_local' AND schema_id = SCHEMA_ID('GAME_OF_JOINS')) --LISTO
    DROP PROCEDURE GAME_OF_JOINS.migrar_direccion_local;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_producto_local' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_producto_local;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_atencion_local' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_atencion_local;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_direccion_usuario' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_direccion_usuario;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_estado_envio' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_estado_envio;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_estado_pedido' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_estado_pedido;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_estado_reclamo' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_estado_reclamo;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_localidad' AND schema_id = SCHEMA_ID('GAME_OF_JOINS')) --LISTO
    DROP PROCEDURE GAME_OF_JOINS.migrar_localidad;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_movilidad' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_movilidad;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_categoria' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_categoria;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_local_tipo' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_local_tipo;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_cupon_tipo' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_tipo_cupon;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_provincia' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_provincia;
IF EXISTS (SELECT * FROM sys.procedures WHERE name = 'migrar_tipo_reclamo' AND schema_id = SCHEMA_ID('GAME_OF_JOINS'))
    DROP PROCEDURE GAME_OF_JOINS.migrar_tipo_reclamo;
GO

--------------------------- Creacion del schema --------------------------- 
IF EXISTS (SELECT name FROM sys.schemas WHERE name = 'GAME_OF_JOINS')
	DROP SCHEMA GAME_OF_JOINS;
GO

CREATE SCHEMA GAME_OF_JOINS
GO

--------------------------- Creacion de tablas ---------------------------- 
CREATE TABLE GAME_OF_JOINS.provincia (
	provincia_id int IDENTITY(1,1) PRIMARY KEY,
	provincia nvarchar(255) null
);

CREATE TABLE GAME_OF_JOINS.EstadoReclamo (
	estado_reclamo_id int IDENTITY PRIMARY KEY,
	estado nvarchar(255) null
);

CREATE TABLE GAME_OF_JOINS.TipoReclamo (
	tipo_reclamo_id int IDENTITY PRIMARY KEY,
	tipo_reclamo nvarchar(40) NULL
);

CREATE TABLE GAME_OF_JOINS.EstadoEnvio(
	estado_envio_id int IDENTITY PRIMARY KEY,
	estado nvarchar(50) null
);

CREATE TABLE GAME_OF_JOINS.EstadoPedido(
	estado_pedido_id int IDENTITY PRIMARY KEY,
	estado nvarchar(50) null
);

CREATE TABLE GAME_OF_JOINS.Localidad (
	localidad_id int IDENTITY PRIMARY KEY,
	localidad nvarchar(255) null
);

CREATE TABLE GAME_OF_JOINS.Movilidad (
	movilidad_id int IDENTITY PRIMARY KEY,
	movilidad nvarchar(255) null
);

CREATE TABLE GAME_OF_JOINS.LocalTipo (
	local_tipo_id int IDENTITY PRIMARY KEY,
	local_tipo nvarchar(40) NULL
);

CREATE TABLE GAME_OF_JOINS.Categoria (
	categoria_id int IDENTITY PRIMARY KEY,
	--local_tipo_id int REFERENCES GAME_OF_JOINS.LocalTipo NOT NULL,
	categoria nvarchar(50) NULL
);


CREATE TABLE GAME_OF_JOINS.Usuario(
	usuario_dni decimal(18,0) PRIMARY KEY,
	usuario_nombre nvarchar(255) NULL,
	usuario_apellido nvarchar(255) NULL,
	usuario_mail nvarchar(255) NULL,
	usuario_telefono decimal(18,0) NULL,
	usuario_fecha_registro datetime2(3) NULL,
	usuario_fecha_nacimiento date NULL
);

 CREATE TABLE GAME_OF_JOINS.Repartidor(
	repartidor_dni decimal(18,0) NOT NULL PRIMARY KEY,
	repartidor_movilidad int REFERENCES GAME_OF_JOINS.Movilidad(movilidad_id),
	repartidor_localidad_id int REFERENCES GAME_OF_JOINS.Localidad(localidad_id),
	repartidor_nombre nvarchar(255) NULL,
	repartidor_apellido nvarchar(255) NULL,
	repartidor_direccion nvarchar(255) NULL,
	repartidor_telefono decimal(18,0) NULL,
	repartidor_mail nvarchar(255),
	repartidor_fecha_nacimiento date NULL
);

CREATE TABLE GAME_OF_JOINS.Tarjeta(
	tarjeta_id int IDENTITY PRIMARY KEY NOT NULL,
	tarjeta_nro nvarchar(100) NULL,
	tarjeta_marca nvarchar(100) NULL
);

CREATE TABLE GAME_OF_JOINS.Paquete(
	paquete_id int IDENTITY PRIMARY KEY,
	paquete_tipo nvarchar(50) NULL,
	paquete_alto_max decimal(18,2) NULL,
	paquete_ancho_max decimal(18,2) NULL,
	paquete_largo_max decimal(18,2) NULL,
	paquete_peso_max decimal(18,2) NULL,
	paquete_tipo_precio decimal(18,2) NULL
);

CREATE TABLE GAME_OF_JOINS.TipoMedioDePago(
	tipo_medio_pago_id int IDENTITY PRIMARY KEY,
	tipo_medio_pago nvarchar(50) NULL,
);

CREATE TABLE GAME_OF_JOINS.MedioDePago(
	medio_pago_id int IDENTITY PRIMARY KEY,
	medio_pago_usuario decimal(18,0) REFERENCES GAME_OF_JOINS.Usuario(usuario_dni),
	tipo_medio_pago_id int REFERENCES GAME_OF_JOINS.TipoMedioDePago(tipo_medio_pago_id),
	medio_pago_tarjeta_id int REFERENCES GAME_OF_JOINS.Tarjeta(tarjeta_id) NULL
);

CREATE TABLE GAME_OF_JOINS.ServicioMensajeria(
	servicio_mensajeria_nro int IDENTITY PRIMARY KEY,
	servicio_mensajeria_usuario decimal(18,0) REFERENCES GAME_OF_JOINS.Usuario(usuario_dni),
	servicio_mensajeria_repartidor decimal(18,0) REFERENCES GAME_OF_JOINS.Repartidor(repartidor_dni),
	servicio_mensajeria_fecha_solicitud datetime2(3) NULL,
	servicio_mensajeria_fecha_finalizacion datetime2(3),
	servicio_mensajeria_estado_id int REFERENCES GAME_OF_JOINS.EstadoEnvio(estado_envio_id),
	servicio_mensajeria_direccion_origen nvarchar(255) NULL,
	servicio_mensajeria_direccion_destino nvarchar(255) NULL,
	servicio_mensajeria_localidad int REFERENCES GAME_OF_JOINS.localidad(localidad_id),
	servicio_mensajeria_provincia int REFERENCES GAME_OF_JOINS.Provincia(provincia_id),
	servicio_mensajeria_distancia decimal(18,2) NULL,
	servicio_mensajeria_tiempo_estimado decimal(18,2) NULL,
	servicio_mensajeria_paquete int REFERENCES GAME_OF_JOINS.Paquete(paquete_id),
	servicio_mensajeria_valor_asegurado decimal(18,2),
	servicio_mensajeria_valor_seguro decimal(18,2),
	servicio_mensajeria_precio decimal(18,2) NULL,
	servicio_mensajeria_propina decimal(18,2) NULL,
	servicio_mensajeria_total decimal(18,2) NULL,
	servicio_mensajeria_medio_pago int REFERENCES GAME_OF_JOINS.MedioDePago(medio_pago_id),
	servicio_mensajeria_calificacion decimal(18,0) NULL,
	servicio_mensajeria_observaciones nvarchar(255) NULL
);


CREATE TABLE GAME_OF_JOINS.DireccionLocal(
	direccion_local_id int IDENTITY PRIMARY KEY NOT NULL,
	direccion_local_direccion nvarchar(255) NULL,
	direccion_local_localidad_id int REFERENCES GAME_OF_JOINS.localidad(localidad_id),
	direccion_local_provincia_id int REFERENCES GAME_OF_JOINS.Provincia(provincia_id)
);

CREATE TABLE GAME_OF_JOINS.LocalRegistrado(
	local_id int IDENTITY PRIMARY KEY,
	local_nombre nvarchar(100) NULL,
	local_tipo_id int REFERENCES GAME_OF_JOINS.LocalTipo(local_tipo_id),
	local_direccion_id int REFERENCES GAME_OF_JOINS.DireccionLocal(direccion_local_id),
	local_descripcion nvarchar(255) NULL
);

CREATE TABLE GAME_OF_JOINS.AtencionLocal(
	atencion_id int IDENTITY NOT NULL PRIMARY KEY,
	atencion_local_id int REFERENCES GAME_OF_JOINS.LocalRegistrado(local_id),
	atencion_dia nvarchar(50) NULL,
	atencion_horario_apertura decimal(18,0) NULL,
	atencion_horario_cierre decimal(18,0) NULL
);

CREATE TABLE GAME_OF_JOINS.ProductoLocal(
	producto_codigo nvarchar(50) PRIMARY KEY NOT NULL,
	producto_nombre nvarchar(50) NULL,
	producto_descripcion nvarchar(255) NULL,
	producto_local int REFERENCES GAME_OF_JOINS.LocalRegistrado(local_id) NOT NULL,
	producto_cantidad decimal(18,0),
	producto_precio_unitario decimal(18,2)
);

CREATE TABLE GAME_OF_JOINS.DireccionUsuario(
	direccion_usuario_id decimal(18,0) IDENTITY PRIMARY KEY NOT NULL,
	direccion_usuario_usuario decimal(18,0) REFERENCES GAME_OF_JOINS.Usuario(usuario_dni),
	direccion_usuario_nombre nvarchar(50) NULL,
	direccion_usuario_direccion nvarchar(255) NULL,
	direccion_usuario_localidad int REFERENCES GAME_OF_JOINS.Localidad(localidad_id),
	direccion_usuario_provincia_id int REFERENCES GAME_OF_JOINS.Provincia(provincia_id)
);

CREATE TABLE GAME_OF_JOINS.OperadorReclamo(
	operador_id int IDENTITY(1,1) PRIMARY KEY,
	operador_dni decimal(18,0) NOT NULL, 
	operador_nombre nvarchar(255) NULL,
	operador_apellido nvarchar(255) NULL,
	operador_telefono decimal(18,0) NULL,
	operador_direccion nvarchar(255) NULL,
	operador_mail Nvarchar(255) NULL,
	operador_fecha_nacimiento date NULL
);

CREATE TABLE GAME_OF_JOINS.Pedido(
 	pedido_nro decimal(18,0) IDENTITY PRIMARY KEY,
	pedido_usuario_dni decimal(18,0) REFERENCES GAME_OF_JOINS.Usuario(usuario_dni),
	pedido_local_id int REFERENCES GAME_OF_JOINS.LocalRegistrado(local_id),
	pedido_repartidor_dni decimal(18,0) REFERENCES GAME_OF_JOINS.Repartidor(repartidor_dni), 
	pedido_medio_pago_id int REFERENCES GAME_OF_JOINS.MedioDePago(medio_pago_id),
	pedido_direccion_usuario_id decimal(18,0) REFERENCES GAME_OF_JOINS.DireccionUsuario(direccion_usuario_id),
	pedido_fecha_hora datetime2(3) NULL,
	pedido_total_productos decimal(18,0),
	pedido_total_cupones decimal(18,0),
	pedido_tarifa decimal(18,0),
	pedido_propina decimal(18,0),
	pedido_total_servicio decimal(18,2) NULL,
	pedido_tiempo_entrega_estimada int NULL,
	pedido_fecha_hora_entrega datetime2(3) NULL,
	pedido_estado_id int REFERENCES GAME_OF_JOINS.EstadoPedido(estado_pedido_id),
	pedido_calificacion decimal(18,0) NULL,
	pedido_observaciones nvarchar(255) NULL
);

CREATE TABLE GAME_OF_JOINS.Reclamo(
	reclamo_nro decimal(18,0) PRIMARY KEY,
	reclamo_pedido decimal(18,0) REFERENCES GAME_OF_JOINS.Pedido(pedido_nro),
	reclamo_usuario decimal(18,0) REFERENCES GAME_OF_JOINS.Usuario(usuario_dni),
	reclamo_tipo nvarchar(50) NULL,
	reclamo_descripcion nvarchar(255) NULL,
	reclamo_fecha_hora_creacion datetime2(3) NULL,
	reclamo_operador int REFERENCES GAME_OF_JOINS.OperadorReclamo(operador_id),
	reclamo_estado int REFERENCES GAME_OF_JOINS.EstadoReclamo(estado_reclamo_id),
	reclamo_solucion nvarchar(255) NULL,
	reclamo_fecha_hora_solucion datetime2(3) NULL,
	reclamo_calificacion decimal(18,0) NULL
);

CREATE TABLE GAME_OF_JOINS.TipoCupon(
	tipo_cupon_id int IDENTITY PRIMARY KEY,
	tipo_cupon nvarchar(50)
);

CREATE TABLE GAME_OF_JOINS.Cupon(
	cupon_nro decimal(18,0) IDENTITY PRIMARY KEY,
	cupon_usuario decimal(18,0) REFERENCES GAME_OF_JOINS.Usuario(usuario_dni),
	cupon_tipo_id int REFERENCES GAME_OF_JOINS.TipoCupon(tipo_cupon_id),
	cupon_monto_descuento decimal(18,2) NULL,
	cupon_fecha_alta datetime2(3) NULL,
	cupon_fecha_vencimiento datetime2(3) NULL
);

CREATE TABLE GAME_OF_JOINS.CuponPedido(
	cupon_pedido_id decimal(18,0) REFERENCES GAME_OF_JOINS.Cupon(cupon_nro) PRIMARY KEY,
	cupon_pedido_pedido decimal(18,0) REFERENCES GAME_OF_JOINS.Pedido(pedido_nro)
);

CREATE TABLE GAME_OF_JOINS.CuponReclamo(
	cupon_nro decimal(18,0) REFERENCES GAME_OF_JOINS.Cupon(cupon_nro),
	reclamo_nro decimal(18,0) REFERENCES GAME_OF_JOINS.Reclamo(reclamo_nro),
	PRIMARY KEY(cupon_nro,reclamo_nro)
);
GO

------------------------------------------------------------------ STORED PROCEDURES PARA MIGRACION

CREATE PROCEDURE GAME_OF_JOINS.migrar_categoria
AS
	BEGIN
		INSERT INTO GAME_OF_JOINS.Categoria(categoria)
		SELECT TOP 1 'CATEGORIA1'
		FROM [GD1C2023].[gd_esquema].[Maestra]
	END
GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_tipo_reclamo
AS
	BEGIN
		INSERT INTO GAME_OF_JOINS.TipoReclamo(tipo_reclamo)
		SELECT DISTINCT M.RECLAMO_TIPO
		FROM [GD1C2023].[gd_esquema].[Maestra] AS M
		WHERE M.RECLAMO_NRO IS NOT NULL
	END
GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_local_tipo
AS
	BEGIN
		INSERT INTO GAME_OF_JOINS.LocalTipo(local_tipo)
		SELECT DISTINCT M.LOCAL_TIPO
		FROM [GD1C2023].[gd_esquema].[Maestra] AS M
		WHERE M.LOCAL_TIPO IS NOT NULL
	END
GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_movilidad
AS
	BEGIN
		INSERT INTO GAME_OF_JOINS.movilidad(movilidad)
		SELECT DISTINCT M.REPARTIDOR_TIPO_MOVILIDAD
		FROM [GD1C2023].[gd_esquema].[Maestra] AS M
		WHERE M.REPARTIDOR_TIPO_MOVILIDAD IS NOT NULL
	END
GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_localidad
AS
	BEGIN
		INSERT INTO GAME_OF_JOINS.Localidad(LOCALIDAD)
		SELECT DISTINCT M.LOCAL_LOCALIDAD
		FROM [GD1C2023].[gd_esquema].[Maestra] AS M
		WHERE M.LOCAL_LOCALIDAD IS NOT NULL
		UNION
		SELECT DISTINCT M.ENVIO_MENSAJERIA_LOCALIDAD
		FROM [GD1C2023].[gd_esquema].[Maestra] AS M
		WHERE M.ENVIO_MENSAJERIA_LOCALIDAD IS NOT NULL
		UNION
		SELECT DISTINCT M.DIRECCION_USUARIO_LOCALIDAD
		FROM[GD1C2023].[gd_esquema].[Maestra] AS M
		WHERE M.DIRECCION_USUARIO_LOCALIDAD IS NOT NULL
	END
GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_usuario
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.Usuario (usuario_dni, usuario_nombre, usuario_apellido, usuario_mail, usuario_telefono, usuario_fecha_registro, usuario_fecha_nacimiento)
	SELECT distinct USUARIO_DNI, USUARIO_NOMBRE, USUARIO_APELLIDO, USUARIO_MAIL, USUARIO_TELEFONO, USUARIO_FECHA_REGISTRO, USUARIO_FECHA_NAC
	FROM [GD1C2023].[gd_esquema].[Maestra]
	WHERE (USUARIO_DNI is not null and USUARIO_NOMBRE is not null and USUARIO_APELLIDO is not null and USUARIO_MAIL is not null)
	ORDER BY USUARIO_DNI
  END
 GO


CREATE PROCEDURE GAME_OF_JOINS.migrar_repartidor
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.Repartidor 
	(repartidor_dni, repartidor_nombre, repartidor_apellido,repartidor_direccion, repartidor_telefono, repartidor_mail, repartidor_movilidad, repartidor_fecha_nacimiento)
	SELECT DISTINCT REPARTIDOR_DNI, REPARTIDOR_NOMBRE, REPARTIDOR_APELLIDO, REPARTIDOR_DIRECION, REPARTIDOR_TELEFONO, REPARTIDOR_EMAIL, m.movilidad_id, REPARTIDOR_FECHA_NAC
	FROM [GD1C2023].[gd_esquema].[Maestra] MA
	INNER JOIN GAME_OF_JOINS.Movilidad M on M.movilidad = MA.REPARTIDOR_TIPO_MOVILIDAD
	WHERE (REPARTIDOR_DNI is not null and REPARTIDOR_NOMBRE is not null and REPARTIDOR_APELLIDO is not null and REPARTIDOR_TELEFONO is not null and REPARTIDOR_EMAIL is not null and REPARTIDOR_TIPO_MOVILIDAD is not null and REPARTIDOR_FECHA_NAC is not null)
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_estado_envio
AS
	BEGIN 
		INSERT INTO GAME_OF_JOINS.EstadoEnvio(estado)
		SELECT DISTINCT M.ENVIO_MENSAJERIA_ESTADO
		FROM gd_esquema.Maestra M
			WHERE M.ENVIO_MENSAJERIA_ESTADO is not null
	END
GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_estado_reclamo
AS
	BEGIN 
		INSERT INTO GAME_OF_JOINS.EstadoReclamo(estado)
		SELECT DISTINCT M.RECLAMO_ESTADO
		FROM gd_esquema.Maestra M
			WHERE M.RECLAMO_NRO is not null
	END
GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_estado_pedido
AS
	BEGIN 
		INSERT INTO GAME_OF_JOINS.EstadoPedido(estado)
		SELECT DISTINCT M.PEDIDO_ESTADO
		FROM gd_esquema.Maestra M
			WHERE M.PEDIDO_ESTADO is not null
	END
GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_paquete
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.Paquete
	(paquete_tipo, paquete_alto_max, paquete_ancho_max, paquete_largo_max, paquete_peso_max, paquete_tipo_precio)
	SELECT DISTINCT PAQUETE_TIPO, PAQUETE_ALTO_MAX, PAQUETE_ANCHO_MAX, PAQUETE_LARGO_MAX, PAQUETE_PESO_MAX, PAQUETE_TIPO_PRECIO 
	FROM [GD1C2023].[gd_esquema].[Maestra]
	WHERE PAQUETE_TIPO IS NOT NULL
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_tarjeta
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.Tarjeta
	(tarjeta_nro, tarjeta_marca)
	SELECT DISTINCT MEDIO_PAGO_NRO_TARJETA, MARCA_TARJETA 
	FROM [GD1C2023].[gd_esquema].[Maestra]
	WHERE MEDIO_PAGO_NRO_TARJETA IS NOT NULL
	AND MEDIO_PAGO_TIPO != 'Efectivo'
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_tipo_medio_pago
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.TipoMedioDePago
	(tipo_medio_pago)
	SELECT DISTINCT MEDIO_PAGO_TIPO
	FROM [GD1C2023].[gd_esquema].[Maestra] AS M
	WHERE M.MEDIO_PAGO_TIPO IS NOT NULL
  END
 GO

 CREATE PROCEDURE GAME_OF_JOINS.migrar_medio_pago
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.MedioDePago
	(medio_pago_usuario, tipo_medio_pago_id, medio_pago_tarjeta_id)
	SELECT DISTINCT U.usuario_dni, (SELECT tipo_medio_pago_id FROM GAME_OF_JOINS.TipoMedioDePago WHERE tipo_medio_pago = M.MEDIO_PAGO_TIPO), 
	CASE WHEN MEDIO_PAGO_TIPO != 'Efectivo' THEN T.tarjeta_id ELSE NULL END
	FROM [GD1C2023].[gd_esquema].[Maestra] AS M
	INNER JOIN GAME_OF_JOINS.Usuario U ON M.USUARIO_DNI = U.usuario_dni
	LEFT JOIN GAME_OF_JOINS.Tarjeta T ON M.MEDIO_PAGO_NRO_TARJETA = T.tarjeta_nro
	WHERE M.MEDIO_PAGO_TIPO IS NOT NULL
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_operador_reclamo
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.OperadorReclamo
	(operador_dni, operador_nombre, operador_apellido, operador_telefono, operador_direccion, operador_mail, operador_fecha_nacimiento)
	SELECT DISTINCT OPERADOR_RECLAMO_DNI, OPERADOR_RECLAMO_NOMBRE, OPERADOR_RECLAMO_APELLIDO, OPERADOR_RECLAMO_TELEFONO, OPERADOR_RECLAMO_DIRECCION, OPERADOR_RECLAMO_MAIL, OPERADOR_RECLAMO_FECHA_NAC
	FROM [GD1C2023].[gd_esquema].[Maestra]
	WHERE OPERADOR_RECLAMO_DNI IS NOT NULL
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_tipo_cupon
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.TipoCupon
	(tipo_cupon)
	SELECT DISTINCT CUPON_TIPO
	FROM [GD1C2023].[gd_esquema].[Maestra] AS M
	WHERE M.CUPON_NRO IS NOT NULL
	UNION
	SELECT DISTINCT CUPON_RECLAMO_TIPO
	FROM [GD1C2023].[gd_esquema].[Maestra] AS M
	WHERE M.CUPON_RECLAMO_NRO IS NOT NULL
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_cupon
 AS
  BEGIN

  SET IDENTITY_INSERT GAME_OF_JOINS.Cupon ON;
    
    INSERT INTO GAME_OF_JOINS.Cupon
    (cupon_nro, cupon_usuario, cupon_tipo_id, cupon_monto_descuento, cupon_fecha_alta, cupon_fecha_vencimiento)
    SELECT cupon_nro, cupon_usuario, cupon_tipo_id, cupon_monto_descuento, cupon_fecha_alta, cupon_fecha_vencimiento
    FROM (
        SELECT CUPON_NRO, U.usuario_dni AS cupon_usuario, TC.tipo_cupon_id AS cupon_tipo_id,
            CUPON_MONTO AS cupon_monto_descuento, CUPON_FECHA_ALTA, CUPON_FECHA_VENCIMIENTO,
            ROW_NUMBER() OVER (PARTITION BY CUPON_NRO ORDER BY (SELECT NULL)) AS row_num
        FROM [GD1C2023].[gd_esquema].[Maestra] M
        INNER JOIN GAME_OF_JOINS.Usuario U ON M.USUARIO_DNI = U.usuario_dni
        INNER JOIN GAME_OF_JOINS.TipoCupon TC ON M.CUPON_TIPO = TC.tipo_cupon
        WHERE CUPON_NRO IS NOT NULL
    ) AS subquery
    WHERE row_num = 1
    AND cupon_nro NOT IN (SELECT cupon_nro FROM GAME_OF_JOINS.Cupon);

    INSERT INTO GAME_OF_JOINS.Cupon
    (cupon_nro, cupon_usuario, cupon_tipo_id, cupon_monto_descuento, cupon_fecha_alta, cupon_fecha_vencimiento)
    SELECT CUPON_RECLAMO_NRO, cupon_usuario, cupon_tipo_id, cupon_monto_descuento, CUPON_RECLAMO_FECHA_ALTA, CUPON_RECLAMO_FECHA_VENCIMIENTO
    FROM (
        SELECT CUPON_RECLAMO_NRO, U.usuario_dni AS cupon_usuario, TC.tipo_cupon_id AS cupon_tipo_id,
            CUPON_RECLAMO_MONTO AS cupon_monto_descuento, CUPON_RECLAMO_FECHA_ALTA, CUPON_RECLAMO_FECHA_VENCIMIENTO,
            ROW_NUMBER() OVER (PARTITION BY CUPON_RECLAMO_NRO ORDER BY (SELECT NULL)) AS row_num
        FROM [GD1C2023].[gd_esquema].[Maestra] M
        INNER JOIN GAME_OF_JOINS.Usuario U ON M.USUARIO_DNI = U.usuario_dni
        INNER JOIN GAME_OF_JOINS.TipoCupon TC ON M.CUPON_RECLAMO_TIPO = TC.tipo_cupon
        WHERE CUPON_RECLAMO_NRO IS NOT NULL
    ) AS subquery
    WHERE row_num = 1
    AND CUPON_RECLAMO_NRO NOT IN (SELECT cupon_nro FROM GAME_OF_JOINS.Cupon);

	SET IDENTITY_INSERT GAME_OF_JOINS.Cupon OFF;
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_reclamo
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.Reclamo
	(reclamo_nro, reclamo_pedido, reclamo_usuario, reclamo_tipo, reclamo_descripcion, reclamo_fecha_hora_creacion, reclamo_operador, reclamo_estado, reclamo_solucion, reclamo_fecha_hora_solucion, reclamo_calificacion)
	SELECT DISTINCT RECLAMO_NRO, p.pedido_nro, u.usuario_dni, TR.tipo_reclamo_id, RECLAMO_DESCRIPCION, RECLAMO_FECHA, o.operador_id, e.estado_reclamo_id, RECLAMO_SOLUCION, RECLAMO_FECHA_SOLUCION, RECLAMO_CALIFICACION
	FROM [GD1C2023].[gd_esquema].[Maestra] a
	inner join GAME_OF_JOINS.TipoReclamo TR ON TR.tipo_reclamo = RECLAMO_TIPO
	inner join GAME_OF_JOINS.Pedido p on p.pedido_nro = a.PEDIDO_NRO
	inner join GAME_OF_JOINS.Usuario u on u.usuario_dni = a.USUARIO_DNI
	inner join GAME_OF_JOINS.OperadorReclamo o on o.operador_dni = a.OPERADOR_RECLAMO_DNI AND o.operador_nombre = a.OPERADOR_RECLAMO_NOMBRE AND o.operador_apellido = a.OPERADOR_RECLAMO_APELLIDO
	inner join GAME_OF_JOINS.EstadoReclamo e on e.estado = a.RECLAMO_ESTADO
	WHERE RECLAMO_NRO IS NOT NULL
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_cupon_reclamo
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.CuponReclamo
	(cupon_nro, reclamo_nro)
	SELECT C.cupon_nro, R.reclamo_nro
	FROM [GD1C2023].[gd_esquema].[Maestra] M
	INNER JOIN GAME_OF_JOINS.Cupon C
	ON M.CUPON_RECLAMO_NRO = C.cupon_nro
	INNER JOIN GAME_OF_JOINS.Reclamo R
	ON M.RECLAMO_NRO = R.reclamo_nro 
	AND R.reclamo_usuario = C.cupon_usuario
	WHERE CUPON_RECLAMO_NRO IS NOT NULL
  END
 GO

 CREATE PROCEDURE GAME_OF_JOINS.migrar_direccion_local
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.DireccionLocal
	(direccion_local_direccion, direccion_local_localidad_id, direccion_local_provincia_id)
	SELECT distinct LOCAL_DIRECCION, localidad_id , P.provincia_id
	FROM [GD1C2023].[gd_esquema].[Maestra] M
	INNER JOIN GAME_OF_JOINS.localidad L
	ON L.localidad = M.LOCAL_LOCALIDAD
	INNER JOIN GAME_OF_JOINS.Provincia P
	ON M.LOCAL_PROVINCIA = P.provincia
	WHERE LOCAL_DIRECCION IS NOT NULL
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_local
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.LocalRegistrado
	(local_nombre, local_tipo_id, local_direccion_id, local_descripcion)
	SELECT DISTINCT LOCAL_NOMBRE,
	LT.local_tipo_id,
	DL.direccion_local_id,
	LOCAL_DESCRIPCION
	FROM [GD1C2023].[gd_esquema].[Maestra] M
	INNER JOIN GAME_OF_JOINS.DireccionLocal DL ON DL.direccion_local_direccion = M.LOCAL_DIRECCION
	INNER JOIN GAME_OF_JOINS.LocalTipo LT ON M.LOCAL_TIPO = LT.local_tipo
	WHERE LOCAL_NOMBRE IS NOT NULL
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_atencion_local
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.AtencionLocal
	(atencion_local_id, atencion_dia, atencion_horario_apertura, atencion_horario_cierre)
	SELECT DISTINCT L.local_id, HORARIO_LOCAL_DIA, HORARIO_LOCAL_HORA_APERTURA, HORARIO_LOCAL_HORA_CIERRE
	FROM [GD1C2023].[gd_esquema].[Maestra] M 
	INNER JOIN GAME_OF_JOINS.LocalRegistrado L 
	ON M.LOCAL_NOMBRE = L.local_nombre
	WHERE HORARIO_LOCAL_DIA IS NOT NULL
  END 
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_producto_local
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.ProductoLocal
	(producto_codigo, producto_nombre, producto_descripcion, producto_local, producto_cantidad, producto_precio_unitario)
	SELECT DISTINCT PRODUCTO_LOCAL_CODIGO, PRODUCTO_LOCAL_NOMBRE, PRODUCTO_LOCAL_DESCRIPCION, l.local_id, PRODUCTO_CANTIDAD, PRODUCTO_LOCAL_PRECIO
	FROM [GD1C2023].[gd_esquema].[Maestra] a 
	inner join GAME_OF_JOINS.LocalRegistrado l on l.local_nombre = a.LOCAL_NOMBRE
	WHERE PRODUCTO_LOCAL_CODIGO IS NOT NULL and PRODUCTO_LOCAL_NOMBRE is not null and PRODUCTO_LOCAL_DESCRIPCION is not null and PRODUCTO_CANTIDAD is not null and PRODUCTO_LOCAL_PRECIO is not null
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_direccion_usuario
 AS
  BEGIN
	INSERT INTO GAME_OF_JOINS.DireccionUsuario
	(direccion_usuario_usuario, direccion_usuario_nombre, direccion_usuario_direccion, direccion_usuario_localidad, direccion_usuario_provincia_id)
	SELECT DISTINCT U.usuario_dni, M.DIRECCION_USUARIO_NOMBRE, M.DIRECCION_USUARIO_DIRECCION, L.localidad_id, P.provincia_id 
	FROM [GD1C2023].[gd_esquema].[Maestra] M
	INNER JOIN GAME_OF_JOINS.Usuario U ON M.USUARIO_DNI = U.usuario_dni
	INNER JOIN GAME_OF_JOINS.Localidad L ON M.DIRECCION_USUARIO_LOCALIDAD = L.localidad
	INNER JOIN GAME_OF_JOINS.Provincia P ON M.DIRECCION_USUARIO_PROVINCIA = P.provincia
	WHERE DIRECCION_USUARIO_NOMBRE IS NOT NULL
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_pedido
 AS
  BEGIN
	SET IDENTITY_INSERT GAME_OF_JOINS.Pedido ON;

	INSERT INTO GAME_OF_JOINS.Pedido
	(pedido_nro, pedido_usuario_dni, pedido_local_id, pedido_repartidor_dni, pedido_medio_pago_id, pedido_direccion_usuario_id, pedido_fecha_hora, pedido_total_productos, pedido_total_cupones, pedido_tarifa, pedido_propina, pedido_total_servicio, pedido_tiempo_entrega_estimada, pedido_fecha_hora_entrega, pedido_estado_id, pedido_calificacion, pedido_observaciones)
	SELECT DISTINCT M.PEDIDO_NRO, 
	U.usuario_dni, 
	L.local_id,
	R.repartidor_dni,
	MP.medio_pago_id,
	DU.direccion_usuario_id,
	M.PEDIDO_FECHA,
	M.PEDIDO_TOTAL_PRODUCTOS,
	M.PEDIDO_TOTAL_CUPONES,
	M.PEDIDO_TARIFA_SERVICIO,
	M.PEDIDO_PROPINA,
	M.PEDIDO_TOTAL_SERVICIO,
	M.PEDIDO_TIEMPO_ESTIMADO_ENTREGA,
	M.PEDIDO_FECHA_ENTREGA,
	E.estado_pedido_id,
	M.PEDIDO_CALIFICACION,
	M.PEDIDO_OBSERV
	FROM [GD1C2023].[gd_esquema].[Maestra] M
	INNER JOIN GAME_OF_JOINS.EstadoPedido E ON M.PEDIDO_ESTADO = E.estado
	INNER JOIN GAME_OF_JOINS.Usuario U ON M.USUARIO_DNI = U.usuario_dni
	INNER JOIN GAME_OF_JOINS.TipoMedioDePago TMP ON M.MEDIO_PAGO_TIPO = TMP.tipo_medio_pago
	INNER JOIN GAME_OF_JOINS.MedioDePago MP ON TMP.tipo_medio_pago_id = MP.tipo_medio_pago_id AND MP.medio_pago_usuario = U.usuario_dni
	INNER JOIN GAME_OF_JOINS.LocalRegistrado L ON M.LOCAL_NOMBRE = L.local_nombre
	INNER JOIN GAME_OF_JOINS.Repartidor R ON M.REPARTIDOR_DNI = R.repartidor_dni
	INNER JOIN GAME_OF_JOINS.DireccionUsuario DU ON M.DIRECCION_USUARIO_DIRECCION = DU.direccion_usuario_direccion AND U.usuario_dni = DU.direccion_usuario_usuario
	WHERE M.PEDIDO_NRO IS NOT NULL

	SET IDENTITY_INSERT GAME_OF_JOINS.Pedido OFF;
  END
 GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_provincia
AS
	BEGIN
		INSERT INTO GAME_OF_JOINS.Provincia(provincia)
		SELECT DISTINCT DIRECCION_USUARIO_PROVINCIA
		FROM [GD1C2023].[gd_esquema].[Maestra] AS M
		WHERE M.DIRECCION_USUARIO_PROVINCIA IS NOT NULL
		UNION
		SELECT DISTINCT M.ENVIO_MENSAJERIA_PROVINCIA
		FROM [GD1C2023].[gd_esquema].[Maestra] AS M
		WHERE M.ENVIO_MENSAJERIA_PROVINCIA IS NOT NULL
		UNION
		SELECT DISTINCT M.LOCAL_PROVINCIA
		FROM[GD1C2023].[gd_esquema].[Maestra] AS M
		WHERE M.LOCAL_PROVINCIA IS NOT NULL
	END
GO

CREATE PROCEDURE GAME_OF_JOINS.migrar_servicio_mensajeria
 AS
  BEGIN
	SET IDENTITY_INSERT GAME_OF_JOINS.ServicioMensajeria ON;
	INSERT INTO GAME_OF_JOINS.ServicioMensajeria
	(servicio_mensajeria_nro,
	servicio_mensajeria_usuario,
	servicio_mensajeria_repartidor,
	servicio_mensajeria_fecha_solicitud,
	servicio_mensajeria_fecha_finalizacion,
	servicio_mensajeria_estado_id,
	servicio_mensajeria_direccion_origen,
	servicio_mensajeria_direccion_destino,
	servicio_mensajeria_localidad,
	servicio_mensajeria_provincia,
	servicio_mensajeria_distancia,
	servicio_mensajeria_tiempo_estimado,
	servicio_mensajeria_paquete,
	servicio_mensajeria_valor_asegurado,
	servicio_mensajeria_valor_seguro,
	servicio_mensajeria_precio,
	servicio_mensajeria_propina,
	servicio_mensajeria_total,
	servicio_mensajeria_medio_pago,
	servicio_mensajeria_calificacion,
	servicio_mensajeria_observaciones)
	SELECT ENVIO_MENSAJERIA_NRO, U.usuario_dni, R.repartidor_dni, ENVIO_MENSAJERIA_FECHA, ENVIO_MENSAJERIA_FECHA_ENTREGA, EE.estado_envio_id, ENVIO_MENSAJERIA_DIR_ORIG, ENVIO_MENSAJERIA_DIR_DEST, 
	L.localidad_id, PR.provincia_id, ENVIO_MENSAJERIA_KM, ENVIO_MENSAJERIA_TIEMPO_ESTIMADO, P.paquete_id, ENVIO_MENSAJERIA_VALOR_ASEGURADO, ENVIO_MENSAJERIA_PRECIO_SEGURO, ENVIO_MENSAJERIA_PRECIO_ENVIO, ENVIO_MENSAJERIA_PROPINA,
	ENVIO_MENSAJERIA_TOTAL, MP.medio_pago_id, ENVIO_MENSAJERIA_CALIFICACION, ENVIO_MENSAJERIA_OBSERV
	FROM [GD1C2023].[gd_esquema].[Maestra] M
	INNER JOIN GAME_OF_JOINS.Usuario U ON U.usuario_dni = M.USUARIO_DNI
	INNER JOIN GAME_OF_JOINS.Repartidor R ON R.repartidor_dni = M.REPARTIDOR_DNI
	INNER JOIN GAME_OF_JOINS.Paquete P ON P.paquete_tipo = M.PAQUETE_TIPO AND P.paquete_tipo_precio = M.PAQUETE_TIPO_PRECIO
	INNER JOIN GAME_OF_JOINS.Localidad L ON L.localidad = M.ENVIO_MENSAJERIA_LOCALIDAD
	INNER JOIN GAME_OF_JOINS.provincia PR ON PR.provincia = M.ENVIO_MENSAJERIA_PROVINCIA
	INNER JOIN GAME_OF_JOINS.EstadoEnvio EE ON EE.estado = M.ENVIO_MENSAJERIA_ESTADO
	INNER JOIN GAME_OF_JOINS.TipoMedioDePago TMP ON TMP.tipo_medio_pago = M.MEDIO_PAGO_TIPO
	INNER JOIN GAME_OF_JOINS.MedioDePago MP ON MP.medio_pago_usuario = U.usuario_dni AND MP.tipo_medio_pago_id = TMP.tipo_medio_pago_id --( (MP.tipo_medio_pago_id = TMP.tipo_medio_pago_id AND M.MEDIO_PAGO_NRO_TARJETA IS NULL)
	WHERE ENVIO_MENSAJERIA_NRO is not null
	SET IDENTITY_INSERT GAME_OF_JOINS.ServicioMensajeria OFF;
  END
 GO

EXEC GAME_OF_JOINS.migrar_tipo_reclamo
EXEC GAME_OF_JOINS.migrar_provincia
EXEC GAME_OF_JOINS.migrar_paquete
EXEC GAME_OF_JOINS.migrar_localidad
EXEC GAME_OF_JOINS.migrar_categoria
EXEC GAME_OF_JOINS.migrar_tipo_cupon
EXEC GAME_OF_JOINS.migrar_local_tipo
EXEC GAME_OF_JOINS.migrar_movilidad
EXEC GAME_OF_JOINS.migrar_estado_pedido
EXEC GAME_OF_JOINS.migrar_estado_envio
EXEC GAME_OF_JOINS.migrar_estado_reclamo
EXEC GAME_OF_JOINS.migrar_direccion_local
EXEC GAME_OF_JOINS.migrar_local
EXEC GAME_OF_JOINS.migrar_atencion_local
EXEC GAME_OF_JOINS.migrar_tarjeta
EXEC GAME_OF_JOINS.migrar_usuario 
EXEC GAME_OF_JOINS.migrar_direccion_usuario
EXEC GAME_OF_JOINS.migrar_tipo_medio_pago
EXEC GAME_OF_JOINS.migrar_medio_pago
EXEC GAME_OF_JOINS.migrar_cupon
EXEC GAME_OF_JOINS.migrar_operador_reclamo
EXEC GAME_OF_JOINS.migrar_producto_local
EXEC GAME_OF_JOINS.migrar_repartidor
EXEC GAME_OF_JOINS.migrar_pedido
EXEC GAME_OF_JOINS.migrar_reclamo 
EXEC GAME_OF_JOINS.migrar_cupon_reclamo
EXEC GAME_OF_JOINS.migrar_servicio_mensajeria
