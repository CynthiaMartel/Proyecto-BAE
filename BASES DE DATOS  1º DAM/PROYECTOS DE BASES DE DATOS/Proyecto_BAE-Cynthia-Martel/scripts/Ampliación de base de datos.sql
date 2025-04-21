USE `gestioncompraglobalmart`;

-- AMPLIACIÓN --

-- Crear tabla de certificaciones ecológicas
CREATE TABLE certificacionEcologica (
    idCertificacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

-- Tabla intermedia producto-certificacion (relación N:N)
CREATE TABLE productoCertificacion (
    idProducto INT,
    idCertificacion INT,
    PRIMARY KEY (idProducto, idCertificacion),
    FOREIGN KEY (idProducto) REFERENCES producto(idProducto),
    FOREIGN KEY (idCertificacion) REFERENCES certificacionEcologica(idCertificacion)
);

-- Insertar algunas certificaciones
INSERT INTO certificacionEcologica (nombre, descripcion) VALUES
('FSC', 'Certificación de sostenibilidad forestal'),
('EU Ecolabel', 'Etiqueta ecológica oficial de la UE'),
('Cradle to Cradle', 'Certificación de ciclo cerrado de producción');

-- Tabla con indicadores de impacto ambiental
CREATE TABLE impactoAmbiental (
    idProducto INT PRIMARY KEY,
    huellaCarbono DECIMAL(5,2), -- kg CO2 por unidad
    reciclabilidad VARCHAR(50), -- por ejemplo: '100%', 'Parcial', 'No reciclable'
    origenLocal BOOLEAN, -- TRUE si es producido en Canarias
    FOREIGN KEY (idProducto) REFERENCES producto(idProducto)
);

-- Insertar ejemplos
INSERT INTO impactoAmbiental (idProducto, huellaCarbono, reciclabilidad, origenLocal) VALUES
(1, 0.50, '100%', FALSE),
(4, 0.20, '100%', TRUE),
(5, 1.20, 'Parcial', TRUE),
(7, 2.80, 'Parcial', FALSE);

-- Crear tabla clientes
CREATE TABLE cliente (
idCliente INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
email VARCHAR(100),
direccion TEXT
);

-- Añadir columna a la tabla pedido
ALTER TABLE pedido ADD idCliente INT,
ADD FOREIGN KEY (idCliente) REFERENCES cliente(idCliente);

-- Insertar algunos clientes
INSERT INTO cliente (nombre, email, direccion) VALUES
('Centro Educativo La Esperanza', 'contacto@laesperanza.org', 'Calle Camino Viejo 12, Santa Brígida'),
('EcoOficina Verde', 'info@ecooficinaverde.com', 'Av. Mesa y López 5, Las Palmas'),
('Tiendita Natural', 'hola@tienditanatural.es', 'Calle Real 30, Teror');

-- Actualizar pedidos existentes con idCliente
UPDATE pedido SET idCliente = 1 WHERE idPedido = 1;
UPDATE pedido SET idCliente = 2 WHERE idPedido = 2;
UPDATE pedido SET idCliente = 2 WHERE idPedido = 3;
UPDATE pedido SET idCliente = 3 WHERE idPedido = 4;
UPDATE pedido SET idCliente = 1 WHERE idPedido = 5;

-- Eliminar la columna 'categoria' de la tabla 'producto'
ALTER TABLE producto DROP COLUMN categoria;

-- Crear tabla 'categoria'
CREATE TABLE categoria (
idCategoria INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL UNIQUE
);

-- Insertar algunas categorías
INSERT INTO categoria (nombre) VALUES 
('Papelería'),
('Electrónica ecológica'),
('Hidratación sostenible'),
('Accesorios sostenibles'),
('Ropa ecológica');

-- Modificar la tabla 'producto' para agregar la relación con 'categoria'
ALTER TABLE producto ADD idCategoria INT;

-- Establecer la clave foránea para la relación
ALTER TABLE producto ADD FOREIGN KEY (idCategoria) REFERENCES categoria(idCategoria);

-- Crear vista para productos de bajo stock
CREATE VIEW vistaProductosBajoStock AS
SELECT p.nombre AS nombreProducto, p.stock, c.nombre AS categoria, pr.nombre AS proveedor
FROM producto p
JOIN categoria c ON p.idCategoria = c.idCategoria
JOIN proveedor pr ON p.idProveedor = pr.idProveedor
WHERE p.stock < 100;


-- VISTAS Y TRIGGERS --

-- TIGGERS --

-- 1. Actualizar un stock automáticamente tras que se realice un pedido
DELIMITER //
CREATE TRIGGER trActualizarStockDespuesDePedido
AFTER INSERT ON detallespedido
FOR EACH ROW
BEGIN
    UPDATE producto
    SET stock = stock - NEW.cantidadSolicitada
    WHERE idProducto = NEW.idProducto;
END;
// DELIMITER ;

-- 2. No permitir un stock negativo
DELIMITER //
CREATE TRIGGER trPrevenirStockNegativo
BEFORE INSERT ON detallespedido
FOR EACH ROW
BEGIN
    DECLARE stockActual INT;
    -- Obtener el stock actual del producto
    SELECT stock INTO stockActual
    FROM producto
    WHERE idProducto = NEW.idProducto;
    -- Verificar si la cantidad solicitada supera el stock disponible
    IF NEW.cantidadSolicitada > stockActual THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: No hay suficiente stock disponible para este producto.';
    END IF;
END //
DELIMITER ;

-- VISTAS --

-- 1. La ya mostrada en AMPLIACIÓN (vista para manejar reposición de stock de menos de 100)
-- 2. Resumen de ventas por cliente para detectar clientes frecuentes
CREATE VIEW vistaResumenComprasClientes AS
SELECT cl.nombre AS nombreCliente, cl.apellido AS apellidoCliente,
       COUNT(dp.idDetallePedido) AS totalPedidos,
       SUM(dp.cantidadSolicitada) AS totalProductos,
       SUM(dp.cantidadSolicitada * p.precioVenta) AS totalGastado
FROM cliente cl
JOIN pedido pe ON cl.idCliente = pe.idCliente
JOIN detallespedido dp ON pe.idPedido = dp.idPedido
JOIN producto p ON dp.idProducto = p.idProducto
GROUP BY cl.idCliente;

