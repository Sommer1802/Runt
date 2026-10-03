-- RUNT | Ajuste: Persona usa el número de documento como llave
-- Ejecutar UNA vez sobre Database1. Borra Solicitud y Persona y las crea de nuevo
-- (se pierden los datos de prueba de esas dos tablas; Vehiculo y los catálogos no se tocan)

DROP TABLE Solicitud;
DROP TABLE Persona;

CREATE TABLE Persona (
    NumeroDocumento NVARCHAR(20) NOT NULL PRIMARY KEY,
    CodigoTipoDoc CHAR(1) NOT NULL,
    PrimerApellido NVARCHAR(40) NOT NULL,
    SegundoApellido NVARCHAR(40) NULL,
    Nombres NVARCHAR(60) NOT NULL,
    Direccion NVARCHAR(80) NOT NULL,
    Ciudad NVARCHAR(40) NOT NULL,
    Telefono NVARCHAR(15) NULL,
    FOREIGN KEY (CodigoTipoDoc) REFERENCES TipoDocumento(Codigo)
);

CREATE TABLE Solicitud (
    IdSolicitud INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    OrganismoNombre NVARCHAR(60) NOT NULL DEFAULT N'Servicios Integrales para la Movilidad - SIM',
    OrganismoCiudad NVARCHAR(30) NOT NULL DEFAULT N'Bogotá',
    OrganismoCodigo NVARCHAR(10) NOT NULL DEFAULT N'11001',
    FechaTramite DATE NOT NULL DEFAULT GETDATE(),
    Placa NVARCHAR(7) NOT NULL,
    IdTramite INT NOT NULL,
    IdPropietario NVARCHAR(20) NOT NULL,
    IdComprador NVARCHAR(20) NULL,
    Observaciones NVARCHAR(300) NULL,
    FOREIGN KEY (Placa) REFERENCES Vehiculo(Placa),
    FOREIGN KEY (IdTramite) REFERENCES Tramite(IdTramite),
    FOREIGN KEY (IdPropietario) REFERENCES Persona(NumeroDocumento),
    FOREIGN KEY (IdComprador) REFERENCES Persona(NumeroDocumento)
);