
-- creacion de la tabla para almacenar los nuevos valores de los productos

DROP TABLE IF EXISTS nuevos_precios;
CREATE TABLE nuevos_precios (
    producto_id INT NOT NULL,
    precio_nuevo FLOAT,
    fecha TIMESTAMP
);


-- trigger con registro de inserción de datos relacionado con productos y precios
DROP TRIGGER IF EXISTS precio_nuevo;
DELIMITER $$
CREATE TRIGGER precio_nuevo
BEFORE INSERT ON precio
FOR EACH ROW
BEGIN
    INSERT INTO Nuevos_Precios (Producto_id, Precio_nuevo, fecha)
    VALUES (NEW.Producto_ID, NEW.Precio_vigencia_final, NOW());
END;
$$
DELIMITER ;


-- creacion de la tabla de auditoria donde se guardaran los precios eliminados o modificados

DROP TABLE IF EXISTS Registro_Precios_Eliminados;
CREATE TABLE Registro_Precios_Eliminados (
    producto_id INT NOT NULL,
    precio_eliminado FLOAT,
    fecha TIMESTAMP
);



-- trigger que se activa cuando los precios de los productos se vean eliminados o modificados

DROP TRIGGER IF EXISTS precio_eliminado;
DELIMITER $$
CREATE TRIGGER precio_eliminado
AFTER DELETE ON Precio
FOR EACH ROW
BEGIN
    INSERT INTO Registro_Precios_Eliminados (Producto_ID, Precio_Eliminado)
    VALUES (OLD.Producto_ID, OLD.Precio_vigencia_inicial);
END; $$
DELIMITER ;



-- trigger de registro de productos 

DROP TABLE IF EXISTS registro_producto;
CREATE TABLE registro_producto (
    accion_realizada VARCHAR(10) NOT NULL,
    producto_id INT NOT NULL,
    nombre_producto VARCHAR(50),
    proveedor_id INT,
    categoria_id INT,
    precio FLOAT,
    fecha TIMESTAMP
);


-- Crear un trigger after para insertar registros en la tabla de registro
DROP TRIGGER IF EXISTS log_productos;
DELIMITER //
CREATE TRIGGER log_productos
AFTER INSERT ON productos
FOR EACH ROW
BEGIN
    INSERT INTO registro_productos (accion_realizada, producto_id, nombre_producto, proveedor_id, categoria_id, precio, fecha)
    VALUES ('INSERT', NEW.producto_id, NEW.nombre_producto, NEW.proveedor_id, NEW.categoria_id, NEW.precio, NOW());
END;
//
DELIMITER ;


