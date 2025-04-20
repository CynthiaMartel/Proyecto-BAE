# Portada
![Portada del proyecto](![Portada](https://raw.githubusercontent.com/cynthia-martel/Proyecto-BAE/main/BASES%20DE%20DATOS%201%C2%BA%20DAM/PROYECTOS%20DE%20BASES%20DE%20DATOS/Proyecto_BAE-Cynthia-Martel/recursos/Portada_Proyecto.jpg)



## Índice
### 1. Introducción
### 2. Análisis Enunciado
### 3. Modelo Relacional
### 4. Modelo Conceptual
### 5. Implementación MySQL
### 6. Consultas
### 7. Ampliación base datos
### 8. Vistas y Triggers
### 9. Pruebas y Validación
### 10. Conclusiones
### 11. Anexos

# 1. Introducción
En el presente informe abordamos el desarrollo de un sistema de gestión de compras para la empresa **GlobalMart Ltda**., realizado para el módulo de Base de Datos del primer curso del Ciclo Formativo de Desarrollo de Aplicaciones Multiplataformas. 

La realización de este proyecto, tiene como objetivo la aplicación de diferentes herramientas, conceptos y otros conocimientos que hemos ido adquiriendo a lo largo de las clases impartidas del módulo anteriormente mencionado. 

Durante el desarrollo del proyecto, se dispone el análisis inicial de las necesidades de la empresa GlobalMart Ldt., la identificación de entidades y atributos para el diseño de su modelo conceptual. 
Así mismo, y partiendo de este último, se trabajará en la creación del modelo relacional y su implementación en MySql con WorkBench, para después llevar a cabo la inserción de los datos correspondientes. Posteriormente se ejecutará la consulta de pruebas, creación de vistas y triggers para la mejora de la automatización y el acceso a las consultas informativas. 
Se propone, además, una serie de nuevas funcionalidades para la mejora de la gestión de compras de la empresa.

Por otra parte, se adjuntará una serie de scripts y otros recursos complementarios, a modo de enriquecer la información aportada.

Como resultado del trabajo realizado, se ejecutará un modelo de datos eficaz y bien estructurado que permita gestionar la información relacionada con proveedores, productos y pedidos, optimizando así los procesos internos de la empresa GlobalMart Ldta.

# 2. Análisis
Según el enunciado inicial presente en el archivo llamado “GlobalMart Ltda.md”, en donde se expone las necesidades y objetivos de la empresa con respecto al manejo de su base de datos, realizamos el siguiente análisis a modo de resumen.

## **Contexto y Desafíos** 🛠️:
 GlobalMart Ltda. enfrenta varios problemas operativos en su gestión de compras:
Falta de integración eficaz entre proveedores, productos y pedidos.
Dificultades para rastrear el historial de compras y el estado de los pedidos.
Gestión manual que puede genera errores y retrasos.

## **Necesidades del Sistema** 🎯:
Mejorar la integración: Conectar proveedores, productos y pedidos para evitar inconsistencias.
Control de inventarios: Facilitar el seguimiento del historial de compras y el estado de los pedidos.
Automatizar procesos: Reducir errores humanos, retrasos y acelerar tiempos de respuesta.
Análisis de datos: Proporcionar información organizada y actualizada, sobre rendimiento de proveedores, tendencias de compras y costos asociados.

📄 Se espera construir un sistema de gestión de compra que permita superar los desafíos actuales, mejorar la eficacia en la operativa de la empresa y la buena trazabilidad de los datos para el crecimiento futuro de la empresa .

## **Presentación de GlobalMart** 🌱♻️ (Presentación ficticia)

GlobalMart Ltd. es una empresa comprometida con el comercio sostenible y en disminuir el impacto ambiental. Nos dedicamos a la distribución de productos de papelería, electrónica, textiles y accesorios con un enfoque en el respeto ecológico y el apoyo a proveedores locales que comparten nuestros valores éticos.

En GlobalMart Ltd., tenemos la misión de impulsar un cambio en el paradigma de la cotidianidad: un compromiso ecológico real y el desarrollo de la economía local. Esto se refleja en:

- Catálogo 100% ecológico, con productos reciclados y reutilizables. 🌱
- Red de proveedores locales canarios para minimizar la huella de carbono y promover la economía circular. 💡
- Políticas de stock responsable, priorizando la calidad y la durabilidad. 💡
- Gestión eficiente de residuos y embalaje ecológico. ♻️


## Estructura del desarrollo 📝
El sistema se desarrolla siguiendo una estructura clara y organizada, que pretende facilitar la documentación del proyecto, así como su implementación. 
Se presenta aquí, la estructura propuesta que se ha seguido:

- 📄 Archivo informe.md: contiene toda la documentación técnica y funcional del sistema, desde el análisis hasta el modelo físico y conclusiones.

- 📁 Carpeta Scripts/: incluye los archivos .sql con las sentencias para la creación de tablas, inserción de datos y consultas informativas.

- 📁 Carpeta Recursos/: almacena información complementaria, referencias o ejemplos adicionales.

- 📁 Carpeta Capturas/: contiene imágenes del modelo entidad-relación y otras representaciones visuales que acompañan el análisis y diseño del sistema.

# 3. Modelo Conceptual

El modelo conceptual de la empresa GlobalMart Ldt., se orienta a la gestión de compras, contemplando los distintos elementos que intervienen en su relaciones y ejecución. 

Como buena práctica, el modelo conceptual es asienta las bases para la creación de la base de datos. Se realizó orientado al enfoque Entidad-Relación (E-R).

## *Entidades princpales del modelo conceptual* 📊
Se presenta a continuación, un análisis de las entidades clave que compondrá dicho modelo conceptual, cada una con sus respectivos atributos. La clave primaria se representa con “PK” (siglas que provienen de “Princpal Key”, en inglés), y la clave foránea con “FK” (siglas que provienen de “Foreing Key”, también en inglés). Se explicarán estos dos coceptos con más detenimiento en el apartado 3 de este informe.

1. *Proveedor*
Información sobre las empresas o personas que suministran productos.

- 🆔idProveedor (PK): Identificador único del proveedor.
-nombre: Nombre del proveedor o empresa.
-numeroTelefono: Teléfono de contacto del proveedor.
-direccion: Dirección postal del proveedor.
-email: Correo electrónico del proveedor.

2. *Producto*
Datos sobre los productos gestionados por la empresa.

- 🆔 idProducto (PK): Identificador único del producto.
- 🏷️ nombre: Nombre del producto.
- 🏷️ descripcion: Detalle o información adicional sobre el producto.
- 🏷️ precio: Precio unitario del producto.
- 🏷️ stock: Cantidad disponible en almacén.
- 🏷️ categoria: Clasificación del producto (ej. electrónica, hogar, etc.).
- 📚 id_Proveedor (FK): Clave foránea que relaciona el producto con su proveedor.

3. *Pedido*
Registro de cada compra realizada a un proveedor.

- 🆔idPedido (PK): Identificador único del pedido.
- 🏷️fechaPedido: Fecha en la que se realizó el pedido.
- 🏷️fechaEntrega: Fecha estimada o real de entrega del pedido.
- 🏷️estadoPedido: Estado actual del pedido (pendiente, enviado, entregado, etc.).
- 🏷️importeTotal: Monto total del pedido (calculado sumando los subtotales de los productos).

4. *DetallePedido*
Entidad intermedia para representar los productos incluidos en un pedido (relación muchos a muchos).

- 🆔 idDetallePedido (PK): Identificador único del detalle del pedido.
- 📚 id_Pedido (FK): Clave foránea que relaciona con el pedido correspondiente.
- 📚 id_Producto (FK): Clave foránea que relaciona con el producto correspondiente.
- 🏷️ cantidadSolicitada: Cantidad de unidades pedidas de ese producto.
- 🏷️ precioUnitario: Precio del producto en el momento del pedido.
- 🏷️ subtotal: Resultado de multiplicar la cantidad solicitada por el precio unitario.

## Relaciones entre Entidades 🔗
Para el funcionamiento de las tablas, estas necesitan de relaciones entre ellas. Estas son las relaciones princpales que completan el modelo conceptual:
- *(Proveedor – Producto)* 1:N : Un proveedor TIENE muchos productos, pero cada producto tiene un solo proveedor → relación 1:N entre Proveedor y Producto. 

- *(Producto- Pedido)* N:1 : Un producto CONTIENE varios pedidos, pero cada pedido corresponde a un solo producto  → relación N:1 entre Pedido y Proveedor. 

- *(Producto - Pedido - DetallePedido)* N:M Un pedido TIENE varios productos y cada producto puede estar en varios pedidos → relación N:M, resuelta con la entidad DetallePedido. 

## *Modelo Conceptual gráfico con draw io* 🔍
A continuación, se representa el corrrespondiente modelo conceptual desarrollado en Draw.io. De esta manera, se puede visualizar de manera gráfica, las entidades clave del sistema de gestión de compra de la empresa GlobalMart Ldt., donde se dibujan las entidades principales, sus atributos y las relaciones entre ellas.

![Modelo Conceptual](2.jpg)

# 4. Modelo Relacional
Gracias al modelo conceptual, que fue diseñado, explicado y representado gráficamente con la ayuda de herramientas como Draw.io en el apartado anterior, podemos entender las entidades del sistema y sus relaciones a un nivel básico. 

El modelo conceptual, nos sirve de referencia para construir posteriormente el modelo relacional. Esto nos ayuda a preparar su implementación en un sistema de gestión de base de datos como lo es MySQL, con el que hemos procedido a trabajar. 

En el modelo relacinoal, definimos las llamadas tablas con sus claves primarias (PK) y también, sus claves foráneas (FK).

## Transformación del Modelo Conceptual al Modelo Relacional 🔧
A partir del modelo conceptual, se realiza la siguiente transformación en el modelo relacional:

1. *Entidad → Tabla*
Cada entidad del modelo conceptual se convierte en una tabla relacional, con sus atributos como columnas.

2. *Atributos → Columnas*
Los atributos definidos para cada entidad se representan como columnas dentro de su respectiva tabla.

3. *Identificadores únicos → Claves Primarias (PK)*
Cada tabla debe tener una clave primaria (Primary Key), que garantiza que cada registro sea único.
Una PK es un atributo que identifica de forma única cada registro dentro de una tabla. Esta no puede tener valor nulo. 

4. *Relaciones entre entidades → Claves Foráneas (FK)*
Cuando una entidad está relacionada con otra (por ejemplo, un producto pertenece a un proveedor), se implementa una clave foránea (Foreign Key) en la tabla hija, apuntando a la clave primaria de la tabla padre.
La FK, es un atributo en una tabla que referencia la llave primaria de otra tabla. Esta sirve para crear relaciones entre tablas y mantener la integridad referencial, asegurandose de esta manera de que los datos relacionados existan.

5. *Relaciones muchos a muchos → Tablas intermedias*
Relaciones como Producto–Pedido (N:M) se transforman en una tabla intermedia llamada DetallePedido, que contiene claves foráneas de ambas tablas principales, junto con información adicional como cantidad o precio unitario.

Se despliega en esta página, una imagen del modelo relacional de la base de datos a modo de *diagrama EER* (por sus siglas en inglés, Enhanced Entity-Relationship) o Diagrama de Entidad-Relación Ampliado, en españo, e implementado en el software MySQL Workbench (explicado en el apartado 5 del siguiente informe).

Este diagrama es una representación gráfica avanzada de la base de datos que nos incumbe, mostrando de manera visual las entidades, atributos, relaciones, claves primarias y claves foráneas, además de conceptos más complejos como herencias y jerarquías.

![Modelo Relacional](3.jpg)

# 5. Implementación en MySQL
🧰 Una vez definido el modelo conceptual y transformado a su correspondiente modelo relacional, se procede a su implementación en MySQL. Para ello, se emplea el software MySQL Workbench, como pilar fundamental en la optimización del sistema de gestión de compras de la empresa GlobalMart Ltd. 

En esta línea, se expone a continuación el análisis del proceso de creación de la base de datos denominada gestionCompraGlobalmart, así como su implementación dentro del entorno gráfico proporcionado por MySQL Workbench. 

A continuación, se detallan los elementos esenciales de dicho proceso, con la finalidad de entender el ensamblaje interno que se ha seguido.

##  Entendiendo los elementos esenciales del proceso 🔎

- Para desarrollar la base de datos, utilizamos *SQL* (Structured Query Language), un lenguaje estándar empleado en la gestión de bases de datos relacionales. Este lenguaje permite definir la estructura de los datos mediante la creación de tablas, así como realizar consultas, inserciones, modificaciones y eliminaciones, además de establecer relaciones entre las distintas entidades del sistema.

- Asimismo, trabajamos con *MySQL*, un sistema de gestión de bases de datos relacional (RDBMS) que funciona como motor o servidor. Este sistema recibe instrucciones escritas en SQL y responde mediante la recuperación o manipulación de los datos almacenados.

- Ambos conceptos se integran en el entorno de *MySQL Workbench*, una herramienta con interfaz gráfica desarrollada por Oracle que facilita el trabajo con bases de datos MySQL. Esta aplicación permite diseñar esquemas de manera visual, redactar y ejecutar consultas SQL, administrar usuarios y permisos, así como exportar modelos conceptuales a scripts SQL. A propósito de ello, gracias a esta herramienta, fue posible elaborar el modelo relacional y generar el diagrama EER que se presentó en la página anterior a esta.

Es importante, por otro lado, tener en cuenta los tipos de datos seleccionados. Estos se han ajustados a las necesidades de la empresa y se han pensado para trabajar en una base de datos con mayor eficacia y manejabilidad. Se hace un resumen de estos, en el siguiente apartado.

## Tipos de datos seleccionados 📦
- *varchar*: utilizado en campos de texto de longitud variable. Concretamente en: `nombre`, `email`, `numeroTelefono`, `direccion`, `categoria` o `estadoPedido`. innecesario si el texto es corto.

- *text*: aplicado al campo `descripcion` en la tabla `producto`, adecuado para permitir descripciones más extensas.

- *decimal*(10,2): utilizado en campos de tipo monetario como `precio`, `importeTotal`, `precioUnitario` y `subtotal`, evitando errores de redondeo asociados a tipos como float.

- *int*(11): elegido para claves primarias (`idProducto`, `idProveedor`, `idPedido`, `idDetallePedido`), claves foráneas y campos de cantidad (`stock`, `cantidadSolicitada`). Permite trabajar con valores numéricos enteros, adecuados para identificadores y conteo.

- *date*: utilizado en los campos `fechaPedido` y `fechaEntrega`, apropiado para almacenar fechas sin incluir la hora, lo cual es suficiente en este contexto.

⚙️ Además, se optó por el motor de almacenamiento *InnoDB*, y por la codificación *utf8mb4*, adecuada para representar correctamente cualquier carácter, incluyendo símbolos especiales y emojis.

##Después de definir la consistencia de los datos 💻

A partir de esta base sólida en la definición de tipos de datos y su diseño relacional, se procedió a la implementación práctica de la base de datos dentro del entorno MySQL Workbenc, como se menciona anteriormente.

Esta herramienta, además de permitir la creación visual mediante el diagrama EER, facilita la generación automatizada del script SQL correspondiente.

Para ello, se hizo uso de la funcionalidad *Forward Engineer to Database*, que permitió transformar el modelo gráfico en un conjunto de ejecutables en MySQL. 

![Forward Engineer to Database](3.jpg)

El resultado fue la creación estructurada de todas las tablas necesarias, incluyendo sus campos, relaciones y restricciones de integridad.

![Tablas creadas en MySQL Workbrench](4.jpg)

Con estas decisiones, la base de datos queda optimizada para las necesidades actuales de gestión de compras de GlobalMart Ltd., y preparada para una futura posible escalabilidad.


## Insertando datos en la base de datos

Procedimos a la inserción de datos en la base de datos gestionCompraGlobalMart con el objetivo de poner en práctica su funcionamiento y comprobar que los procesos de carga y gestión se realizan correctamente. Así mismo, esta carga de datos resulta imprescindible para el desarrollo de los siguientes apartados de este informe.


![Insertando datos de prueba en base de datos](5.jpg)
![Insertando datos de prueba en base de datos](6.jpg)
![Insertando datos de prueba en base de datos](7.jpg)

# 6. Consultas Propuestas

📌 Una vez realizada la inserción de datos en las diferentes tablas de la base de datos gestionCompraGlobalMart, procedimos a la ejecución de diferentes consultas SQL con el objetivo de manipular, a forma de prueba, la información disponible, así como su analisis correspondiente.

A continuación se propone una lista de consultas realizadas, y se adjunta capturas de pantalla con algunos de los ejemplos de estas. Hay más ejemplos en la carpeta de scripts de este proyecto, además de las que aquí se muestra.

## 1. Consultas básicas con SELECT
Las consultas básicas permiten visualizar información específica de una o varias tablas. Son esenciales para la verificación de datos y la toma de decisiones.

Ejemplo de utilidad: En este caso, hicimos una verificación del listado de productos disponibles junto con su precio y stock para evaluar disponibilidad. 

![Consultas básicas con select](8.jpg)

## 2. Consultas de mantenimiento con INSERT, UPDATE, DELATE
Este tipo de consultas nos ayuda a mantener una integridad y actualización de la base de datos. 

Ejemplo de utilidad: Insertar un nuevo proveedor (INSERT). Actualizar (UPDATE) el número de unidades disponibles de un producto tras su venta. Eliminar (DELETE) un proveedor que ya no colabora con la empresa.

![Consultas INSERT](9.jpg)
![Consultas UPDATE](10.jpg)
![Consultas DELATE](11.jpg)

## 3. Consultas con JOIN
El uso de JOIN es clave para relacionar datos entre diferentes tablas. Permiten cruzar información de productos, proveedores y pedidos para obtener una visión más completa del sistema.

Ejemplo de utilidad: Saber qué proveedor suministró un producto vendido en un pedido específico.

![Consultas JOIN](11.jpg)

## 4. Consultas con WHERE
Aunque ya se ha visto su uso en las consultas de los anteriores apartados, merecen una mención especial, ya que, precisamente, permiten filtrar los datos según condiciones determinadas. Son fundamentales para localizar registros específicos.

Ejemplo de utilidad: Obtener los productos cuyo stock está por debajo de un cierto umbral para planificar reabastecimiento.

![Consultas WHERE](11.jpg)

## 5. Consultas con ORDER BY
Ordenan los resultados según un criterio, como precio, nombre o fecha. Esto facilita la visualización y el análisis.

Ejemplo de utilidad: Listar productos del más barato al más caro.

![Consultas ORDER BY](12.jpg)

## 6. Consultas con fechas
El manejo de fechas es esencial para realizar seguimientos temporales, como analizar entregas o pedidos en un rango determinado.

![Consultas DATE](13.jpg)

Ejemplo de utilidad: Ver todos los pedidos realizados durante el mes de marzo de 2025, o alguna fecha específica.

## 7. Consultas con funciones agregadas y GROUP BY
Permiten agrupar datos y realizar cálculos como sumas, promedios o conteos.

Ejemplo de utilidad: Calcular el importe total generado por cada pedido.

![Consultas GROUP BY](14.jpg)

## 8. Consultas con RANK y uso analítico
Las funciones analíticas como RANK() permiten clasificar los datos según criterios definidos, muy útiles en análisis comparativos.

Ejemplo de utilidad: Ver productos con mayor importe total o los más vendidos.

![Consultas RANK](15.jpg)

# 7.Ampliación de la base de datos 

A continuación se exponen algunas mejoras y ampliaciones, implementadas en el contexto de la empresa de la empresa de GlobalMart Ldt.

## 1- Como GlobalMart trabaja con productos sostenibles y ecológicos, se podría implementar la diferenciación de los productos certificados a través de un sistema que regustre esta información y pueda ser reutilizada.
Para ello creamos una tabla llamada *“certificacionesEcologicas”* relacionadas con la tabla “producto”, por medio de la creación de una tabla llamada “producto-certificacion”, con una relación de muchos a muchos (N:M).

![tabla cerificacionEcologica](16.jpg)

## 2- En línea con los valores éticos de sostenibilidad de la empresa, podríamos registrar indicadores ecológicos de cada producto, como la huella de carbono estimada, reciclabilidad, etc. Esto aportaría transparencia y valor informativo a los clientes. 

Para ello, creamos una tabla adicional de *“impactoAmbiental”*, que se relaciona con la tabla “producto”. Esto tiene una relación de uno a uno (N:N)

![tabla impactoambiental](17.jpg)

## 3- En la estructura de la base de datos de GlobalMart, los pedidos no están vinculados a ninguna persona o entidad compradora. Esto sería conveniente para futuras funcionalidades como por ejemplo reseñas por parte de clientes o fidelización a la hora de poder dar puntos de descuentos. Para ello, creamos la tabl*a “cliente”*.

![tabla cliente](18.jpg)

## 4- Así mismo, hacemos una normalización, por medio de la eliminación de *“categoria”* de la tabla producto, para crear una nueva tabla aparte llamada “categoria”. De esta forma, evitamos la redundancia de datos y aseguramos una mayor consistencia, ya que cada categoría se almacena una sola vez y puede ser referenciada por múltiples productos. 
Esto supone una relación entre categoria y producto de uno a muchos (N:N).

![tabla categoria](19.jpg)

## 5- Además de esta ampliación, se añade la mejora de la visualización sobre el control del stockage, para facilitar la reposición rápida e inmediata en caso de tener un stock bajo y que pueda comprometer el suministro de los pedidos demandados por los clientes.

Para ello, la vista “vistaProductosBajoStock” se crea con el objetivo de facilitar la consulta rápida y eficiente de productos cuyo stock es bajo. 
En este caso, hemos determinado que un stockage bajo significarán aquellos que tienen menos de 100 unidades disponibles en inventario.

![vistaProductoBajoStock](20.jpg)

 ##Modelo Relacional EER en MySQL Workbrench por ampliación

Gracias a la implementación de esta ampliación, obtenemos el siguiente modelo relacional con las correspondientes modificaciones y añadidos, que podemos apreciar de manera gráfica en el EER de MySQL Workbrench:

![Modelo Relacional ampliado](21.jpg)


# 8. Vistas y Triggers 

## Triggers 🔧

Un *Trigger*, en resuemen, es un bloque de código automático que se ejecuta cuando ocurre un evento en una tabla. Esto es, por ejemplo INSERT, UPDATE o DELETE. Los Triggers se utilizan para:

- Automatizar procesos, como puede ser actualizar un stock automáticamnete tras que se realice un pedido

- Validar reglas de negocio antes de permir cambios, como por ejemplo no permitir un stock negativo

- Realziar acciones invisibles para el usuario, como guardar historiales o calcular el total de cantidades que nos interesen.

Creamos un trigger llamado *“trActualizarStockDespuesDePedido”*, en donde actualizamos automaticamente el stock tras que se realice un pedido,  y otro trigger llamado *“trActualizarStockDespuesDePedido”*, para no permitir un stock negativo.

![Triggers](22.jpg)


## 👁️Vistas
Una *vista* es como una ventana virtual a los datos de una o más tablas. Esta muestra un conjunto de resultados personalizados según una consulta SELECT.
Sirven para:

- Simplificar consultas complejas, como unir varias tablas.

- Mostrar información específica sin exponer todas las columnas o tablas.

- Restringir el acceso a ciertos datos sensibles (por ejemplo, sin mostrar precios de coste).

- Para usarla como base de informes o visualización de interés, como por ejemplo la vista que muestre solo los productos ecológicos con stock bajo, en el apartado 7 de este informe.

Otra vista interesante, podría ser la detección de clientes frecuentes por medio de visualziar cuánto ha comprado cada cliente. Eso puede servir oara campañas de fidelización y mostrar estadísticas al respecto, que está en la lista con lo que se venía trabajando en el apartado de “Ampliación” anterior.

Para ello creamos la vista *“vistaResumenComprasClientes”*.

![Vistas](22.jpg)


# 9. Pruebas y validaciones

Se han realizado una serie de acciones para asegurar que la base de datos de GlobalMart sea coherente y consistente, esté integrada, y cumpla con la integridad, tanto de referencia, escalabilidad y optimización, para que pueda ejecutarse de manera eficaz. 

A modo de resumen, se ha implementado lo siguiente:

- *Pruebas de inserción*: Se insertaron registros realistas en diversas tablas (proveedor, producto, pedido, cliente, etc.) para un tipo de comercio ecológico. Esto validó que las claves foráneas, los tipos de datos y las relaciones N:1 y N:N estén correctamente definidas.

- *Validación de relaciones*: Se actualizaron pedidos para vincularlos con clientes, garantizando la integridad de claves externas. Las relaciones entre productos y pedidos también fueron verificadas.

- *Mejoras estructurales*: Se añadió la tabla intermedia “productoCertificacion” para productos con múltiples sellos ecológicos, y se incorporó una tabla de impacto ambiental para enriquecer el análisis ecológico de los productos.

- *Normalización, vistas y triggers*: Se normalizó la categoría de productos mediante una nueva tabla “categoria”, eliminando duplicidades y mejorando la clasificación de productos. También se creó una vista llamada “vistaProductosBajoStock”, para identificar productos con bajo stock. Por otro lado, se añadieron triggers para su mejora en cuanto a limitar el stokage negativo y automatización del stockage al hacer compras.

- *Pruebas de integridad*: Todos los campos se ajustaron a su contexto, evitando ambigüedades. Se realizaron pruebas de inserción (INSERT) y actualización de datos (UPDATE), validando que las relaciones y restricciones funcionaran correctamente.


# 10. Conclusiones

El proceso de desarrollo de la base de datos de GlobalMart ha sido un proyecto integral que abarca desde la planificación inicial hasta la implementación avanzada, mejorando tanto la estructura de datos como la eficiencia operativa de la gestión comercial. El proceso se puede dividir en varias fases clave, que incluyeron:

1- Creación del Modelo Conceptual y Modelo Relacional: Se identificaron las entidades clave (proveedores, productos, pedidos, clientes) y sus relaciones, transformándolas en un modelo relacional con tablas como proveedor, producto, y cliente, utilizando claves foráneas para mantener la integridad referencial.

2- La implementación en MySQL trabajando con el software MySQL Workbrench: Se creó la base de datos en MySQL, insertando datos iniciales para visualizar y comprobar el buen funcionamiento de la tienda y validar las relaciones creadas.

3- La implementación de ampliación de la base de datos inicial y mejora de esta: Se añadieron funcionalidades para mejorar la trazabilidad y análisis, como tablas para certificaciones ecológicas, impacto ambiental, clientes y categorías de productos.

4- Implementación de triggers y vistas, como características avanzadas para una mejora eficaz en el manejo de los datos: 
Vistas: Se crearon vistas para identificar productos con bajo stock y proporcionar resúmenes de compras por cliente, facilitando la gestión de inventarios y marketing.
Triggers: Se implementaron triggers para actualizar el stock automáticamente y evitar ventas con stock negativo, mejorando la automatización y evitando errores.

## Mejoras y Futuro  💾
Con el uso de vistas, triggers y la ampliación de la base de datos, el sistema de gestión de compras ha sido fortalecido, y ahora es más robusto para adaptarse a futuras ampliaciones y necesidades. Se espera que este sistema sea una herramienta eficaz para la gestión del inventario, la automatización de procesos y la toma de decisiones estratégicas para el crecimiento de GlobalMart.

# 10. Anexos
## 1- Análisis de posibles mejoras futuras 📝
Aunque la base de datos de GlobalMart está optimizada para cumplir con las necesidades actuales, sería conveniente explorar áreas de mejora para asegurar que el sistema continúe siendo robusto, escalable y adecuado a las futuras demandas del negocio. A continuación, se dan algunos detalles de las principales áreas de mejora:

1 - *Tecnologías Emergentes*:
 - Inteligencia Artificial: Usar machine learning para predecir tendencias de ventas y personalizar recomendaciones.
 - Comercio Electrónico y Móviles: Integrar la base de datos con plataformas adecuadas y desarrollar apps móviles para mejorar la experiencia del cliente.
 
2. *Seguridad y Protección de Datos*:
- Implementar encriptación para proteger datos sensibles y cumplir con las normativas de privacidad.

3. *Automatización de Procesos*:
- Gestión Automática de Inventarios: Ajustar el stock y realizar pedidos de manera automática.
- Generación Automática de Informes: Crear informes sobre ventas, inventarios y sostenibilidad.

5. *Nuevas Funcionalidades*:
 - Análisis Predictivo: Prever ventas y optimizar la distribución de productos.
 - Certificaciones y Personalización: Ampliar las certificaciones y ofrecer una experiencia más personalizada a los clientes, como por ejemplo, descuentos.

6. *Escalabilidad y Rendimiento*:
- Optimización para Grandes Volúmenes de Datos: Mejorar la capacidad de la base de datos para manejar grandes cantidades de información.
- Migración a la Nube: Aumentar la escalabilidad y disponibilidad del sistema.






























































































