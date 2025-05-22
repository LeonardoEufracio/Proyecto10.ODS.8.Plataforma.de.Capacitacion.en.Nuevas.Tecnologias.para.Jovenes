-- CREAR BASE DE DATOS
CREATE DATABASE PlataformaEducativa;
GO

-- USAR BASE DE DATOS
USE PlataformaEducativa;
GO

-- TABLA: USUARIOS
CREATE TABLE Usuarios (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Correo NVARCHAR(100) UNIQUE,
    Contrasena NVARCHAR(100)
);
GO

-- TABLA: CURSOS
CREATE TABLE Cursos (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100),
    Descripcion NVARCHAR(MAX),
    Categoria NVARCHAR(100),
    Duracion INT -- duraci�n en horas
);
GO

-- TABLA: INSCRIPCIONES
CREATE TABLE Inscripciones (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Id_Usuario INT,
    Id_Curso INT,
    Fecha_Inscripcion DATE,
    Progreso INT DEFAULT 0,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id),
    FOREIGN KEY (Id_Curso) REFERENCES Cursos(Id)
);
GO

-- TABLA: CERTIFICADOS
CREATE TABLE Certificados (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Id_Usuario INT,
    Id_Curso INT,
    Fecha_Emision DATE,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id),
    FOREIGN KEY (Id_Curso) REFERENCES Cursos(Id)
);
GO

-- TABLA: RECOMENDACIONES
CREATE TABLE Recomendaciones (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Id_Usuario INT,
    Id_Curso_Sugerido INT,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id),
    FOREIGN KEY (Id_Curso_Sugerido) REFERENCES Cursos(Id)
);
GO

--Ingreso de 3 registros al dbo. Usuario
select * from Usuarios
INSERT INTO Usuarios (Nombre, Correo, Contrasena)
VALUES 
('Luc�a Torres', 'lucia@mail.com', 'pass123'),
('Marco D�az', 'marco@mail.com', 'clave456'),
('Ana R�os', 'ana@mail.com', 'segura789');

--Ingreso de 3 registros al dbo. Curso
SELECT * FROM Cursos
INSERT INTO Cursos (Nombre, Descripcion, Categoria, Duracion)
VALUES 
('Introducci�n a HTML y CSS', 'Aprende a crear p�ginas web con HTML y CSS.', 'Desarrollo Web', 20),
('JavaScript B�sico', 'Conoce los fundamentos de programaci�n con JavaScript.', 'Programaci�n', 25),
('Fundamentos de Bases de Datos', 'Aprende a dise�ar y consultar bases de datos relacionales.', 'Tecnolog�a', 30);

-- Suponiendo que el Id_Usuario y Id_Curso corresponden a los IDs insertados arriba
SELECT * FROM Inscripciones
INSERT INTO Inscripciones (Id_Usuario, Id_Curso, Fecha_Inscripcion, Progreso)
VALUES 
(1, 1, '2025-05-20', 50),
(2, 2, '2025-05-21', 100),
(3, 3, '2025-05-22', 20);

-- Solo se insertan certificados si el curso fue finalizado (progreso 100)
SELECT * FROM Certificados
INSERT INTO Certificados (Id_Usuario, Id_Curso, Fecha_Emision)
VALUES 
(2, 2, '2025-06-01');

--3 registros de la db_recomendaciones
SELECT * FROM Recomendaciones
INSERT INTO Recomendaciones (Id_Usuario, Id_Curso_Sugerido)
VALUES 
(1, 2),
(2, 3),
(3, 1);


