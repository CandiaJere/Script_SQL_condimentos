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
