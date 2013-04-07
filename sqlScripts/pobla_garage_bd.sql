INSERT INTO USUARIO VALUES
('Enrique','enrique','Enrique','Páez Martínez','henrych80@hotmail.com',1),
('Andres','andres','Andrés','Páez Martínez','paez5@hotmail.com',1),
('Diego','diego','Diego','Paez Martinez','diegoe.paez@live.com.mx',1);

INSERT INTO GARAGE (FECHA_ULTIMA_ACTUALIZACION,USUARIO) VALUES
(CURDATE(),'Enrique'),
(CURDATE(),'Andres'),
(CURDATE(),'Diego');

INSERT INTO PRODUCTO (NOMBRE,DESCRIPCION,PRECIO_VENTA,PRECIO_UNITARIO,CANTIDAD_EXISTENCIA) VALUES
('XBOX','Consola de Juegos de Microsoft',2200.00,1600.00,200),
('Playstation','Consola de Juegos de Sony',2300.00,1500.00,243),
('Wii','Consola de Juegos de Nintendo',1800.00,1200.00,47);

INSERT INTO GARAGE_X_PRODUCTO VALUES
(1,1,1,50.5,50.12,12.0,1.5),
(1,2,3,50.5,50.12,12.0,1.5),
(2,2,1,50.5,50.12,12.0,1.5),
(3,3,2,50.5,50.12,12.0,1.5);


INSERT INTO DIRECCION (CALLE,NUMERO,COLONIA,MUNICIPIO,ESTADO,CODIGO_POSTAL,USUARIO) VALUES
('Magdalena',26,'Del Valle Norte','Benito Juárez','México D.F.','02050','Enrique');

INSERT INTO FORMA_PAGO (ID_FORMA_PAGO,USUARIO,TIPO) VALUES
('76543673540','Enrique','debito');

INSERT INTO COMPRA (FECHA_COMPRA,PRECIO_TOTAL,ID_DIRECCION,USUARIO,ID_FORMA_PAGO,LIQUIDADO) VALUES
(CURDATE(),1900.00,1,'Enrique','76543673540',1);

INSERT INTO COMPRA_X_PRODUCTO VALUES
(1,1,1);
