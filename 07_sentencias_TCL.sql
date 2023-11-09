-- empieza la transacción En primera tabla

START TRANSACTION;
-- se elimina el cliente id 5 'absurdo'
DELETE FROM clientes WHERE cliente_id = 5;

-- ROLLBACK;

-- COMMIT;


-- Transacción de inserción de ocho productos.
START TRANSACTION;

INSERT INTO PRODUCTOS
VALUES   (11,'mayonesa',6,4,135),
         (12,'sal marina',2,2,110),
         (13,'pimenton',3,1,135),
         (14,'curcuma',5,1,125);

-- savepoint de 4 lotes de inserción de productos.

savepoint lote_4

-- inserción de los 4 registros restantes.
(15,'comino',5,1,80),
(16,'salsa de soja',3,5,195),
(17,'pimineta blanca',2,2,155),
(18,'cilantro',4,3,95)
;

-- savepoint de los ultimos 4 registros

savepoint lote_8


-- Regresar al punto de guardado de los primeros cuatro registros

-- ROLLBACK TO lote_4;
