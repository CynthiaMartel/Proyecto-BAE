-- VISTAS Y TRIGGERS --
use gestioncompraglobalmart;

-- TIGGERS --

-- 1. Actualizar un stock automáticamente tras que se realice un pedido
DELIMITER //
CREATE TRIGGER trActualizarStockDespuesDePedido
AFTER INSERT ON detallespedido
FOR EACH ROW
BEGIN
UPDATE producto
SET stock = stock - NEW.cantidadSolicitada
WHERE idProducto = NEW.id_Producto;
END;
//DELIMITER ;
-- 2. No permitir un stock negativo
DELIMITER //
CREATE TRIGGER trPrevenirStockNegativo
BEFORE INSERT ON detallespedido
FOR EACH ROW
BEGIN
DECLARE stockActual INT;
SELECT stock INTO stockActual
FROM producto
WHERE idProducto = NEW.id_Producto;
IF NEW.cantidadSolicitada > stockActual THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Error: No hay suficiente stock disponible para este producto.';
END IF;
END;
//DELIMITER ;

-- VISTAS --
-- 1. La ya mostrada en AMPLIACIÓN (vista para manejar reposición de stock de menos de 100)
-- 2. Resumen de ventas por cliente para detectar clientes frecuentes
CREATE OR REPLACE VIEW vistaResumenComprasClientes AS
SELECT 
cl.nombre AS nombreCliente,
COUNT(DISTINCT pe.idPedido) AS totalPedidos,
SUM(dp.cantidadSolicitada) AS totalProductos,
SUM(dp.cantidadSolicitada * p.precio) AS totalGastado
FROM cliente cl
JOIN pedido pe ON cl.idCliente = pe.idCliente
JOIN detallespedido dp ON pe.idPedido = dp.id_Pedido
JOIN producto p ON dp.id_Producto = p.idProducto
GROUP BY cl.idCliente;
