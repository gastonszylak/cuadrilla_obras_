-- PROYECTO: Sistema de Gestión de Obras

-- 1. CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS gestion_cuadrilla;
USE gestion_cuadrilla;

-- 2. CREACIÓN DE TABLAS (DDL)
CREATE TABLE pintores (
    id_pintor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(150) NOT NULL
);

CREATE TABLE obras (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_pintor INT,
    fecha_inicio DATE,
    metros_cuadrados INT,
    costo_laboral DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_pintor) REFERENCES pintores(id_pintor)
);

-- 3. INSERCIÓN DE DATOS (DML)
INSERT INTO pintores (nombre, especialidad) VALUES 
('Luis', 'Látex'),
('Carlos', 'Epoxi'),
('Juan', 'Sintético');

INSERT INTO clientes (nombre, direccion) VALUES 
('Constructora Mendoza', 'Av. San Martín 1200, San Rafael'),
('Hospital Regional', 'Emilio Civit 150, San Rafael'),
('Edificio Los Andes', 'Hipólito Yrigoyen 450, San Rafael');

INSERT INTO obras (id_cliente, id_pintor, fecha_inicio, metros_cuadrados, costo_laboral) VALUES 
(1, 1, '2023-10-01', 350, 150000.00),
(1, 2, '2023-10-15', 120, 85000.00),
(2, 3, '2023-11-05', 500, 320000.00),
(3, 1, '2023-11-20', 200, 95000.00);

-- 4. CONSULTAS DE ANÁLISIS DE DATOS 

-- A. Ingresos totales generados por cada pintor
SELECT 
    p.nombre AS Pintor, 
    SUM(o.costo_laboral) AS Total_Facturado
FROM obras o
JOIN pintores p ON o.id_pintor = p.id_pintor
GROUP BY p.nombre
ORDER BY Total_Facturado DESC;

-- B. Tamaño promedio de las obras por cliente
SELECT 
    c.nombre AS Cliente, 
    AVG(o.metros_cuadrados) AS Promedio_Metros
FROM obras o
JOIN clientes c ON o.id_cliente = c.id_cliente
GROUP BY c.nombre;

-- C. Listado completo de obras con todos los detalles cruzados
SELECT 
    o.id_obra, 
    c.nombre AS Cliente, 
    p.nombre AS Pintor, 
    o.metros_cuadrados, 
    o.costo_laboral
FROM obras o
JOIN clientes c ON o.id_cliente = c.id_cliente
JOIN pintores p ON o.id_pintor = p.id_pintor;
