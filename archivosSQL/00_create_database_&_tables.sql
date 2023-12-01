-- Crear la base de datos
DROP DATABASE IF EXISTS Emprendimiento_Condimento;
CREATE DATABASE IF NOT EXISTS Emprendimiento_Condimento;
USE Emprendimiento_Condimento;


-- creación de tabla categoria
CREATE TABLE Categoria
(      
    Categoria_ID INT NOT NULL,
    Nombre_Categoria VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    	PRIMARY KEY (Categoria_ID)
);

-- creación de tabla clientes
CREATE TABLE Clientes
(      
    Cliente_ID INT NOT NULL,
    Nombre_cliente VARCHAR(50) NOT NULL,
    Telefono VARCHAR (50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Provincia VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    	PRIMARY KEY (Cliente_ID)
);

-- creación de tabla empleados
CREATE TABLE Empleados
(
    Empleado_ID INT NOT NULL,
    Nombre_empleado VARCHAR(20) NOT NULL,
    Apellido VARCHAR(20) NOT NULL,
    Fecha_ingreso DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    	PRIMARY KEY(Empleado_ID)
);

-- tabla de los proveedores
CREATE TABLE Proveedores(
    Proveedor_ID INT NOT NULL,
    Nombre_proveedor VARCHAR(50) NOT NULL,
    Telefono VARCHAR(50) NOT NULL,
    Direccion VARCHAR(50) NOT NULL,
    Ciudad VARCHAR(25) NOT NULL,
    Provincia VARCHAR(25) NOT NULL,
    Email VARCHAR(30) NOT NULL,
	PRIMARY KEY (Proveedor_ID)
);

-- creando tabla productos
CREATE TABLE Productos(
    Producto_ID INT NOT NULL,
    Nombre_Producto VARCHAR(50) NOT NULL,
    Proveedor_ID INT NOT NULL,
    Categoria_ID INT NOT NULL,
    Precio FLOAT NOT NULL,
	PRIMARY KEY (PRODUCTO_ID),
	FOREIGN KEY (Categoria_ID) REFERENCES Categoria (Categoria_ID),
	FOREIGN KEY (Proveedor_ID) REFERENCES Proveedores(Proveedor_ID)
);

-- tabla con los precios
CREATE TABLE Precio(
    Precio_ID INT NOT NULL,
    Producto_ID INT NOT NULL,
    Precio_vigencia_inicial FLOAT,
    Precio_vigencia_final FLOAT,
    	PRIMARY KEY(Precio_ID),
    	FOREIGN KEY(Producto_ID) REFERENCES Productos(Producto_ID)
);

-- tabla con los métodos de pago
CREATE TABLE Metodo_Pago (
    Metodo_Pago_ID INT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(100),
    	PRIMARY KEY(Metodo_Pago_ID)
);

-- creación de la tabla pedido
CREATE TABLE Pedido(
    Pedido_ID INT NOT NULL,
    Cliente_ID INT NOT NULL,
    Empleado_ID INT NOT NULL,
    Fecha DATE NOT NULL,
    	PRIMARY KEY (Pedido_ID),
    	FOREIGN KEY (Empleado_ID) REFERENCES Empleados (Empleado_ID),
    	FOREIGN KEY (Cliente_ID) REFERENCES Clientes (Cliente_ID)
);

-- creando la tabla con los detalles de los pedidos
CREATE TABLE Detalle_Pedido(
    Detalle_pedido_ID INT NOT NULL,
    Pedido_ID INT NOT NULL,
    Producto_ID INT NOT NULL,
    Cantidad INT NOT NULL,
    Metodo_Pago_ID INT NOT NULL,
	PRIMARY KEY (Detalle_pedido_ID),
	FOREIGN KEY (Pedido_ID) REFERENCES Pedido (Pedido_ID),
	FOREIGN KEY (Producto_ID) REFERENCES Productos (Producto_ID),
	FOREIGN KEY (Metodo_Pago_ID) REFERENCES Metodo_Pago (Metodo_Pago_ID)
);

