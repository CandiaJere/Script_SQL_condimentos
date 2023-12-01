USE emprendimiento_condimento;

-- clientes que mas compran
CREATE OR REPLACE view mejores_clientes
AS
  SELECT c.nombre_cliente    AS cliente,
         Count(p.cliente_id) AS total
  FROM   clientes c
         LEFT JOIN pedido p
                ON c.cliente_id = p.cliente_id
  GROUP  BY c.cliente_id
  ORDER  BY total DESC; 


-- los clientes que pagan con transferencia
CREATE OR REPLACE view pago_transferencia
AS
  SELECT *
  FROM   detalle_pedido
  WHERE  metodo_pago_id = 4; 


-- los productos con sus detalles
CREATE OR REPLACE view join_producto
AS
  SELECT c.categoria_id,
         nombre_categoria,
         p.nombre_producto,
         p.precio
  FROM   categoria c
         INNER JOIN productos p
                 ON c.categoria_id = p.categoria_id; 


-- producto mas iva
CREATE OR REPLACE view producto_iva
AS
  SELECT *, Round(precio * 1.21 + precio) AS IVA
  FROM   productos; 



-- top productos mas vendidos
CREATE OR REPLACE view cantidad_vendido
AS
  SELECT producto_id,
         (SELECT nombre_producto
          FROM   productos p
          WHERE  d.producto_id = p.producto_id) AS nombre,
         Sum(cantidad)                          AS total_vendido
  FROM   detalle_pedido d
  GROUP  BY producto_id
  ORDER  BY total_vendido DESC; 
