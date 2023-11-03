DELIMITER //
CREATE TRIGGER before_insert_precio
BEFORE INSERT ON Precio
FOR EACH ROW
BEGIN
    -- Registro de la información antes de la inserción
    INSERT INTO Registro_Cambios_Precios (Producto_ID, Precio_Anterior)
    VALUES (NEW.Producto_ID, NEW.Precio_vigencia_inicial);
END;
//
DELIMITER ;



DELIMITER //
CREATE TRIGGER after_delete_precio
AFTER DELETE ON Precio
FOR EACH ROW
BEGIN
    -- Registro de la información después de la eliminación
    INSERT INTO Registro_Precios_Eliminados (Producto_ID, Precio_Eliminado)
    VALUES (OLD.Producto_ID, OLD.Precio_vigencia_inicial);
END;
//
DELIMITER ;






-- Crear la tabla de registro
CREATE TABLE Registro_Productos (
    Accion VARCHAR(10) NOT NULL,
    Producto_ID INT NOT NULL,
    Nombre_Producto VARCHAR(50),
    Proveedor_ID INT,
    Categoria_ID INT,
    Precio FLOAT,
    Fecha TIMESTAMP
);

-- Crear un trigger after para insertar registros en la tabla de registro
DELIMITER //
CREATE TRIGGER LOG_Productos
AFTER INSERT ON Productos
FOR EACH ROW
BEGIN
    INSERT INTO Registro_Productos (Accion, Producto_ID, Nombre_Producto, Proveedor_ID, Categoria_ID, Precio, Fecha)
    VALUES ('INSERT', NEW.Producto_ID, NEW.Nombre_Producto, NEW.Proveedor_ID, NEW.Categoria_ID, NEW.Precio, NOW());
END;
//
DELIMITER ;
