USE Emprendimiento_Condimento;

-- inserción de datos de Categoría
INSERT INTO CATEGORIA
VALUES (1,'especia','sustancia vegetal. Suelen ser más intensas en sabor y aroma que las hierbas y se utilizan en pequeñas cantidades debido a su potencia.'),
(2,'condimento','sustancia de origen vegetal, animal o mineral, que se agrega a los alimentos para mejorar su sabor o aroma. Los condimentos pueden incluir especias e ingredientes como la sal, el azúcar, el vinagre, las salsas y los aceites.'),
(3,'hierba','planta comestible o partes de una planta que se utilizan para sazonar y dar sabor a los alimentos.suelen tener un sabor más suave y fresco en comparación con las especias.'),
(4,'aderezo','conjunto de ingredientes combinados que se usan para sazonar la comida y pueden convertir un plato soso o sin gracia en un plato sabroso.'),
(5,'condimento liquido','permiten personalizar el sabor de tus comidas y utilizarse para marinar, aderezar o acompañar tus elaboraciones');


-- inserción de datos de la tabla Clientes
INSERT INTO CLIENTES
VALUES (1,'Chino',116574326,'Calle falsa 123','springfield','Buenos Aires','chino@gmail.com'),
(2,'Mercado Juan',351233453,'Montevideo 275','villa urquiza','Cordoba','mercadojuan@hotmail.com'),
(3,'Cooperativa obrera',114394700,'Belgrano 45','Bahia blanca','buenos aires','cooperativa@obrera.coop'),
(4,'Verduleria Montes',29934566422,'Alem 1203','cipoletti','neuquen','montesverdu@outlook.com'),
(5,'absurdo',29834531213,'Panama 460','general roca','rio negro','absurdo@gmail.com'),
(6,'Luis Rodriguez',29834531213,'Mendoza 1258','regina','rio negro','luisrodriguez@gmail.com'),
(7,'mayorista buffalo',261223457,'san martin 1708','mendoza','mendoza','buffalomayor@mail.com');


-- inserción de datos de la tabla Empleados
INSERT INTO EMPLEADOS
VALUES (31685342,'Rosa','delejos','2015-08-04',180000.30),
(38559639,'Mario','castañeda','2020-05-09',165000.60),
(30559112,'Roberto','carlos','2018-12-01',174000.80),
(40236001,'marcelo','rodriguez','2020-02-21',158000.10),
(37567187,'Ivana','matos','2019-11-03',164000.20);

-- inserción de proveedores
INSERT INTO PROVEEDORES
VALUES (1,'picantin',1194856932,'calle real 321','springfield','buenos aires','picantin@yahoo.com.ar'),
(2,'saborizan',3412812114,'tucuman 226','rosario','santa fe','ventas@saborizan.com'),
(3,'alicante',1155691103,'villegas 1056','comodoro rivadavia','chubut','ventas@alicante.com'),
(4,'pizca de sal',2994501249,'artigas 1590','centenario','neuquen','pizcadesal@outlook.com'),
(5,'callieri',2984435130,'Líbano 1579','general roca','rio negro','ventas@callieri.com.ar'),
(6,'especias norte',3627953324,'artigas 2343','resistencia','chaco','norteespecias@ventas.com');

-- inserción de datos de productos
INSERT INTO PRODUCTOS
VALUES (1,'oregano',3,1,130),
(2,'ajo en polvo',4,1,150),
(3,'pimienta negra',5,2,100),
(4,'albaca',2,2,90),
(5,'romero',3,3,110),
(6,'canela',1,1,190),
(7,'mostaza',6,4,140),
(8,'perejil',5,3,90),
(9,'aceite de sesamo',4,5,120),
(10,'salsa de barbacoa',5,5,140);

-- insercion de precios
INSERT INTO PRECIO
VALUES (1,2,100,150),
(2,1,90,130),
(3,3,75,100),
(4,4,50,90),
(5,6,110,190),
(6,5,70,110),
(7,7,110,140),
(8,8,60,90),
(9,9,90,120),
(10,10,900,140);

-- inserción de datos de metodo de pago
INSERT INTO METODO_PAGO
VALUES (1,'efectivo','con dinero en mano'),
(2,'debito','se cobra con tarjeta de debito'),
(3,'credito','credito con 10% de recargo'),
(4,'transferencia','transferencia bancaria al CBU');

-- inserción de datos de la tabla pedido
INSERT INTO PEDIDO
VALUES (1,2,40236001,'2023-09-01'),
(2,4,38559639,'2023-10-10'),
(3,1,38559639,'2022-01-11'),
(4,3,31685342,'2022-06-30'),
(5,5,30559112,'2021-12-20'),
(6,2,37567187,'2023-05-04'),
(7,6,40236001,'2022-03-13'),
(8,7,38559639,'2023-08-06');

-- inserción de datos en la tabla detalle_pedido
INSERT INTO DETALLE_PEDIDO
VALUES (1,3,2,10,4),
(2,4,4,10,4),
(3,1,5,25,3),
(4,5,6,25,1),
(5,2,1,10,2),
(6,3,7,35,1),
(7,2,6,30,3),
(8,8,6,8,4);
