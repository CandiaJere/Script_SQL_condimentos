-- función para saber el nombre del cliente
DELIMITER $$

CREATE FUNCTION ObtenerNombreCliente(PedidoID INT) RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE NombreCliente VARCHAR(50);
    
    SELECT c.Nombre_cliente INTO NombreCliente
    FROM Clientes c
    JOIN Pedido p ON c.Cliente_ID = p.Cliente_ID
    WHERE p.Pedido_ID = PedidoID;
    
    RETURN NombreCliente;
END $$

DELIMITER ;

-- SELECT ObtenerNombreCliente(5) AS NombreClienteDelPedido;



 -- calculo promedio por categoria
DELIMITER $$

CREATE FUNCTION CalcularPrecioPromedioEnCategoria(categoria_id INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE precio_promedio FLOAT;

    SELECT AVG(Precio) INTO precio_promedio
    FROM Productos
    WHERE Categoria_ID = categoria_id;

    RETURN precio_promedio;
END $$

DELIMITER ;

-- SELECT CalcularPrecioPromedioEnCategoria(1);
