-- Consulta básica: ver productos y stock
USE gestioncompraglobalmart;
SELECT nombre, precio, stock FROM producto;

-- Consulta básica: Ver lista de proveedores con teléfono y email
USE gestioncompraglobalmart;
SELECT nombre AS Proveedor, numeroTelefono AS Teléfono, email AS Correo
FROM proveedor;

-- Consulta básica: Ver pedidos que ya han sido entregados con su importe total
SELECT idPedido AS Pedido, fechaPedido AS Fecha, estadoPedido AS Estado, importeTotal AS Total
FROM pedido
WHERE estadoPedido = 'Entregado';

-- Consulta de mantenimiento: insertar nuevo proveedor
USE gestioncompraglobalmart;
INSERT INTO proveedor (nombre, numeroTelefono, direccion, email)
VALUES ('EcoTienda Circular', '928456789', 'Calle Molino 21, Arucas', 'info@ecotiendacircular.com');

-- Consulta de mantenimiento: Eliminar al proveedor con ID 4 
USE gestioncompraglobalmart;
DELETE FROM proveedor
WHERE idProveedor = 4;

-- Consulta de mantenimiento: Eliminar un producto específico del catálogo (por ejemplo, la lámpara LED)
USE gestioncompraglobalmart;
DELETE FROM producto
WHERE nombre = 'Lámpara LED bajo consumo';

-- Consulta de mantenimiento: Aumentar el precio del producto "Cuaderno ecológico" en 0.50€
USE gestioncompraglobalmart;
UPDATE producto
SET precio = precio + 0.50
WHERE nombre = 'Cuaderno ecológico';

-- Consulta de mantenimiento: actualizar stock 
USE gestioncompraglobalmart;
UPDATE producto SET stock = stock - 10 WHERE id_Producto = 1;

-- Actualizar el stock tras la venta de 5 unidades del producto con id_Producto = 3
USE gestioncompraglobalmart;
UPDATE producto
SET stock = stock - 5
WHERE idProducto = 3;

-- JOIN: ver productos con sus proveedores
USE gestioncompraglobalmart;
SELECT p.nombre AS Producto, p.precio, pr.nombre AS Proveedor
FROM producto p
JOIN proveedor pr ON p.id_Proveedor = pr.idProveedor;


-- JOIN: Ver qué proveedor suministró un producto vendido en el pedido número 5
USE gestioncompraglobalmart;
SELECT p.nombre AS nombre_producto, pr.nombre AS nombre_proveedor, pr.email AS contacto_proveedor
FROM detallespedido dp
JOIN producto p ON dp.id_Producto = p.idProducto
JOIN proveedor pr ON p.id_Proveedor = pr.idProveedor
WHERE dp.id_Pedido = 5;

-- JOIN: ver productos vendidos en pedidos entregados, con proveedor y fecha. 
-- Ordenamos por feecha de entrega
USE gestioncompraglobalmart;
SELECT pd.idPedido, p.nombre AS nombre_producto, pr.nombre AS nombre_proveedor, 
pd.fechaEntrega, dp.cantidadSolicitada, dp.subtotal
FROM pedido pd
JOIN detallespedido dp ON pd.idPedido = dp.id_Pedido
JOIN producto p ON dp.id_Producto = p.idProducto
JOIN proveedor pr ON p.id_Proveedor = pr.idProveedor
WHERE pd.estadoPedido = 'Entregado'
ORDER BY pd.fechaEntrega;

-- WHERE: productos con stock menor a 100
USE gestioncompraglobalmart;
SELECT nombre, stock FROM producto WHERE stock < 100;

-- ORDER BY: productos ordenados por precio descendente
USE gestioncompraglobalmart;
SELECT nombre, precio FROM producto ORDER BY precio DESC;

-- Fechas: ver pedidos entre el 1 y el 15 de marzo
USE gestioncompraglobalmart;
SELECT * FROM pedido 
WHERE fechaPedido BETWEEN '2025-03-01' AND '2025-03-15';

-- GROUP BY y funciones agregadas: calcular el total por pedido
USE gestioncompraglobalmart;
SELECT id_Pedido, SUM(subtotal) AS TotalPedido
FROM detallespedido
GROUP BY id_Pedido;

-- RANK: ver productos más caros
USE gestioncompraglobalmart;
SELECT nombre, precio,
RANK() OVER (ORDER BY precio DESC) AS PosicionPrecio
FROM producto;

-- Productos más vendidos (por cantidad total)
USE gestioncompraglobalmart;
SELECT pr.nombre AS Producto, SUM(dp.cantidadSolicitada) AS TotalVendidas
FROM detallespedido dp
JOIN producto pr ON dp.id_Producto = pr.idProducto
GROUP BY pr.nombre
ORDER BY TotalVendidas DESC;

-- JOIN múltiple: ver productos vendidos por pedido y proveedor
USE gestioncompraglobalmart;
SELECT dp.id_Pedido, pr.nombre AS Producto, pv.nombre AS Proveedor, dp.cantidadSolicitada
FROM detallespedido dp
JOIN producto pr ON dp.id_Producto = pr.idProducto
JOIN proveedor pv ON pr.id_Proveedor = pv.idProveedor;

