-- Creación Base de Datos
CREATE DATABASE prueba;

\c prueba

-- Creación de Tablas y llaves correspondientes
CREATE TABLE clientes(id SERIAL, rut VARCHAR(20), nombre VARCHAR(20),direccion VARCHAR(20));

CREATE TABLE facturas(id SERIAL, num_factura SMALLINT,fecha DATE, subtotal INT, iva INT, total INT, cliente_id SMALLINT);

CREATE TABLE productos(id SERIAL, nombre_producto VARCHAR(20), descripcion VARCHAR(100), valor_unitario INT, categoria_id SMALLINT);

CREATE TABLE categorias(id SERIAL, nombre_categoria VARCHAR (20), descripcion VARCHAR (100));

CREATE TABLE facturas_productos(id SERIAL, num_factura SMALLINT, producto_id SMALLINT, cantidad_productos SMALLINT);

ALTER TABLE clientes ADD PRIMARY KEY (id);

ALTER TABLE facturas ADD PRIMARY KEY (num_factura);

ALTER TABLE facturas ADD FOREIGN KEY (cliente_id) REFERENCES clientes(id);

ALTER TABLE productos ADD PRIMARY KEY (id);

ALTER TABLE categorias ADD PRIMARY KEY (id);

ALTER TABLE productos ADD FOREIGN KEY (categoria_id) REFERENCES categorias(id);

ALTER TABLE facturas_productos ADD PRIMARY KEY (id);

ALTER TABLE facturas_productos ADD FOREIGN KEY (num_factura) REFERENCES facturas(num_factura);

ALTER TABLE facturas_productos ADD FOREIGN KEY (producto_id) REFERENCES productos(id);

-- Poblar tablas
        -- 5 clientes
INSERT INTO clientes(rut, nombre, direccion) VALUES('172939058', 'Mike Portnoy', 'Chicago 123');
INSERT INTO clientes(rut, nombre, direccion) VALUES('173039058', 'Jordan Rudes', 'Los Angeles 345');
INSERT INTO clientes(rut, nombre, direccion) VALUES('205678905', 'Miles Kennedy', 'New York 123');
INSERT INTO clientes(rut, nombre, direccion) VALUES('215678305', 'Misha Mansoor', 'Detroit 346');
INSERT INTO clientes(rut, nombre, direccion) VALUES('225633305', 'Paul David', 'San Francisco 222');
    
        -- 3 Categorías
INSERT INTO categorias(nombre_categoria, descripcion) VALUES('tecnología', 'todo lo relacionado a lo último en tecnología');
INSERT INTO categorias(nombre_categoria, descripcion) VALUES('deporte', 'todo lo relacionado a lo último en deporte');
INSERT INTO categorias(nombre_categoria, descripcion) VALUES('muebles', 'todo lo relacionado a lo último en mueblería');
 
        -- 8 Productos 
INSERT INTO productos(nombre_producto, descripcion, valor_unitario, categoria_id) VALUES('Laptop', 'computador 8GB ram con tarjeta de video', 45000, 1);
INSERT INTO productos(nombre_producto, descripcion, valor_unitario, categoria_id) VALUES('Mouse', 'mouse inalámbrico', 5000, 1);
INSERT INTO productos(nombre_producto, descripcion, valor_unitario, categoria_id) VALUES('Teclado', 'teclado inalámbrico', 10000, 1);
INSERT INTO productos(nombre_producto, descripcion, valor_unitario, categoria_id) VALUES('Pelota', 'pelota de futbol playa', 4600, 2);
INSERT INTO productos(nombre_producto, descripcion, valor_unitario, categoria_id) VALUES('Raqueta', 'raqueta tenis de salón', 11000, 2);
INSERT INTO productos(nombre_producto, descripcion, valor_unitario, categoria_id) VALUES('Shorts', 'shorts tipo cazzelly', 12000, 2);
INSERT INTO productos(nombre_producto, descripcion, valor_unitario, categoria_id) VALUES('Silla', 'silla de escritorio', 40000, 3);
INSERT INTO productos(nombre_producto, descripcion, valor_unitario, categoria_id) VALUES('Mesa', 'mesa renacentista', 35000, 3);


-- 10 facturas
--2 para el cliente 1, con 2 y 3 productos
--3 para el cliente 2, con 3, 2 y 3 productos
--1 para el cliente 3, con 1 producto
--4 para el cliente 4, con 2, 3, 4 y 1 producto


--CREATE TABLE facturas_productos(id SERIAL, num_factura SMALLINT, producto_id SMALLINT, cantidad_productos SMALLINT);

--Factura 1 cliente 1 = 1 Laptop + 1 mesa = 80000 * 19 % (15200) = 95200
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(1, '2021-03-30', 80000, 15200, 95200, 1);


--Factura 2 cliente 1 = 1 Laptop + 1 mesa + 1 silla = 120000 * 19 % (22800) = 142800
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(2, '2021-03-31', 120000, 22800, 142800, 1);


--Factura 1 cliente 2 = 1 Laptop + 1 mesa + 1 pelota = 84600 * 19 % (16074) = 100674
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(3, '2021-04-01', 84600, 16074, 100674, 2);


--Factura 2 cliente 2 =  1 mesa + 1 pelota = 39600 * 19 % (7524) = 47124
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(4, '2021-04-02', 39600, 7524, 47124, 2);


--Factura 3 cliente 2 =  1 mesa + 1 pelota + 1 shorts = 51600 * 19 % (9804) = 61404
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(5, '2021-04-03', 51600, 9804, 61404, 2);


--Factura 1 cliente 3 =  1 laptop = 45000 * 19 % (8550) = 53550
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(6, '2021-04-04', 45000, 8550, 53550, 3);


--Factura 1 cliente 4 =  1 mesa + 1 shorts = 47000 * 19 % (8930) = 55930
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(7, '2021-04-05', 47000, 8930, 55930, 4);


--Factura 2 cliente 4 =  1 mesa + 1 shorts + 1 mouse = 52000 * 19 % (9880) = 61880
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(8, '2021-04-06', 52000, 9880, 61880, 4);


--Factura 3 cliente 4 =  1 mesa + 1 shorts + 1 mouse + 1 laptop= 97000 * 19 % (18430) = 115430
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(9, '2021-04-07', 97000, 18430, 115430, 4);


--Factura 4 cliente 4 = 1 teclado= 10000 * 19 % (1900) = 11900
INSERT INTO facturas (num_factura, fecha, subtotal, iva, total, cliente_id) VALUES(10, '2021-04-08', 10000, 1900, 11900, 4);



-- Entidad intermedia factura_productos
INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(1, 1, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(1, 8, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(2, 1, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(2, 8, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(2, 7, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(3, 1, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(3, 8, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(3, 4, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(4, 8, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(4, 4, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(5, 8, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(5, 4, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(5, 6, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(6, 1, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(7, 8, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(7, 6, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(8, 8, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(8, 6, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(8, 2, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(9, 8, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(9, 6, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(9, 2, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(9, 1, 1);

INSERT INTO facturas_productos(num_factura, producto_id, cantidad_productos) VALUES(10, 3, 1);


-- CONSULTAS

--¿Que cliente realizó la compra más cara?
SELECT cliente_id FROM facturas ORDER BY total DESC LIMIT 1;

--¿Que cliente pagó sobre 100 de monto? -- NOTA: asumiré que 100 = 100.000 ya que trabajé con montos en pesos
SELECT cliente_id FROM facturas WHERE total > 100000 GROUP BY cliente_id ORDER BY cliente_id;

--¿Cuantos clientes han comprado el producto 6.
SELECT COUNT(DISTINCT cliente_id) FROM facturas INNER JOIN facturas_productos ON facturas.num_factura = facturas_productos.num_factura WHERE producto_id = 6;




