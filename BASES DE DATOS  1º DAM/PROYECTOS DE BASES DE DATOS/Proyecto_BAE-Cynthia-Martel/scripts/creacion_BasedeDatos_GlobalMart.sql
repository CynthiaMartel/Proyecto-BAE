-- phpMyAdmin SQL Dump Modificado
-- Versión: 5.2.1
-- Servidor: 127.0.0.1
-- Base de datos: gestioncompraglobalmart
-- Fecha: 14-03-2025

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

DROP DATABASE IF EXISTS `gestioncompraglobalmart`;
CREATE DATABASE `gestioncompraglobalmart`;
USE `gestioncompraglobalmart`;

-- Tabla: proveedor
CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `numeroTelefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_telefono` (`numeroTelefono`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla: producto
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `id_Proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `id_Proveedor` (`id_Proveedor`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_Proveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla: pedido
CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL AUTO_INCREMENT,
  `fechaPedido` date DEFAULT NULL,
  `fechaEntrega` date DEFAULT NULL,
  `estadoPedido` varchar(50) DEFAULT NULL,
  `importeTotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Tabla: detallespedido
CREATE TABLE `detallespedido` (
  `idDetallePedido` int(11) NOT NULL AUTO_INCREMENT,
  `id_Pedido` int(11) DEFAULT NULL,
  `id_Producto` int(11) DEFAULT NULL,
  `cantidadSolicitada` int(11) NOT NULL,
  `precioUnitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idDetallePedido`),
  KEY `id_Pedido` (`id_Pedido`),
  KEY `id_Producto` (`id_Producto`),
  CONSTRAINT `detallespedido_ibfk_1` FOREIGN KEY (`id_Pedido`) REFERENCES `pedido` (`idPedido`) ON DELETE CASCADE,
  CONSTRAINT `detallespedido_ibfk_2` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

