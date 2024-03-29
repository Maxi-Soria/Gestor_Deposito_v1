USE master;
GO

CREATE DATABASE RMG_Database;
GO

USE RMG_Database;
GO

CREATE TABLE Usuarios(
ID_Usuario INT PRIMARY KEY IDENTITY(1,1),
Usuario VARCHAR(50) UNIQUE NOT NULL,
Contraseña VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL,
Telefono VARCHAR(100) NOT NULL,
)

GO 

CREATE TABLE Tipo_Clientes(
ID_Tipo_Cliente INT PRIMARY KEY,
Detalle_Cliente VARCHAR(200) NOT NULL DEFAULT '-',
)

GO

CREATE TABLE Clientes(
ID_Cliente INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(50) NULL DEFAULT '-',
Apellido VARCHAR(50) NULL DEFAULT '-',
NombreFantasia VARCHAR(150) NULL DEFAULT '-',
CUIT VARCHAR(50) NOT NULL UNIQUE,
Datos_Facturacion VARCHAR(200) NOT NULL,
Direccion VARCHAR(100) NOT NULL,
ID_TipoCliente INT NOT NULL FOREIGN KEY REFERENCES Tipo_Clientes(ID_Tipo_Cliente),
Aclaracion VARCHAR(200) NOT NULL, /*Aclaracion VARCHAR(200) NOT NULL FOREIGN KEY REFERENCES Tipo_Clientes(Detalle_Cliente),*/
Estado BIT NOT NULL DEFAULT 1 
)

GO

CREATE TABLE Camiones(
Patente VARCHAR(100) PRIMARY KEY,
Marca VARCHAR(100) NOT NULL,
Modelo VARCHAR(100) NOT NULL,
Capacidad DECIMAL NOT NULL,
Tara_Maxima DECIMAL NOT NULL,
Estado BIT NOT NULL DEFAULT 1,
)

GO

CREATE TABLE Destinos(
ID_Destino INT IDENTITY(1,1),
Provincia VARCHAR(100) NOT NULL,
Pais VARCHAR(20) NOT NULL,
Codigo_Postal VARCHAR(10) NOT NULL,
Direccion VARCHAR(100) NOT NULL,
Telefono VARCHAR(100) NOT NULL,
Persona_Responsable VARCHAR(200) NOT NULL,
Estado BIT NOT NULL DEFAULT 1,
PRIMARY KEY(Provincia,Pais,Direccion,Codigo_Postal,ID_Destino) /* PRIMARY KEY(Provincia,Pais,Direccion,Codigo_Postal)*/
)

GO

CREATE TABLE Docks(
Numero_Dock INT PRIMARY KEY,
Ubicacion VARCHAR(50) NOT NULL,
Capacidad INT NOT NULL,
Equipamiento VARCHAR(500) NOT NULL,
Estado BIT NOT NULL DEFAULT 1,
)

GO

CREATE TABLE Remitos(
Numero_Remito INT PRIMARY KEY,
ID_Usuario_Responsable INT NOT NULL FOREIGN KEY REFERENCES Usuarios(ID_Usuario),
Observaciones VARCHAR(200) NOT NULL DEFAULT 'Sin observaciones',
Estado BIT NOT NULL DEFAULT 1
)

GO

CREATE TABLE Choferes(
Legajo INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(100) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
DNI VARCHAR(20) NOT NULL,
Nacionalidad VARCHAR(20) NOT NULL,
Telefono VARCHAR(20) NOT NULL
)

GO

CREATE TABLE Ayudantes(
Legajo INT PRIMARY KEY IDENTITY(1,1),
Nombre VARCHAR(100) NOT NULL,
Apellido VARCHAR(100) NOT NULL,
DNI VARCHAR(20) NOT NULL,
Nacionalidad VARCHAR(20) NOT NULL,
Telefono VARCHAR(20) NOT NULL
)

--REVISAR SI ES NECESARIA LA TABLA AYUDANTES O SE PUEDE UNIFICAR CON CHOFERES EN EMPLEADOS

GO

CREATE TABLE Encomiendas(
ID_Encomienda INT NOT NULL IDENTITY(1,1),
Tipo_Encomienda VARCHAR(100) NOT NULL,
Numero_Remito INT NOT NULL FOREIGN KEY REFERENCES Remitos(Numero_Remito),
Numero_Delivery INT NOT NULL,
Cantidad_Bultos INT NOT NULL,
Descripcion_Encomienda VARCHAR(200) NOT NULL,
Legajo_Chofer INT NOT NULL FOREIGN KEY REFERENCES Choferes(Legajo),
Legajo_Ayudante INT NOT NULL FOREIGN KEY REFERENCES Ayudantes(Legajo),
Fecha_Carga DATETIME NOT NULL,
Fecha_Envio DATETIME NOT NULL,
Fecha_Recepcion DATETIME NOT NULL,
Costo MONEY NOT NULL,
MC INT NOT NULL,
Numero_Dock INT NOT NULL FOREIGN KEY REFERENCES Docks(Numero_Dock),
Patente_Camion VARCHAR(100) NOT NULL FOREIGN KEY REFERENCES Camiones(Patente),/* Patente_Camion int NOT NULL FOREIGN KEY REFERENCES Camiones(Patente)*/
ID_Destino INT NOT NULL FOREIGN KEY REFERENCES Destinos(ID_Destino),
Estado VARCHAR(20) NOT NULL
)

/*---------DATOS PARA LA TABLA-------------*/
INSERT INTO Tipo_Clientes (ID_Tipo_Cliente, Detalle_Cliente)
VALUES
(1,'Tipo A'),
(2,'Tipo B'),
(3,'Tipo C')

INSERT INTO Clientes (Nombre, Apellido, NombreFantasia, CUIT, Datos_Facturacion, Direccion, ID_TipoCliente, Aclaracion, Estado)
VALUES 
('Juan', 'Perez', 'JP Company', '123456789', 'Facturacion Juan Perez', 'Calle 123', 1, 'Detalle Cliente 1', 1),
('Maria', 'Gomez', 'MG Enterprises', '987654321', 'Facturacion Maria Gomez', 'Avenida 456', 2, 'Detalle Cliente 2', 1),
('Carlos', 'Lopez', 'CL Corp', '456789012', 'Facturacion Carlos Lopez', 'Calle Principal', 3, 'Detalle Cliente 3', 1)


/*-------- CONSULTAR TABLAS-------*/ 
SELECT * from Tipo_Clientes

SELECT * FROM Clientes