Este proyecto consiste en el diseño e implementación de un sistema de gestión de compra para la empresa GlobalMart Ltd.

Se ha querido utilizar un contexto que le de más consistencia al trabajo con datos adaptados a los que podríamos encontrarnos en una empresa distribuidora de productos.

En este sentido, a partir del enunciado propuesto por la asignatura de Base de Datos del primer curso de DAM, GlobalMart Ldt., es una empresa especializada en productos ecológicos. 

Por ello, los datos usados en la gestión de su base de datos, ha sido adaptado específicamente para reflejar el contexto real de la empresa, incorporando datos relacionados con productos ecológicos y direcciones reales pertenecientes a Gran Canaria y Tenerife, lo que refuerza el enfoque local y sostenible de la distribución.

El objetivo principal ha sido desarrollar una base de datos eficiente que permita organizar, gestionar y optimizar el inventario de productos, pedidos, y proveedores de manera eficiente, teniendo en cuenta sus necesidades principales.

Además, el sistema incluye automatizaciones mediante triggers y vistas personalizadas que mejoran el control del stock, la trazabilidad de pedidos y el análisis del comportamiento de los clientes.

A modo de resumen, presentamos lo siguiente:

# Características
- 📦 Gestión de productos ecológicos

- 📊 Pedidos y detalles de pedidos

- 🌍 Gestión de proveedores

## Ampliación con:
- 🔄 Triggers

- 👀 Vistas

- 🌱 Certificaciones ecológicas

- 🧑‍💼 Gestión de clientes

## Proceso de desarrollo
📌 1. Modelo Conceptual: Se diseñó un esquema general de entidades y sus relaciones

🧩 2. Modelo Relacional: Convertido a través de MySQL Workbench en un modelo estructurado relacional

🧱 3. Implementación en MySQL: Creación de tablas, claves foráneas, restricciones y relaciones

📈 4. Ampliación de la Base de Datos

📑 5. Consultas Propuestas

🧪 6. Pruebas y verificación

## Tecnologías Utilizadas💻
- Base de Datos: MySQL
- Lenguaje de programación: SQL

## Herramientas 🛠️
- MySQL Workbench → Modelado y desarrollo de la base de datos.

- draw.io → Diseño de modelo conceptual.

- GitHub → Control de versiones y documentación.

- Markdown / PDF → Documentación técnica.

##  Documentación 📝
🔸 Se ha generado documentación en dos formatos:

- 📄 README.md con lenguaje marcado para GitHub (markdown) como el que estás leyendo.

- 🖼️ Archivo .pdf con el mismo contenido, pero presentado con un diseño visual y gráfico más elaborado, ideal para presentaciones o entregas formales.

## Estructura de la Base de Datos
La base de datos contiene las siguientes tablas principales:

- proveedor
- producto
- pedido
- detallespedido

## Ampliación 📈

- categoria
- cliente
- certificacionecologica
- productocertificacion
- impactoambiental

Además de las siguientes vistas y triggers:

- vistaProductosBajoStock 
- vistaResumenComprasClientes
- trActualizarStockDespuesDePedido (trigger automático de stock)
- trPrevenirStockNegativo (trigger preventivo de errores)

