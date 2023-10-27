
-- calculo precio total
DELIMITER $$
CREATE PROCEDURE calculo_precio_total (IN precio_unitario DECIMAL(10,2), in CANTIDAD int, IN descuento DECIMAL(10,2))
	BEGIN 
		DECLARE precio_total DECIMAL(10,2);
        SET precio_total = precio_unitario * cantidad * (1 - descuento);
        select precio_total as 'precio_total';
	end $$
DELIMITER;

-- CALL calculo_precio_total (10.00,5,0.1);



-- agregar un nuevo cliente en la tabla 'clientes'
DELIMITER $$
CREATE PROCEDURE InsertarCliente(
	IN cliente_ID INT,
    IN nombre_cliente VARCHAR(100),
    IN telefono VARCHAR(15),
    IN direccion VARCHAR(100),
    IN ciudad VARCHAR(50),
    IN provincia VARCHAR(50),
    IN email VARCHAR(100)
)
BEGIN
    INSERT INTO clientes (cliente_ID, nombre_cliente, telefono, direccion, ciudad, provincia, email)
    VALUES (cliente_id, nombre_cliente, telefono, direccion, ciudad, provincia, email);
END $$

DELIMITER;
-- CALL InsertarCliente(100, 'Nombre del Cliente', '123456789', 'Av. Roca 1233', 'Ciudad', 'Provincia', 'cliente@mail.com');


-- eliminar un cliente de la tabla 'clientes'
DELIMITER $$

CREATE PROCEDURE EliminarCliente (IN cliente_id INT)
BEGIN
    DELETE FROM clientes
    WHERE cliente_id = cliente_id;
END $$
DELIMITER ;

-- CALL EliminarCliente(1);
