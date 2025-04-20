USE `gestioncompraglobalmart`;

-- Insertar proveedores 
INSERT INTO proveedor (nombre, numeroTelefono, direccion, email) VALUES
('EcoPapelería Canarias', '928123456', 'Calle Triana 45, Las Palmas de Gran Canaria', 'contacto@ecopapeleriacanarias.com'),
('Verde Luz LED', '922654321', 'Av. La Salle 12, Santa Cruz de Tenerife', 'info@verdeluzled.com'),
('ReBottle Local', '928789123', 'Calle Primero de Mayo 10, Telde', 'ventas@rebottlelocal.es'),
('BioTextil Atlántico', '922321987', 'Calle Bethencourt Alfonso 88, La Laguna', 'hola@biotextilatlantico.es');

-- Insertar productos 
INSERT INTO producto (nombre, descripcion, precio, stock, categoria, id_Proveedor) VALUES
('Papel A4 reciclado', 'Papel A4 hecho con materiales 100% reciclados', 4.50, 300, 'Papelería', 1),
('Archivador reciclado', 'Archivador fabricado con cartón reciclado y sin plásticos', 2.80, 200, 'Papelería', 1),
('Bombilla LED ecológica', 'Bombilla de bajo consumo y larga duración', 3.20, 150, 'Electrónica ecológica', 2),
('Botella reciclada local', 'Botella reutilizable de plástico reciclado, producida en Canarias', 5.90, 250, 'Hidratación sostenible', 3),
('Cartera de material reciclado', 'Cartera fabricada con tejidos reciclados, diseño artesanal', 8.00, 120, 'Accesorios sostenibles', 4),
('Cuaderno ecológico', 'Cuaderno con tapa dura y hojas de papel reciclado', 3.60, 180, 'Papelería', 1),
('Ropa ecológica de fibra reciclada', 'Camiseta elaborada con fibras sintéticas reutilizadas', 15.00, 90, 'Ropa ecológica', 4),
('Lámpara LED bajo consumo', 'Lámpara portátil de mesa con tecnología LED eficiente', 12.50, 80, 'Electrónica ecológica', 2);

-- Insertar pedidos
INSERT INTO pedido (fechaPedido, fechaEntrega, estadoPedido, importeTotal) VALUES
('2025-03-01', '2025-03-05', 'Entregado', 38.10),
('2025-03-07', '2025-03-12', 'Entregado', 60.90), 
('2025-03-10', '2025-03-15', 'Pendiente', 25.90), 
('2025-03-15', '2025-03-18', 'Entregado', 43.50), 
('2025-03-20', '2025-03-25', 'Pendiente', 69.50); 

-- Insertar detalles de pedidos
INSERT INTO detallespedido (id_Pedido, id_Producto, cantidadSolicitada, precioUnitario, subtotal) VALUES
(1, 1, 3, 4.50, 13.50),
(1, 2, 2, 2.80, 5.60),
(1, 3, 2, 3.20, 6.40),
(1, 6, 3, 3.60, 10.80),

(2, 4, 5, 5.90, 29.50),
(2, 5, 2, 8.00, 16.00),
(2, 2, 1, 2.80, 2.80),
(2, 6, 3, 3.60, 10.80), 

(3, 3, 3, 3.20, 9.60),
(3, 1, 2, 4.50, 9.00),
(3, 6, 1, 3.60, 3.60),
(3, 2, 1, 2.80, 2.80),

(4, 7, 1, 15.00, 15.00),
(4, 5, 2, 8.00, 16.00),
(4, 8, 1, 12.50, 12.50),

(5, 8, 3, 12.50, 37.50),
(5, 7, 1, 15.00, 15.00),
(5, 3, 2, 3.20, 6.40),
(5, 1, 1, 4.50, 4.50),
(5, 4, 1, 5.90, 5.90); 







