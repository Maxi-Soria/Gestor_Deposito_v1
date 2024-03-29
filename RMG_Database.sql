CREATE DATABASE RMG_Database

GO

CREATE TABLE Usuarios(
ID_Usuario INT PRIMARY KEY IDENTITY(1,1),
Usuario VARCHAR(50) UNIQUE NOT NULL,
Contraseña VARCHAR(100) NOT NULL,
Email VARCHAR(100) NOT NULL,
Telefono VARCHAR(100) NOT NULL,
Tipo_Usuario VARCHAR(20) NOT NULL,
Codigo_Usuario INT NOT NULL
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
Aclaracion VARCHAR(200) NOT NULL FOREIGN KEY REFERENCES Tipo_Clientes(Detalle_Cliente),
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
PRIMARY KEY(Provincia,Pais,Direccion,Codigo_Postal)
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
Patente_Camion INT NOT NULL FOREIGN KEY REFERENCES Camiones(Patente),
ID_Destino INT NOT NULL FOREIGN KEY REFERENCES Destinos(ID_Destino),
Estado VARCHAR(20) NOT NULL
)

SELECT * FROM Usuarios

INSERT INTO Usuarios (Usuario, Contraseña, Email, Telefono, Tipo_Usuario, Codigo_Usuario)
VALUES ('RRODRIGUEZ', 'Raul*12345', 'raul.rodriguez@rmg.com', '123456789', 'Administrativo', 2);

INSERT INTO Usuarios (Usuario, Contraseña, Email, Telefono, Tipo_Usuario, Codigo_Usuario)
VALUES ('MSORIA', 'Maxi*12345', 'maximiliano.soria@rmg.com', '987654321', 'Administrativo', 2);

INSERT INTO Usuarios (Usuario, Contraseña, Email, Telefono, Tipo_Usuario, Codigo_Usuario)
VALUES ('GLIGERO', 'Gonza*12345', 'gonzalo.ligero.com', '123654789', 'Administrativo', 2);

INSERT INTO Usuarios (Usuario, Contraseña, Email, Telefono, Tipo_Usuario, Codigo_Usuario)
VALUES ('CocaCola', 'Coca123', 'contacto@cocacola.com', '987654321', 'Cliente', 3);

INSERT INTO Usuarios (Usuario, Contraseña, Email, Telefono, Tipo_Usuario, Codigo_Usuario)
VALUES ('Adidas', 'Adodas123', 'contacto@adidas.com', '987654321', 'Cliente', 3);

INSERT INTO Usuarios (Usuario, Contraseña, Email, Telefono, Tipo_Usuario, Codigo_Usuario)
VALUES ('Ford', 'Ford123', 'contacto@ford.com', '987654321', 'Cliente', 3);

SELECT * FROM Usuarios