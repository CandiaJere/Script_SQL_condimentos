-- usuario de sólo lectura de tablas.
CREATE USER 'usuario_lectura'@'localhost' IDENTIFIED BY 'abcd1234';

-- sentencia GRANT que otorga permiso de solo lectura.
GRANT SELECT ON emprendimiento_condimento.* TO 'usuario_lectura'@'localhost';

-- elimina el permiso para eliminar registro de la tabla.
REVOKE DELETE ON emprendimiento_condimento.* FROM 'usuario_lectura'@'localhost';





-- usuario con permiso de lectura, inserción y modificación de datos.
CREATE USER 'usuario_escritura'@'localhost' IDENTIFIED BY '1234567890';

-- sentencia GRANT que concede permisos de lectura, inserción y modificación.
GRANT SELECT, INSERT, UPDATE ON emprendimiento_condimento.* TO 'usuario_lectura_escritura'@'localhost';

-- Elimina permiso para eliminar registro en la tabla.
REVOKE DELETE ON emprendimiento_condimento.* FROM 'usuario_lectura_escritura'@'localhost';
