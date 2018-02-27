/* Formatted on 26/02/2018 10:01:30 p.m. (QP5 v5.300) */
--
--4. Muestre	el	nombre	y	dirección	de	correo	electrónico	del	cliente	con nombre	de	la	compañía	'XXXXXXXXX'

SELECT * FROM EX1_023047.CUSTOMEr;

SELECT L_name || ' ' || F_name AS cliente, email
  FROM EX1_023047.customer
 WHERE company = 'Pongame100';

--5. Muestre	el	nombre	de	la	compañía	de	todos	los	clientes	con	una	dirección	en	la	ciudad	de	'XXXXXXXXX'

SELECT company
  FROM EX1_023047.customer  cus
       INNER JOIN EX1_023047.direccion dir ON dir.ADDRESS_ID = cus.ADDRESS_ID
       INNER JOIN EX1_023047.city cid ON cid.city_id = dir.city_id
 WHERE cid.city = 'Tijuana';

--6. Cuantos	artículos	con	un	precio	de	lista	mayor	a	'XXXXXXXXX'	han	sido	vendidos

SELECT *
  FROM EX1_023047.product
 WHERE list_price > '1000';

--7. Obtener	el	nombre	de	la	compañía	con	clientes	con	ordenes	mayores	a	'XXXXXXXX'

SELECT *
  FROM (  SELECT company, SUM (quantity * list_price) AS precio_total
            FROM EX1_023047.orders ord
                 INNER JOIN EX1_023047.order_product op
                     ON op.order_id = ord.order_id
                 INNER JOIN EX1_023047.product prod
                     ON prod.product_id = op.product_id
                 INNER JOIN EX1_023047.customer cus
                     ON cus.customer_id = ord.customer_id
        GROUP BY company) in_q
 WHERE in_q.precio_total > 1000;

--8. Obtener	el	numero	de	productos	'YYYYYYYYY'	ordenados	por	la	compañía	'XXXXXXXX'

  SELECT COMPANY, COUNT (PROD.PRODUCT_ID) AS TOTAL_ORDENADOS
    FROM EX1_023047.orders ord
         INNER JOIN EX1_023047.order_product op ON op.order_id = ord.order_id
         INNER JOIN EX1_023047.product prod ON prod.product_id = op.product_id
         INNER JOIN EX1_023047.customer cus
             ON cus.customer_id = ord.customer_id
GROUP BY COMPANY
  HAVING COMPANY = 'Pongame100';

--9. Encontrar	las	ordenes	donde	solo	se	ha	vendido	un	solo	articulo

SELECT *
  FROM (  SELECT ord.order_id, COUNT (product_id) AS cantidad
            FROM EX1_023047.orders ord
                 INNER JOIN EX1_023047.order_product op
                     ON op.order_id = ord.order_id
        GROUP BY ord.order_id) in_q
 WHERE in_q.cantidad = 1;

--10. Liste	los	artículos	y	todos los	clientes	que	ordenaron	algún	producto	perteneciente	al modelo	de	producto
--'XXXXX'
--11. Muestre	id_articulo	y	descripción	de	los	artículos	con	la	cultura	'XXXXXXX'.
--12. Utilizando	el	valor	subtotal	de	las	ordenes,	liste	las	ordenes	de	mayor	a	menor	y	por	cada	orden	muestre
--la	companía	y	el	peso	total	de	la	orden.
--13. Muestre	cuantos	artículos	'XXXXX'	fueron	vendidos	a	una	dirección	en	la	ciudad	'YYYYYY'.
--14. Por	cada cliente	con	un	TIPO	de	dirección	'XXXXXXXXX'	en	la	ciudad	'YYYYYYYYY'	muestre	los	datos	de	la
--dirección.
--15. Por	cada	orden,	muestre	el	identificador	de	la	orden	y	el	subtotal	calculado	de	tres	formas:
--a. Del	encabezado	de	la	orden
--b. Suma	de	la	cantidad	de	la	orden	por	precio	unitario
--c. Suma	de	la	cantidad	de	la	orden	por	precio	de	lista
--16. Muestre	el	articulo	mejor	vendido y	los	datos	de	la	orden	mas	cara	que	contenga	este	artículo.