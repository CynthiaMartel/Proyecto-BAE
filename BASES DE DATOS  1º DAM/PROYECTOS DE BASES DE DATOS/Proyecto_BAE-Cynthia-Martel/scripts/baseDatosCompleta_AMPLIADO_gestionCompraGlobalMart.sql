-- BASE DE DATOS GLOBALMART COMPLETA CON AMPLIACIÓN IMPLEMENTADA

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gestioncompraglobalmart
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestioncompraglobalmart` DEFAULT CHARACTER SET utf8mb4 ;
USE `gestioncompraglobalmart` ;

-- -----------------------------------------------------
-- Table `categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE INDEX `nombre` (`nombre` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `certificacionecologica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `certificacionecologica` (
  `idCertificacion` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idCertificacion`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `direccion` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedido` (
  `idPedido` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` DATE NULL DEFAULT NULL,
  `fechaEntrega` DATE NULL DEFAULT NULL,
  `estadoPedido` VARCHAR(50) NULL DEFAULT NULL,
  `importeTotal` DECIMAL(10,2) NULL DEFAULT NULL,
  `idCliente` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `idCliente` (`idCliente` ASC) ,
  CONSTRAINT `pedido_ibfk_1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `cliente` (`idCliente`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proveedor` (
  `idProveedor` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `numeroTelefono` VARCHAR(20) NULL DEFAULT NULL,
  `direccion` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE INDEX `unique_email` (`email` ASC) ,
  UNIQUE INDEX `unique_telefono` (`numeroTelefono` ASC) )
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` TEXT NULL DEFAULT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `stock` INT(11) NULL DEFAULT NULL,
  `id_Proveedor` INT(11) NULL DEFAULT NULL,
  `idCategoria` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `id_Proveedor` (`id_Proveedor` ASC) ,
  INDEX `idCategoria` (`idCategoria` ASC) ,
  CONSTRAINT `producto_ibfk_1`
    FOREIGN KEY (`id_Proveedor`)
    REFERENCES `proveedor` (`idProveedor`)
    ON DELETE CASCADE,
  CONSTRAINT `producto_ibfk_2`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `categoria` (`idCategoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `detallespedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `detallespedido` (
  `idDetallePedido` INT(11) NOT NULL AUTO_INCREMENT,
  `id_Pedido` INT(11) NULL DEFAULT NULL,
  `id_Producto` INT(11) NULL DEFAULT NULL,
  `cantidadSolicitada` INT(11) NOT NULL,
  `precioUnitario` DECIMAL(10,2) NULL DEFAULT NULL,
  `subtotal` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idDetallePedido`),
  INDEX `id_Pedido` (`id_Pedido` ASC) ,
  INDEX `id_Producto` (`id_Producto` ASC) ,
  CONSTRAINT `detallespedido_ibfk_1`
    FOREIGN KEY (`id_Pedido`)
    REFERENCES `pedido` (`idPedido`)
    ON DELETE CASCADE,
  CONSTRAINT `detallespedido_ibfk_2`
    FOREIGN KEY (`id_Producto`)
    REFERENCES `producto` (`idProducto`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `impactoambiental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `impactoambiental` (
  `idProducto` INT(11) NOT NULL,
  `huellaCarbono` DECIMAL(5,2) NULL DEFAULT NULL,
  `reciclabilidad` VARCHAR(50) NULL DEFAULT NULL,
  `origenLocal` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  CONSTRAINT `impactoambiental_ibfk_1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `producto` (`idProducto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Table `productocertificacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `productocertificacion` (
  `idProducto` INT(11) NOT NULL,
  `idCertificacion` INT(11) NOT NULL,
  PRIMARY KEY (`idProducto`, `idCertificacion`),
  INDEX `idCertificacion` (`idCertificacion` ASC) ,
  CONSTRAINT `productocertificacion_ibfk_1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `producto` (`idProducto`),
  CONSTRAINT `productocertificacion_ibfk_2`
    FOREIGN KEY (`idCertificacion`)
    REFERENCES `certificacionecologica` (`idCertificacion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

-- -----------------------------------------------------
-- Placeholder table for view `vistaproductosbajostock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vistaproductosbajostock` (`nombreProducto` INT, `stock` INT, `categoria` INT, `proveedor` INT);

-- -----------------------------------------------------
-- VIEW `vistaproductosbajostock`
-- -----------------------------------------------------
CREATE VIEW vistaProductosBajoStock AS
SELECT p.nombre AS nombreProducto, p.stock, c.nombre AS categoria, pr.nombre AS proveedor
FROM producto p
JOIN categoria c ON p.idCategoria = c.idCategoria
JOIN proveedor pr ON p.idProveedor = pr.idProveedor
WHERE p.stock < 100;

-- -----------------------------------------------------
-- TRIGGERS
-- -----------------------------------------------------
DELIMITER //

-- 1. Actualizar stock tras pedido
CREATE TRIGGER trActualizarStockDespuesDePedido
AFTER INSERT ON detallespedido
FOR EACH ROW
BEGIN
UPDATE producto
SET stock = stock - NEW.cantidadSolicitada
WHERE idProducto = NEW.id_Producto;
END;
//

-- 2. Prevenir stock negativo
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
//
DELIMITER ;

-- -----------------------------------------------------
-- VISTA: Resumen de ventas por cliente
-- -----------------------------------------------------
CREATE VIEW vistaResumenComprasClientes AS
SELECT cl.nombre AS nombreCliente, cl.apellido AS apellidoCliente,
COUNT(dp.idDetallePedido) AS totalPedidos, SUM(dp.cantidadSolicitada) AS totalProductos, SUM(dp.cantidadSolicitada * p.precioVenta) AS totalGastado
FROM cliente cl
JOIN pedido pe ON cl.idCliente = pe.idCliente
JOIN detallespedido dp ON pe.idPedido = dp.idPedido
JOIN producto p ON dp.idProducto = p.idProducto
GROUP BY cl.idCliente;

-- Restaurar variables de entorno
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

