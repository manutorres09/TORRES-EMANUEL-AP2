CREATE DATABASE GestionProyectosFotograficos;

USE GestionProyectosFotograficos;

CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    nombreCliente VARCHAR(255) NOT NULL,
    emailCliente VARCHAR(255) NOT NULL,
    telefonoCliente VARCHAR(50)
);

CREATE TABLE Prioridades (
    idPrioridad INT PRIMARY KEY AUTO_INCREMENT,
    nivelPrioridad VARCHAR(50) NOT NULL,
    descripcionPrioridad VARCHAR(255)
);

CREATE TABLE Proyectos (
    idProyecto INT PRIMARY KEY AUTO_INCREMENT,
    nombreProyecto VARCHAR(255) NOT NULL,
    descripcionProyecto TEXT,
    fechaInicio DATE,
    fechaEntrega DATE,
    clienteId INT,
    prioridadId INT,
    FOREIGN KEY (clienteId) REFERENCES Clientes(idCliente),
    FOREIGN KEY (prioridadId) REFERENCES Prioridades(idPrioridad)  -- Relación añadida
);

CREATE TABLE Fotos (
    idFoto INT PRIMARY KEY AUTO_INCREMENT,
    nombreFoto VARCHAR(255) NOT NULL,
    fechaCaptura DATE,
    rutaFoto VARCHAR(255) NOT NULL,
    proyectoId INT,
    FOREIGN KEY (proyectoId) REFERENCES Proyectos(idProyecto)
);

CREATE TABLE Fotografos (
    idFotografo INT PRIMARY KEY AUTO_INCREMENT,
    nombreFotografo VARCHAR(255) NOT NULL,
    emailFotografo VARCHAR(255) NOT NULL,
    telefonoFotografo VARCHAR(50)
);

CREATE TABLE ProyectosFotografos (
    proyectoId INT,
    fotografoId INT,
    PRIMARY KEY (proyectoId, fotografoId),
    FOREIGN KEY (proyectoId) REFERENCES Proyectos(idProyecto),
    FOREIGN KEY (fotografoId) REFERENCES Fotografos(idFotografo)
);

-- insercion de datos en las tablas:
INSERT INTO Prioridades (nivelPrioridad, descripcionPrioridad) VALUES
('Alta', 'Prioridad alta para proyectos urgentes'),
('Media', 'Prioridad media para proyectos estándar'),
('Baja', 'Prioridad baja para proyectos a largo plazo');

INSERT INTO Fotografos (nombreFotografo, emailFotografo, telefonoFotografo) VALUES
('Juan Pérez', 'juan.perez@example.com', '123456789'),
('María Gómez', 'maria.gomez@example.com', '987654321');

INSERT INTO Clientes (nombreCliente, emailCliente, telefonoCliente) VALUES
('Cliente Uno', 'cliente1@example.com', '111222333'),
('Cliente Dos', 'cliente2@example.com', '444555666'),
('Cliente Tres', 'cliente3@example.com', '777888999');

INSERT INTO Proyectos (nombreProyecto, descripcionProyecto, fechaInicio, fechaEntrega, clienteId, prioridadId) VALUES
('Proyecto A', 'Descripción del Proyecto A', '2024-10-01', '2024-10-31', 1, 1),
('Proyecto B', 'Descripción del Proyecto B', '2024-10-02', '2024-11-01', 2, 2),
('Proyecto C', 'Descripción del Proyecto C', '2024-10-03', '2024-11-02', 3, 3);

-- Fotos para Cliente Uno (idCliente 1)
INSERT INTO Fotos (nombreFoto, fechaCaptura, rutaFoto, proyectoId) VALUES
('foto1_cliente1.jpg', '2024-10-01', '/ruta/foto1_cliente1.jpg', 1),
('foto2_cliente1.jpg', '2024-10-02', '/ruta/foto2_cliente1.jpg', 1),
('foto3_cliente1.jpg', '2024-10-03', '/ruta/foto3_cliente1.jpg', 1),
('foto4_cliente1.jpg', '2024-10-04', '/ruta/foto4_cliente1.jpg', 1),
('foto5_cliente1.jpg', '2024-10-05', '/ruta/foto5_cliente1.jpg', 1),
('foto6_cliente1.jpg', '2024-10-06', '/ruta/foto6_cliente1.jpg', 1),
('foto7_cliente1.jpg', '2024-10-07', '/ruta/foto7_cliente1.jpg', 1),
('foto8_cliente1.jpg', '2024-10-08', '/ruta/foto8_cliente1.jpg', 1),
('foto9_cliente1.jpg', '2024-10-09', '/ruta/foto9_cliente1.jpg', 1),
('foto10_cliente1.jpg', '2024-10-10', '/ruta/foto10_cliente1.jpg', 1);

-- Fotos para Cliente Dos (idCliente 2)
INSERT INTO Fotos (nombreFoto, fechaCaptura, rutaFoto, proyectoId) VALUES
('foto1_cliente2.jpg', '2024-10-01', '/ruta/foto1_cliente2.jpg', 2),
('foto2_cliente2.jpg', '2024-10-02', '/ruta/foto2_cliente2.jpg', 2),
('foto3_cliente2.jpg', '2024-10-03', '/ruta/foto3_cliente2.jpg', 2),
('foto4_cliente2.jpg', '2024-10-04', '/ruta/foto4_cliente2.jpg', 2),
('foto5_cliente2.jpg', '2024-10-05', '/ruta/foto5_cliente2.jpg', 2),
('foto6_cliente2.jpg', '2024-10-06', '/ruta/foto6_cliente2.jpg', 2),
('foto7_cliente2.jpg', '2024-10-07', '/ruta/foto7_cliente2.jpg', 2),
('foto8_cliente2.jpg', '2024-10-08', '/ruta/foto8_cliente2.jpg', 2),
('foto9_cliente2.jpg', '2024-10-09', '/ruta/foto9_cliente2.jpg', 2),
('foto10_cliente2.jpg', '2024-10-10', '/ruta/foto10_cliente2.jpg', 2);

-- Fotos para Cliente Tres (idCliente 3)
INSERT INTO Fotos (nombreFoto, fechaCaptura, rutaFoto, proyectoId) VALUES
('foto1_cliente3.jpg', '2024-10-01', '/ruta/foto1_cliente3.jpg', 3),
('foto2_cliente3.jpg', '2024-10-02', '/ruta/foto2_cliente3.jpg', 3),
('foto3_cliente3.jpg', '2024-10-03', '/ruta/foto3_cliente3.jpg', 3),
('foto4_cliente3.jpg', '2024-10-04', '/ruta/foto4_cliente3.jpg', 3),
('foto5_cliente3.jpg', '2024-10-05', '/ruta/foto5_cliente3.jpg', 3),
('foto6_cliente3.jpg', '2024-10-06', '/ruta/foto6_cliente3.jpg', 3),
('foto7_cliente3.jpg', '2024-10-07', '/ruta/foto7_cliente3.jpg', 3),
('foto8_cliente3.jpg', '2024-10-08', '/ruta/foto8_cliente3.jpg', 3),
('foto9_cliente3.jpg', '2024-10-09', '/ruta/foto9_cliente3.jpg', 3),
('foto10_cliente3.jpg', '2024-10-10', '/ruta/foto10_cliente3.jpg', 3);

INSERT INTO ProyectosFotografos (proyectoId, fotografoId) VALUES
(1, 1), 
(2, 2),  
(3, 1);  

-- Consultas de prueba
-- cantidad de fotos por cliente
SELECT c.nombreCliente, COUNT(f.idFoto) AS totalFotos
FROM Clientes c
JOIN Proyectos p ON c.idCliente = p.clienteId
JOIN Fotos f ON p.idProyecto = f.proyectoId
GROUP BY c.nombreCliente;

-- prioridades de proyectos
SELECT p.nombreProyecto, pr.nivelPrioridad
FROM Proyectos p
JOIN Prioridades pr ON p.prioridadId = pr.idPrioridad;

-- fotos asociadas a cliente 1
SELECT f.nombreFoto as 'Titulo de la foto', f.fechaCaptura, f.rutaFoto
FROM Fotos f
JOIN Proyectos p ON f.proyectoId = p.idProyecto
JOIN Clientes c ON p.clienteId = c.idCliente
WHERE c.nombreCliente = 'Cliente Uno';

-- clientes y proyectos asociados
SELECT c.idCliente, c.nombreCliente, p.nombreProyecto, p.descripcionProyecto
FROM Clientes c
JOIN Proyectos p ON c.idCliente = p.clienteId;
