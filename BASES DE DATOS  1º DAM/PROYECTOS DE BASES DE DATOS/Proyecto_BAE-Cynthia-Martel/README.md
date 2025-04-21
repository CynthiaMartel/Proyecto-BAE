# Sistema de Gestión de Compras para GlobalMart Ltd. 🌿
Este proyecto consiste en el diseño e implementación de un sistema de *gestión de compra* para la empresa GlobalMart Ltd.

Se ha querido pensar en la utilización de un contexto que le de consistencia al trabajo que podríamos encontrar en una empresa distribuidora de productos.

En este sentido, a partir del enunciado propuesto por la asignatura de Base de Datos del primer curso de DAM, se ha construido a GlobalMart Ldt., como una empresa especializada en productos ecológicos. ♻️

Por ello, los datos insertados en su base de datos han sido adaptados específicamente para reflejar un contexto lo más realista posible, incorporando datos relacionados con productos ecológicos y direcciones reales pertenecientes a Gran Canaria y Tenerife, lo que refuerza el enfoque local y sostenible de la distribución.

El objetivo principal de este proyecto ha sido desarrollar una base de datos eficiente que permita organizar, gestionar y optimizar la gestión de productos, pedidos, y proveedores de manera eficiente, teniendo en cuenta sus necesidades principales.

Además, el sistema incluye automatizaciones mediante triggers y vistas personalizadas que mejoran el control del stock, la trazabilidad de pedidos y el análisis del comportamiento de los clientes.

A modo de resumen, presentamos lo siguiente:

# Características de la base de datos
- 📦 Gestión de productos ecológicos

- 📊 Gestión de pedidos y detalles de pedidos

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

📑 5. Consultas Propuestas con MySQL

🧪 6. Pruebas y verificación del sistema

## Tecnologías Utilizadas💻
- Base de Datos: MySQL
- Lenguaje de programación: SQL

## Herramientas 🛠️
- Draw.io → Diseño de modelo conceptual
  
- MySQL Workbench → Modelado y desarrollo de la base de datos

- GitHub → Control de versiones y documentación

- Markdown / PDF → Documentación técnica

##  Documentación 📝
🔸 Se ha generado documentación en dos formatos:

- 📄 README.md con lenguaje marcado para GitHub (markdown) como el que se lee en este archivo

- 🖼️ Archivo .pdf con el mismo contenido, pero presentado con un diseño visual y gráfico más elaborado, orientado a presentaciones o entregas formales

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

