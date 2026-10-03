CREATE TABLE Vehiculo (
    Placa NVARCHAR(7) NOT NULL PRIMARY KEY,                -- 2. Placa
    IdClase INT NOT NULL,                                  -- 4. Clase de vehículo
    IdMarca INT NOT NULL,                                  -- 5. Marca
    IdLinea INT NOT NULL,                                  -- 6. Línea
    IdCombustible INT NOT NULL,                            -- 7. Combustible
    Colores NVARCHAR(60) NOT NULL,                         -- 8. Colores (máximo tres)
    Modelo INT NOT NULL,                                   -- 9. Modelo
    Cilindrada INT NULL,                                   -- 10. Cilindrada
    Capacidad INT NULL,                                    -- 11. Capacidad (Kg / Psj.)
    Blindaje BIT NOT NULL DEFAULT 0,                       -- 12. Blindaje
    ResolucionBlindaje NVARCHAR(30) NULL,
    DesmonteBlindaje BIT NOT NULL DEFAULT 0,               -- 13. Desmonte de blindaje
    ResolucionDesmonte NVARCHAR(30) NULL,
    PotenciaHP INT NULL,                                   -- 14. Potencia / HP
    IdCarroceria INT NOT NULL,                             -- 15. Carrocería
    NumeroMotor NVARCHAR(30) NOT NULL,                     -- 16. Identificación interna
    MotorRegrabado BIT NOT NULL DEFAULT 0,
    NumeroChasis NVARCHAR(30) NOT NULL,
    ChasisRegrabado BIT NOT NULL DEFAULT 0,
    NumeroSerie NVARCHAR(30) NULL,
    SerieRegrabado BIT NOT NULL DEFAULT 0,
    NumeroVin NVARCHAR(30) NULL,
    DocImportacion TINYINT NULL,                           -- 17. Importación (1 a 3)
    RemateEntidad NVARCHAR(50) NULL,                       -- 17. Remate
    RemateCiudad NVARCHAR(40) NULL,
    RemateCodigo NVARCHAR(20) NULL,
    NumeroDocumento NVARCHAR(20) NULL,
    FechaDocumento DATE NULL,
    IdServicio INT NOT NULL,                               -- 18. Tipo de servicio
    EmpresaNombre NVARCHAR(60) NULL,                       -- 19. Empresa vinculadora
    EmpresaNit NVARCHAR(15) NULL,
    IdAlerta INT NULL,                                     -- 20. Datos de alerta
    AlertaAFavorDe NVARCHAR(60) NULL,
    FOREIGN KEY (IdClase) REFERENCES ClaseVehiculo(IdClase),
    FOREIGN KEY (IdMarca) REFERENCES Marca(IdMarca),
    FOREIGN KEY (IdLinea) REFERENCES Linea(IdLinea),
    FOREIGN KEY (IdCombustible) REFERENCES Combustible(IdCombustible),
    FOREIGN KEY (IdCarroceria) REFERENCES Carroceria(IdCarroceria),
    FOREIGN KEY (IdServicio) REFERENCES TipoServicio(IdServicio),
    FOREIGN KEY (IdAlerta) REFERENCES TipoAlerta(IdAlerta)
);
 
-- Campos 1, 3, 21, 22 y 23: el trámite que se solicita sobre un vehículo
CREATE TABLE Solicitud (
    IdSolicitud INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    OrganismoNombre NVARCHAR(60) NOT NULL DEFAULT N'Servicios Integrales para la Movilidad - SIM',  -- 1
    OrganismoCiudad NVARCHAR(30) NOT NULL DEFAULT N'Bogotá',
    OrganismoCodigo NVARCHAR(10) NOT NULL DEFAULT N'11001',
    FechaTramite DATE NOT NULL DEFAULT GETDATE(),
    Placa NVARCHAR(7) NOT NULL,                            -- 2
    IdTramite INT NOT NULL,                                -- 3. Trámite solicitado
    IdPropietario INT NOT NULL,                            -- 21. Propietario
    IdComprador INT NULL,                                  -- 22. Comprador (solo en traspaso)
    Observaciones NVARCHAR(300) NULL,                      -- 23. Observaciones
    FOREIGN KEY (Placa) REFERENCES Vehiculo(Placa),
    FOREIGN KEY (IdTramite) REFERENCES Tramite(IdTramite),
    FOREIGN KEY (IdPropietario) REFERENCES Persona(IdPersona),
    FOREIGN KEY (IdComprador) REFERENCES Persona(IdPersona)
);