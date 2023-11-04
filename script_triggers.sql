
-- trigger con registro de inserción de datos relacionado con productos y precios

DROP TRIGGER IF EXISTS precio_nuevo;
DELIMITER $$
CREATE TRIGGER precio_nuevo
BEFORE INSERT ON precio
FOR EACH ROW
BEGIN
    INSERT INTO Registro_Cambios_Precios (Producto_ID, Precio_Anterior)
    VALUES (NEW.Producto_ID, NEW.Precio_vigencia_inicial);
END;
$$
DELIMITER ;


DROP TRIGGER IF EXISTS precio_eliminado;
DELIMITER $$
CREATE TRIGGER precio_eliminado
AFTER DELETE ON Precio
FOR EACH ROW
BEGIN
    -- Registro de la información después de la eliminación
    INSERT INTO Registro_Precios_Eliminados (Producto_ID, Precio_Eliminado)
    VALUES (OLD.Producto_ID, OLD.Precio_vigencia_inicial);
END; $$
DELIMITER ;




-- Crear la tabla de registro
DROP TABLE IF EXISTS registro_producto;
CREATE TABLE registro_producto; (
    accion_realizada VARCHAR(10) NOT NULL,
    producto_id INT NOT NULL,
    nombre_producto VARCHAR(50),
    proveedor_id INT,
    categoria_id INT,
    precio FLOAT,
    fecha TIMESTAMP
);

-- Crear un trigger after para insertar registros en la tabla de registro
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


