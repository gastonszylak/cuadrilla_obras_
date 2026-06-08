  Análisis SQL: Gestión de Cuadrilla y Obras

Este proyecto es una base de datos relacional diseñada para gestionar y analizar la operatoria de una empresa de servicios de pintura.

##  Tecnologías Utilizadas
* **Lenguaje:** SQL
* **Motor de Base de Datos:** MySQL
* **Entorno:** Visual Studio Code / MySQL Workbench

## 📂 Estructura de la Base de Datos
El esquema relacional cuenta con tres tablas principales conectadas mediante *Foreign Keys*:
1. `pintores`: Registro del personal y sus especialidades (Látex, Epoxi, etc.).
2. `clientes`: Datos de contacto y locación.
3. `obras`: Tabla transaccional central que cruza la información de clientes, personal, fechas, tamaño del trabajo ($m^2$) y costos.

##  Consultas Analíticas (Queries)
El script incluye consultas de negocio para la toma de decisiones:
* **Agrupación y Totalización:** Cálculo de ingresos totales generados por cada empleado usando `GROUP BY` y `SUM()`.
* **Promedios Operativos:** Análisis del tamaño de obra promedio demandado por cliente utilizando `AVG()`.
* **Cruces de Datos:** Generación de reportes unificados empleando `JOIN` para conectar múltiples tablas.
