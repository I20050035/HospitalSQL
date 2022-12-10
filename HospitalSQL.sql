USE MASTER;
GO
IF DB_ID (N'Hospital') is not null
DROP DATABASE Hospital;
GO
CREATE DATABASE Hospital
ON
(NAME = Hospital_dat,
FILENAME = 'C:\BASES DE DATOS\Hospital\Hospital.mdf',
SIZE = 10,
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON
(NAME = Hospital_log,
FILENAME = 'C:\BASES DE DATOS\Hospital\Hospital.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Hospital;
GO

--Almacen--
CREATE TABLE Almacen
(
IdAlmacen INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
--LlavePrimaria Almacen
ALTER TABLE Almacen
ADD CONSTRAINT Pk_Almacen PRIMARY KEY (IdAlmacen)
--AltaMedica--
CREATE TABLE AltaMedica
(
IdAltaMedica INT IDENTITY (1,1),
Fecha Date,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
--LlavePrimaria AltaMedica
ALTER TABLE AltaMedica
ADD CONSTRAINT Pk_AltaMedica PRIMARY KEY (IdAltaMedica)
--Ambulancia--
CREATE TABLE Ambulancia
(
IdAmbulancia INT IDENTITY (1,1),
NumAmbulancia int not null,
estatus BIT DEFAULT 1 NOT NULL
);

ALTER TABLE Ambulancia
ADD CONSTRAINT Pk_Ambulancia PRIMARY KEY (IdAmbulancia)

--AnalisisMedico--
CREATE TABLE AnalisisMedico
(
IdAnalisisMedico INT IDENTITY (1,1),
NumAmbulancia Date,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);


ALTER TABLE Ambulancia
ADD CONSTRAINT Pk_Ambulancia PRIMARY KEY (IdAmbulancia)

--Asamblea --
CREATE TABLE Asamblea 
(
IdAsamblea  INT IDENTITY (1,1),
Fecha Datetime,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdHorario INT NOT NULL
);
ALTER TABLE Asamblea
ADD CONSTRAINT Pk_Asamblea PRIMARY KEY (IdAsamblea)

CREATE TABLE Area 
(
IdArea INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdTipoDeArea INT NOT NULL,
);
ALTER TABLE Area
ADD CONSTRAINT Pk_Area PRIMARY KEY (IdArea)

CREATE TABLE Articulo 
(
IdArticulo  INT IDENTITY (1,1),
nombreArticulo Date,
cantidad VARCHAR(50) NOT NULL,
descripcion_Articulo VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);

ALTER TABLE Articulo
ADD CONSTRAINT Pk_Articulo PRIMARY KEY (IdArticulo)

--Cama --
CREATE TABLE Cama 
(
IdCama  INT IDENTITY (1,1),
numCama VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);

ALTER TABLE Cama
ADD CONSTRAINT Pk_Cama PRIMARY KEY (IdCama)

--CartillaSalud --
CREATE TABLE CartillaSalud 
(
IdCartillaSalud  INT IDENTITY (1,1),
Nss VARCHAR(50) NOT NULL,
NoRegistro VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
ALTER TABLE CartillaSalud
ADD CONSTRAINT Pk_CartillaSalud PRIMARY KEY (IdCartillaSalud)

--CedulaMedica --
CREATE TABLE CedulaMedica 
(
IdCedulaMedica INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
numCedulaMedica INT NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
Especialidad INT NOT NULL,
);
ALTER TABLE CedulaMedica
ADD CONSTRAINT Pk_CedulaMedica PRIMARY KEY (IdCedulaMedica)

CREATE TABLE Cirugia 
(
IdCirugia INT IDENTITY (1,1),
Fecha Date,
noCirugia VARCHAR(50) NOT NULL,
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
ALTER TABLE Cirugia
ADD CONSTRAINT Pk_Cirugia PRIMARY KEY (IdCirugia)

--Cliente --
CREATE TABLE Cliente 
(
IdCliente INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
apellidoPaterno VARCHAR(50) NOT NULL,
apellidoMaterno VARCHAR(50) NOT NULL,
curp VARCHAR(50) NOT NULL,
calle VARCHAR(50) NOT NULL,
colonia VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
numero VARCHAR(50) NOT NULL,
codigopostal VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdFacturaCliente INT NOT NULL,
IdPagoCliente INT NOT NULL,
IdCompraCliente INT NOT NULL
);
ALTER TABLE Cliente
ADD CONSTRAINT Pk_Cliente PRIMARY KEY (IdCliente)

--Cita --
CREATE TABLE Cita 
(
IdCita INT IDENTITY (1,1),
numCita int,
fecha Date,
estatus BIT DEFAULT 1 NOT NULL
);
ALTER TABLE Cita
ADD CONSTRAINT Pk_Cita PRIMARY KEY (IdCita)

CREATE TABLE ClinicaMedica 
(
IdClinicaMedica INT IDENTITY (1,1),
NoClinica VARCHAR(50) NOT NULL,
NombreClinicaMedica VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
ALTER TABLE ClinicaMedica
ADD CONSTRAINT Pk_ClinicaMedica PRIMARY KEY (IdClinicaMedica)

--Comida --
CREATE TABLE Comida 
(
IdComida INT IDENTITY (1,1),
NombreComida VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
ALTER TABLE Comida
ADD CONSTRAINT Pk_Comida PRIMARY KEY (IdComida)

CREATE TABLE Compra 
(
IdCompra INT IDENTITY (1,1),
fecha Date,
estatus BIT DEFAULT 1 NOT NULL,
IdArticulo INT NOT NULL
);
ALTER TABLE Compra
ADD CONSTRAINT Pk_Compra PRIMARY KEY (IdCompra)

CREATE TABLE CompraPaciente
(
IdCompraPaciente INT IDENTITY (1,1),
fecha Date,
estatus BIT DEFAULT 1 NOT NULL
);
ALTER TABLE CompraPaciente
ADD CONSTRAINT Pk_CompraPaciente PRIMARY KEY (IdCompraPaciente)

CREATE TABLE ConsultaMedica
(
IdConsultaMedica INT IDENTITY (1,1),
fecha Date,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
ALTER TABLE ConsultaMedica
ADD CONSTRAINT Pk_ConsultaMedica PRIMARY KEY (IdConsultaMedica)

CREATE TABLE Farmacia
(
IdFarmacia INT IDENTITY (1,1),
lugar VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdMedicamento INT NOT NULL,
IdArticulo INT NOT NULL,
IdPagoCliente INT NOT NULL,
IdCompraCliente INT NOT NULL,
--LlavePrimaria
CONSTRAINT Pk_IdFarmacia PRIMARY KEY (IdFarmacia)
);
CREATE TABLE Habitacion
(
IdHabitacion INT IDENTITY (1,1),
lugar VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Habitacion PRIMARY KEY (IdHabitacion)
);

CREATE TABLE Edificio
(
IdEdificio INT IDENTITY (1,1),
noEdificio VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdElevador INT NOT NULL,
IdFarmacia INT NOT NULL,
IdArea INT NOT NULL,
IdReglamento INT NOT NULL,
IdHabitacion INT NOT NULL,
);

ALTER TABLE Edificio
ADD CONSTRAINT Pk_Edificio PRIMARY KEY (IdEdificio)

CREATE TABLE Elevador
(
IdElevador INT IDENTITY (1,1),
numElevador VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
);
ALTER TABLE Elevador
ADD CONSTRAINT Pk_Elevador PRIMARY KEY (IdElevador)

CREATE TABLE Empleado
(
IdEmpleado INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
apellidoPaterno VARCHAR(50) NOT NULL,
apellidoMaterno VARCHAR(50) NOT NULL,
RFC VARCHAR(50) NOT NULL,
calle VARCHAR(50) NOT NULL,
colonia VARCHAR(50) NOT NULL,
numero VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
--Foraneas
IdConsultaMedica INT NOT NULL,
IdAnalisMedico  INT NOT NULL,
IdTratamiento  INT NOT NULL,
IdComida  INT NOT NULL,
IdRecetaMedica  INT NOT NULL,
IdClinicaMedica  INT NOT NULL,
IdCompra  INT NOT NULL,
IdCedulaMedica  INT NOT NULL,
IdCirugia  INT NOT NULL,
IdAsamblea  INT NOT NULL,
IdTransporteEmpleado  INT NOT NULL,
IdMantenimiento  INT NOT NULL
--LlavePrimaria
CONSTRAINT PkEmpleado PRIMARY KEY (IdEmpleado)
);

--Enfermedad --

CREATE TABLE Enfermedad
(
IdEnfermedad  INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdTipoEnfermedad  INT NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Enfermedad PRIMARY KEY (IdEnfermedad)
);

--Equipo --
CREATE TABLE Equipo
(
IdEquipo INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
cantidad VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Equipo PRIMARY KEY (IdEquipo)

);
--Especialidad --
CREATE TABLE Especialidad
(
IdEspecialidad INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Especialidad PRIMARY KEY (IdEspecialidad)

);
--Estudiante --
CREATE TABLE Estudiante
(
IdEstudiante INT IDENTITY (1,1),
nombreEstudiante VARCHAR(50) NOT NULL,
apellidoPaterno VARCHAR(50) NOT NULL,
apellidoMaterno VARCHAR(50) NOT NULL,
matricula VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Estudiante PRIMARY KEY (IdEstudiante)
);

--Evento --
CREATE TABLE Evento
(
IdEvento INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
fecha Date,
direccion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdHorario INT NOT NULL,
IdAsamblea INT NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Evento PRIMARY KEY (IdEvento)
);

CREATE TABLE ExpedienteMedico
(
IdExpedienteMedico INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_ExpedienteMedico PRIMARY KEY (IdExpedienteMedico)
);

CREATE TABLE FacturaCliente
(
IdFacturaCliente INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
cantidad VARCHAR(50) NOT NULL,
fecha Date,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_FacturaCliente PRIMARY KEY (IdFacturaCliente)
);
--FacturaProveedor --
CREATE TABLE FacturaProveedor
(
IdFacturaProveedor INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
cantidad VARCHAR(50) NOT NULL,
fecha Date,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_FacturaProveedor PRIMARY KEY (IdFacturaProveedor)
);

CREATE TABLE Horario
(
IdHorario INT IDENTITY (1,1),
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Horario PRIMARY KEY (IdHorario)
);

CREATE TABLE Ingreso
(
IdIngreso INT IDENTITY (1,1),
numero VARCHAR(50) NOT NULL,
fecha Date,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Ingreso PRIMARY KEY (IdIngreso)
);

CREATE TABLE Mantenimiento
(
IdMantenimiento INT IDENTITY (1,1),
descripcion VARCHAR(50) NOT NULL,
fecha Date,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_IdMantenimiento PRIMARY KEY (IdMantenimiento)
);
CREATE TABLE Medicamento
(
IdMedicamento INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
fecha Date,
estatus BIT DEFAULT 1 NOT NULL,
--LlavePrimaria
CONSTRAINT Pk_Medicamento PRIMARY KEY (IdMedicamento)
);
CREATE TABLE Paciente
(
IdPaciente INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
fecha Date,
estatus BIT DEFAULT 1 NOT NULL,
--Foraneas
IdEnfermedad INT NOT NULL,
IdCitaMedica INT NOT NULL,
IdCama INT NOT NULL,
IdAltaMedica INT NOT NULL,
IdConsultaMedica INT NOT NULL,
IdAnalisMedico  INT NOT NULL,
IdTratamiento  INT NOT NULL,
IdComida  INT NOT NULL,
IdRecetaMedica  INT NOT NULL,
IdClinicaMedica  INT NOT NULL,
IdExpedienteMedico  INT NOT NULL,
IdCartillaSalud  INT NOT NULL,
IdIngreso  INT NOT NULL,
IdCedulaMedica  INT NOT NULL,
IdCirugia  INT NOT NULL,
IdAsamblea  INT NOT NULL,
IdTransporteEmpleado  INT NOT NULL,
IdMantenimiento  INT NOT NULL
--LlavePrimaria
CONSTRAINT PkPaciente PRIMARY KEY (IdPaciente)
);

CREATE TABLE PagoUnidadMedica
(
IdPagoUnidadMedica INT IDENTITY (1,1),
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_PagoUnidadMedica PRIMARY KEY (IdPagoUnidadMedica)
);
CREATE TABLE PagoCliente
(
IdPagoCliente INT IDENTITY (1,1),
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_PagoCliente PRIMARY KEY (IdPagoCliente)
);
CREATE TABLE Practicante
(
IdPracticante INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
apellidoPaterno VARCHAR(50) NOT NULL,
apellidoMaterno VARCHAR(50) NOT NULL,
matricula VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Practicante PRIMARY KEY (IdPracticante)
);
CREATE TABLE Proveedor
(
IdProveedor INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
rfc VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
calle VARCHAR(50) NOT NULL,
numero int,
colonia VARCHAR(50) NOT NULL,
codigopostal VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdFacturaProveedor INT NOT NULL,

--LlavePrimaria
CONSTRAINT Pk_Proveedor PRIMARY KEY (IdProveedor)
);

CREATE TABLE RecetaMedica
(
IdRecetaMedica INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdMedicamento  int not null
--LlavePrimaria
CONSTRAINT Pk_RecetaMedica PRIMARY KEY (IdRecetaMedica)
);

CREATE TABLE Reglamento
(
IdReglamento INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Reglamento PRIMARY KEY (IdReglamento)
);

CREATE TABLE Residencia
(
IdResidencia INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdPracticante  int not null
--LlavePrimaria
CONSTRAINT Pk_Residencia PRIMARY KEY (IdResidencia)
);
CREATE TABLE ServicioSanitario
(
IdServicioSanitario INT IDENTITY (1,1),
fecha Date,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_ServicioSanitario PRIMARY KEY (IdServicioSanitario)
);

CREATE TABLE ServicioSocial
(
IdServicioSocial INT IDENTITY (1,1),
fecha Date,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdEstudiante  int not null
--LlavePrimaria
CONSTRAINT Pk_ServicioSocial PRIMARY KEY (IdServicioSocial)
);
CREATE TABLE TipoArea
(
IdTipoArea INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_TipoArea PRIMARY KEY (IdTipoArea)
);
CREATE TABLE TipoEnfermedad
(
IdTipoEnfermedad INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_TipoEnfermedad PRIMARY KEY (IdTipoEnfermedad)
);

CREATE TABLE TransporteEmpleado
(
IdTransporteEmpleado INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_TransporteEmpleado PRIMARY KEY (IdTransporteEmpleado)
);
CREATE TABLE Tratamiento
(
IdTratamiento INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Tratamiento PRIMARY KEY (IdTratamiento)
);
CREATE TABLE UnidadMedica
(
IdUnidadMedica INT IDENTITY (1,1),
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
colonia VARCHAR(20) NOT NULL,
estado VARCHAR(20) NOT NULL,
municipio VARCHAR(20) NOT NULL,
calle VARCHAR(20) NOT NULL,
numero INT NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
--Foraneas
IdEdificio INT NOT NULL,
IdEquipo INT NOT NULL,
IdResidencia INT NOT NULL,
IdServicioSanitario INT NOT NULL,
IdAlmacen INT NOT NULL,
IdPagoUnidadMedica INT NOT NULL,
IdEmpleado INT NOT NULL,
IdReglamento INT NOT NULL,
IdAsamblea INT NOT NULL,
IdEvento INT NOT NULL,
IdVisita INT NOT NULL,
IdHorario INT NOT NULL,
IdServicioSocial INT NOT NULL,
IdCliente INT NOT NULL,
IdAmbulancia INT NOT NULL,
IdFacturaCliente INT NOT NULL,
);
--LlavePrimaria
ALTER TABLE UnidadMedica
ADD CONSTRAINT PkUnidadMedica PRIMARY KEY (IdUnidadMedica)
CREATE TABLE Visita
(
IdVisita INT IDENTITY (1,1),
numVisita VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
estatus BIT DEFAULT 1 NOT NULL,
IdHorario INT NOT NULL
--LlavePrimaria
CONSTRAINT Pk_Visita PRIMARY KEY (IdVisita)
);


--Alter Table UnidadMedica
ALTER TABLE UnidadMedica
ADD CONSTRAINT FkPagoUnidadMedica FOREIGN KEY (IdPagoUnidadMedica) REFERENCES PagoUnidadMedica (IdPagoUnidadMedica)
--Alter Table UnidadMedica
ALTER TABLE UnidadMedica
ADD CONSTRAINT fkEdificio FOREIGN KEY (IdEdificio) REFERENCES Edificio (IdEdificio)
--Alter Table UnidadMedica
ALTER TABLE UnidadMedica
ADD CONSTRAINT fkEquipo FOREIGN KEY (IdEquipo) REFERENCES Equipo (IdEquipo)
--Alter Table UnidadMedica
ALTER TABLE UnidadMedica
ADD CONSTRAINT fkResidencia FOREIGN KEY (IdResidencia) REFERENCES Residencia (IdResidencia)
--Alter Table UnidadMedica
ALTER TABLE UnidadMedica
ADD CONSTRAINT fkServicioSanitario FOREIGN KEY (IdServicioSanitario) REFERENCES IdServicioSanitario (IdServicioSanitario)
--Alter Table UnidadMedica
ALTER TABLE UnidadMedica
ADD CONSTRAINT fkAlmacen FOREIGN KEY (IdAlmacen) REFERENCES Almacen (IdAlmacen)

--Alter Table UnidadMedica
ALTER TABLE UnidadMedica
ADD CONSTRAINT fkEmpleado FOREIGN KEY (IdEmpleado) REFERENCES Empleado (IdEmpleado)
--Alter Table UnidadMedica
ALTER TABLE UnidadMedica
ADD CONSTRAINT fkReglamento FOREIGN KEY (IdReglamento) REFERENCES Reglamento (IdReglamento)

ALTER TABLE UnidadMedica
ADD CONSTRAINT fkAsamblea FOREIGN KEY (IdAsamblea) REFERENCES Asamblea (IdAsamblea)

ALTER TABLE UnidadMedica
ADD CONSTRAINT fkEvento FOREIGN KEY (IdEvento) REFERENCES Evento (IdEvento)

ALTER TABLE UnidadMedica
ADD CONSTRAINT fkVisita FOREIGN KEY (IdVisita) REFERENCES Visita (IdVisita)

ALTER TABLE UnidadMedica
ADD CONSTRAINT fkHorario FOREIGN KEY (IdHorario) REFERENCES Horario (IdHorario)

ALTER TABLE UnidadMedica
ADD CONSTRAINT fkServicioSocial FOREIGN KEY (IdServicioSocial) REFERENCES ServicioSocial (IdServicioSocial)

ALTER TABLE UnidadMedica
ADD CONSTRAINT fkCliente FOREIGN KEY (IdCliente) REFERENCES Cliente (IdCliente)

ALTER TABLE UnidadMedica
ADD CONSTRAINT fkAmbulancia FOREIGN KEY (IdAmbulancia) REFERENCES Ambulancia (IdAmbulancia)

ALTER TABLE UnidadMedica
ADD CONSTRAINT fkFacturaCliente FOREIGN KEY (IdFacturaCliente) REFERENCES FacturaCliente (IdFacturaCliente)

-- Asamblea--IdHorario 
ALTER TABLE Asamblea
ADD CONSTRAINT fkAsamblea_Horario FOREIGN KEY (IdHorario) REFERENCES Horario (IdHorario)
--Edificio -- Elevador
ALTER TABLE Area
ADD CONSTRAINT fkTipoDeArea FOREIGN KEY (IdTipoDeArea) REFERENCES TipoDeArea (IdTipoDeArea)

--CedulaMedica --Especialidad 
ALTER TABLE CedulaMedica
ADD CONSTRAINT fkEspecialidad FOREIGN KEY (IdEspecialidad) REFERENCES Especialidad (IdEspecialidad)

--Cliente -- CompraCliente
ALTER TABLE Cliente
ADD CONSTRAINT fkCompra_Cliente FOREIGN KEY (IdCompraCliente) REFERENCES CompraCliente (IdCompraCliente)

--Cliente -- PagoCliente
ALTER TABLE Cliente
ADD CONSTRAINT fkCliente_PagoCliente FOREIGN KEY (IdPagoCliente) REFERENCES PagoCliente (IdPagoCliente)

--Cliente --IdFacturaCliente 
ALTER TABLE Cliente
ADD CONSTRAINT fkFacturaCliente FOREIGN KEY (IdFacturaCliente) REFERENCES FacturaCliente (IdFacturaCliente)

ALTER TABLE Compra
ADD CONSTRAINT fkCompra_Articulo FOREIGN KEY (IdArticulo) REFERENCES Articulo (IdArticulo)


--Edificio -- Elevador
ALTER TABLE Edificio
ADD CONSTRAINT fkReglamento FOREIGN KEY (IdReglamento) REFERENCES Reglamento (IdReglamento)
--Edificio -- Elevador
ALTER TABLE Edificio
ADD CONSTRAINT fkArea FOREIGN KEY (IdArea) REFERENCES Area (IdArea)
--Edificio -- Elevador
ALTER TABLE Edificio
ADD CONSTRAINT fkElevador FOREIGN KEY (IdElevador) REFERENCES Elevador (IdElevador)
--Edificio -- Farmacia
ALTER TABLE Edificio
ADD CONSTRAINT fkFarmacia FOREIGN KEY (IdFarmacia) REFERENCES Farmacia (IdFarmacia)
--Edificio -- Habitacion
ALTER TABLE Edificio
ADD CONSTRAINT fkHabitacion FOREIGN KEY (IdHabitacion) REFERENCES Habitacion (IdHabitacion)
--Edificio -- Area
ALTER TABLE Edificio
ADD CONSTRAINT fkArea FOREIGN KEY (IdArea) REFERENCES Area (IdArea)


--Alter Table
ALTER TABLE Empleado
ADD CONSTRAINT fkCompra FOREIGN KEY (IdCompra) REFERENCES Compra (IdCompra)

ALTER TABLE Empleado
ADD CONSTRAINT fkConsultaMedica FOREIGN KEY (IdConsultaMedica) REFERENCES ConsultaMedica (IdConsultaMedica)

ALTER TABLE Empleado
ADD CONSTRAINT fkAnalisMedico FOREIGN KEY (IdAnalisMedico) REFERENCES AnalisMedico (IdAnalisMedico)

ALTER TABLE Empleado
ADD CONSTRAINT fkTratamiento FOREIGN KEY (IdTratamiento) REFERENCES Tratamiento (IdTratamiento)

ALTER TABLE Empleado
ADD CONSTRAINT fkComida FOREIGN KEY (IdComida) REFERENCES Comida (IdComida)

ALTER TABLE Empleado
ADD CONSTRAINT fkRecetaMedica FOREIGN KEY (IdRecetaMedica) REFERENCES RecetaMedica (IdRecetaMedica)

ALTER TABLE Empleado
ADD CONSTRAINT fkClinicaMedica FOREIGN KEY (IdClinicaMedica) REFERENCES ClinicaMedica (IdClinicaMedica)

ALTER TABLE Empleado
ADD CONSTRAINT fkCedulaMedica FOREIGN KEY (IdCedulaMedica) REFERENCES CedulaMedica (IdCedulaMedica)

ALTER TABLE Empleado
ADD CONSTRAINT fkCirugia FOREIGN KEY (IdCirugia) REFERENCES Cirugia (IdCirugia)

ALTER TABLE Empleado
ADD CONSTRAINT fkAsamblea FOREIGN KEY (IdAsamblea) REFERENCES Asamblea (IdAsamblea)

ALTER TABLE Empleado
ADD CONSTRAINT fkTransporteEmpleado FOREIGN KEY (IdTransporteEmpleado) REFERENCES TransporteEmpleado (IdTransporteEmpleado)

ALTER TABLE Empleado
ADD CONSTRAINT fkMantenimiento FOREIGN KEY (IdMantenimiento) REFERENCES Mantenimiento (IdMantenimiento)

ALTER TABLE Enfermedad
ADD CONSTRAINT fkTipoDeEnfermedad FOREIGN KEY (IdTipoEnfermedad) REFERENCES TipoEnfermedad (IdTipoEnfermedad)

-- Evento--IdHorario 
ALTER TABLE Evento
ADD CONSTRAINT fkEvento_Horario FOREIGN KEY (IdHorario) REFERENCES Horario (IdHorario)
ALTER TABLE Evento
ADD CONSTRAINT fkEvento_Asamblea FOREIGN KEY (IdAsamblea) REFERENCES Asamblea (IdAsamblea)


--Farmacia -- Medicamento
ALTER TABLE Farmacia
ADD CONSTRAINT fkMedicamento FOREIGN KEY (IdMedicamento) REFERENCES Medicamento (IdMedicamento)
--Farmacia -- Articulo
ALTER TABLE Farmacia
ADD CONSTRAINT fkArticulo FOREIGN KEY (IdArticulo) REFERENCES Articulo (IdArticulo)
--Farmacia -- PagoCliente
ALTER TABLE Farmacia
ADD CONSTRAINT fkFarmacia_PagoCliente FOREIGN KEY (IdPagoCliente) REFERENCES PagoCliente (IdPagoCliente)

ALTER TABLE Farmacia
ADD CONSTRAINT fkFarmacia_CompraCliente FOREIGN KEY (IdCompraCliente) REFERENCES CompraCliente (IdCompraCliente)


--Alter Table
ALTER TABLE Paciente
ADD CONSTRAINT fkConsultaMedica FOREIGN KEY (IdConsultaMedica) REFERENCES ConsultaMedica (IdConsultaMedica)

ALTER TABLE Paciente
ADD CONSTRAINT fkAnalisMedico FOREIGN KEY (IdAnalisMedico) REFERENCES AnalisMedico (IdAnalisMedico)

ALTER TABLE Paciente
ADD CONSTRAINT fkTratamiento FOREIGN KEY (IdTratamiento) REFERENCES Tratamiento (IdTratamiento)

ALTER TABLE Paciente
ADD CONSTRAINT fkComida FOREIGN KEY (IdComida) REFERENCES Comida (IdComida)

ALTER TABLE Paciente
ADD CONSTRAINT fkRecetaMedica FOREIGN KEY (IdRecetaMedica) REFERENCES RecetaMedica (IdRecetaMedica)

ALTER TABLE Paciente
ADD CONSTRAINT fkCartillaSalud FOREIGN KEY (IdCartillaSalud) REFERENCES CartillaSalud (IdCartillaSalud)

ALTER TABLE Paciente
ADD CONSTRAINT fkIngreso FOREIGN KEY (IdIngreso) REFERENCES Ingreso (IdIngreso)

ALTER TABLE Paciente
ADD CONSTRAINT fkCama FOREIGN KEY (IdCama) REFERENCES Cama (IdCama)

ALTER TABLE Paciente
ADD CONSTRAINT fkAltaMedica FOREIGN KEY (IdAltaMedica) REFERENCES AltaMedica (IdAltaMedica)

ALTER TABLE Paciente
ADD CONSTRAINT fkEnfermedad FOREIGN KEY (IdEnfermedad) REFERENCES Enfermedad (IdEnfermedad)

ALTER TABLE Paciente
ADD CONSTRAINT fkCitaMedica FOREIGN KEY (IdCitaMedica) REFERENCES CitaMedica (IdCitaMedica)
-- Proveedor--FacturaProveedor 
ALTER TABLE Farmacia
ADD CONSTRAINT fkFactura_Proveedor FOREIGN KEY (IdFacturaProveedor) REFERENCES FacturaProveedor (IdFacturaProveedor)
-- Proveedor--PagoUnidadMedica 
ALTER TABLE Farmacia
ADD CONSTRAINT fkProveedor_PagoUnidadMedica FOREIGN KEY (IdPagoUnidadMedica) REFERENCES PagoUnidadMedica (IdPagoUnidadMedica)

-- RecetaMedica--Medicamento 
ALTER TABLE Farmacia
ADD CONSTRAINT fkMedicamento FOREIGN KEY (IdMedicamento) REFERENCES Medicamento (IdMedicamento)

-- Residencia--Practicante 
ALTER TABLE Residencia
ADD CONSTRAINT fkPracticante FOREIGN KEY (IdPracticante) REFERENCES Practicante (IdPracticante)

-- Residencia--Practicante 
ALTER TABLE ServicioSocial
ADD CONSTRAINT fkEstudiante FOREIGN KEY (IdEstudiante) REFERENCES Estudiante (IdEstudiante)

-- Visita--IdHorario 
ALTER TABLE Visita
ADD CONSTRAINT fkHorario FOREIGN KEY (IdHorario) REFERENCES Horario (IdHorario)

Insert into Almacen(nombre,descripcion,estatus)
Values('Almacen','Almacen 1',1),
('Almacen_2','Esto es almacen 2',1),
('Almacen_3','Esto es almacen 3',1),
('Almacen_4','Esto es almacen 4',1),
('Almacen_5','Esto es almacen 5',1),
('Almacen_6','Esto es almacen 6',1),
('Almacen_7','Esto es almacen 7',1),
('Almacen_8','Esto es almacen 8',1),
('Almacen_9','Esto es almacen 9',1),
('Almacen_10','Esto es almacen 10',1);
--AltaMedica--
Insert into AltaMedica(Fecha,descripcion,estatus)
Values('05/12/2022','Se dio de alta el paciente 1',1),
('03/12/2022','Se dio de alta el paciente 2',1),
('10/11/2022','Se dio de alta el paciente 3',1),
('03/09/2022','Se dio de alta el paciente 4',1),
('02/12/2022','Se dio de alta el paciente 5',1),
('05/12/2022','Se dio de alta el paciente 6',1),
('08/12/2022','Se dio de alta el paciente 7',1),
('09/12/2022','Se dio de alta el paciente 8',1),
('10/12/2022','Se dio de alta el paciente 9',1),
('06/12/2022','Se dio de alta el paciente 10',1);
--Ambulancia--
Insert into Ambulancia(NumAmbulancia,estatus)
Values(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(9,1),
(10,1);
--Area--
Insert into Area(Nombre,descripcion,estatus,IdTipoDeArea)
Values('Area 1','Cardiologia',1,1), 
('Area 2','Urologia',1,2),
('Area 3','Anestologia',1,3),
('Area 4','Cuidados',1,4),
('Area 5','Digestivo',1,5),
('Area 6','Hematologia',1,6),
('Area 7','Medicina Interna',1,7),
('Area 8','Oncologia',1,8),
('Area 9','Urgencias',1,9),
('Area 10','Rehabilitacion',1,10);
Select * from Asamblea
Insert into Asamblea(Fecha,descripcion,estatus,IdHorario)
Values('03/12/2022',' la Asamblea 1',1,1), 
('03/12/2022',' la Asamblea 2',1,2),
('03/12/2022',' la Asamblea 3',1,3),
('03/12/2022',' la Asamblea 4',1,1),
('03/12/2022',' la Asamblea 5',1,2),
('03/12/2022',' la Asamblea 6',1,3),
('03/12/2022',' la Asamblea 7',1,2),
('03/12/2022',' la Asamblea 8',1,3),
('03/12/2022',' la Asamblea 9',1,1),
('03/12/2022',' la Asamblea 10',1,2);
Insert into Cama(numCama,estatus)
Values(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1);
Insert into CartillaSalud(Nss,NoRegistro,estatus)
Values(1508051,601,1),
(1508052,602,1),
(1508053,603,1),
(1508054,604,1),
(1508055,605,1),
(1508056,606,1),
(1508057,607,1),
(1508058,608,1),
(1508059,609,1),
(1508010,610,1);

Insert into CedulaMedica(nombre,numCedulaMedica,descripcion,estatus,especialidad)
Values('Maria',10,'Licenciatura',1,1),
('Maria',111,'Licenciatura',1,2),
('Carlos',121,'Licenciatura',1,3),
('Emauel',131,'Licenciatura',1,3),
('Ronaldo',141,'Licenciatura',1,4),
('Luis',151,'Licenciatura',1,4),
('Edson',161,'Licenciatura',1,2),
('Max',171,'Licenciatura',1,5),
('Juan',181,'Licenciatura',1,1),
('Pedro',191,'Licenciatura',1,8),
('Alvaro',201,'Licenciatura',1,9);
--AltaMedica--
Insert into Cirugia(Fecha,noCirugia,nombre,descripcion,estatus)
Values('05/12/2022','num1','cirugia1','descripcion1',1),
('05/12/2022','num2','cirugia2','descripcion2',1),
('05/12/2022','num3','cirugia2','descripcion3',1),
('05/12/2022','num4','cirugia2','descripcion4',1),
('05/12/2022','num5','cirugia2','descripcion5',1),
('05/12/2022','num6','cirugia2','descripcion6',1),
('05/12/2022','num7','cirugia2','descripcion7',1),
('05/12/2022','num8','cirugia2','descripcion8',1),
('05/12/2022','num9','cirugia2','descripcion9',1),
('05/12/2022','num10','cirugia2','descripcion10',1);

Insert into Cita(numCita,fecha,estatus)
Values('101','05/12/2022',1),
('102','05/12/2022',1),
('103','06/12/2022',1),
('104','07/12/2022',1),
('105','15/12/2022',1),
('106','25/12/2022',1),
('107','15/12/2022',1),
('108','05/12/2022',1),
('109','05/12/2022',1),
('1010','05/12/2022',1);
use Hospi
Insert into Cliente(nombre,apellidoPaterno,apellidoMaterno,curp,calle,colonia,telefono,numero,
codigopostal,estatus,IdFacturaCliente,IdPagoCliente,IdCompraCliente)
Values('Maximiliano','Ramos,','Duran','RADR201698','Zapata','Barrera','8661234567,'
,'706','50699',1,1,1,1),
('Alejandro','Zapata,','Gomez','RADR201698','Zapata','Hipodromo','8661236567,'
,'710','50692',1,1,1,1),
('Alvaro','Ramos,','Duran','ALVDR206628','Independencia','Del rio','8661294867,'
,'960','69785',1,1,1,1),
('Pedro','Martinez,','Duran','PEMA901098','Almaden','Zona Centro','8661697567,'
,'697','25781',1,1,1,1),
('Jaqueline','Torres,','Sanchez','JATO971698','Aguilar','Flores','8666924567,'
,'487','69786',1,1,1,1),
('Emanuel','Perales,','Valdez','EMPE201698','Progreso','Directo','8661237967,'
,'983','10563',1,1,1,1),
('Martin','Zapata,','Guzman','MAZA981620','Emiliano','Aguilar','8661236927,'
,'638','69809',1,1,1,1),
('Raul','Sepulveda,','Gomez','RASE952698','Hidalgo','Tecnologico','8661236667,'
,'269','50691',1,1,1,1),
('Maria','Guadalupe,','Torres','MAGU971220','Revolucion','Aguilar','8666976927,'
,'108','50506',1,1,1,1),
('Raul','Sierra,','Ibarra','RASE201698','Hidalgo','Tecnologico','8661269827,'
,'209','50691',1,1,1,1);

Insert into ClinicaMedica(NoClinica,NombreClinicaMedica,estatus)
Values('Cl-1',' Clinica 1',1), 
('Cl-2',' Clinica 2',1), 
('Cl-3',' Clinica 3',1), 
('Cl-4',' Clinica 4',1), 
('Cl-5',' Clinica 5',1), 
('Cl-6',' Clinica 6',1), 
('Cl-7',' Clinica 7',1), 
('Cl-8',' Clinica 8',1), 
('Cl-9',' Clinica 9',1), 
('Cl-10',' Clinica 10',1);

Insert into Comida(NombreComida,descripcion,estatus)
Values('Platillo 1','es la comida 1',1),
('Platillo 2','es la comida 2',1),
('Platillo 3','es la comida 3',1),
('Platillo 4','es la comida 4',1),
('Platillo 5','es la comida 5',1),
('Platillo 6','es la comida 6',1),
('Platillo 7','es la comida 7',1),
('Platillo 8','es la comida 8',1),
('Platillo 9','es la comida 9',1),
('Platillo 10','es la comida10 ',1);

Insert into Compra(fecha,estatus,IdArticulo)
Values('05/12/2022',1,1),
('05/12/2022',1,1),
('05/12/2022',1,1),
('05/12/2022',1,1),
('05/12/2022',1,1),
('05/12/2022',1,1),
('05/12/2022',1,1),
('05/12/2022',1,1),
('05/12/2022',1,1),
('05/12/2022',1,1);
use Hospi

Insert into CompraPaciente(fecha,estatus)
Values('05/12/2022',1),
('05/12/2022',1),
('05/12/2022',1),
('05/12/2022',1),
('05/12/2022',1),
('05/12/2022',1),
('05/12/2022',1),
('05/12/2022',1),
('05/12/2022',1),
('05/12/2022',1);
Insert into ConsultaMedica(fecha,descripcion,estatus)
Values
('05/12/2022','Descripcion',1),
('05/12/2022','Descripcion',1),
('05/12/2022','Descripcion',1),
('05/12/2022','Descripcion',1),
('05/12/2022','Descripcion',1),
('05/12/2022','Descripcion',1),
('05/12/2022','Descripcion',1),
('05/12/2022','Descripcion',1),
('05/12/2022','Descripcion',1),
('05/12/2022','Descripcion',1);

Insert into Edificio(noEdificio,estatus,IdElevador,IdFarmacia,IdArea,IdReglamento,
IdHabitacion)
Values 
('ED1',1,1,1,1,1,1),
('ED2',1,1,2,1,1,1),
('ED3',1,1,3,1,1,1),
('ED4',1,1,4,1,1,1),
('ED5',1,1,5,1,1,1),
('ED1',1,1,6,1,1,1),
('ED2',1,1,7,1,1,1),
('ED3',1,1,8,1,1,1),
('ED4',1,1,9,1,1,1),
('ED5',1,1,10,1,1,1);
Insert into Elevador(numElevador,estatus)
Values
('Elevador 1',1),
('Elevador 2',1),
('Elevador 3',1),
('Elevador 4',1),
('Elevador 5',1),
('Elevador 6',1),
('Elevador 7',1),
('Elevador 8',1),
('Elevador 9',1),
('Elevador 10',1);

INSERT INTO  Empleado
(
nombre,
apellidoPaterno,
apellidoMaterno,
RFC,
calle ,
colonia,
numero ,
telefono,
estatus,
--Foraneas
IdConsultaMedica,
IdAnalisMedico,
IdTratamiento,
IdComida,
IdRecetaMedica,
IdClinicaMedica  ,
IdCompra ,
IdCedulaMedica ,
IdCirugia ,
IdAsamblea,
IdTransporteEmpleado,
IdMantenimiento)
VALUES
('Luis','Torres','Sanchez','LUTO970510','Independencia','Zona Centro','106','8661526987',1,1,1,1,1,1,1,1,1,1,1,1,1),
('Carlos','Manuel','Torres','CAMA970510','Aguilar','Zona Centro','136','8666976987',1,2,1,1,1,1,1,1,1,1,1,1,1),
('Alvaro','Ramos','Duran','ALVDR206628','Aguilar','Zona Centro','136','8666976987',1,2,1,1,1,1,1,1,1,1,1,1,1),
('Carlos','Manuel','Torres','PEMA901098','Almaden','Zona Centro','136','8666976987',1,2,1,1,1,1,1,1,1,1,1,1,1),
('Jaqueline','Torres','Torres','JATO971698','Aguilar','Zona Centro','136','8666976987',1,2,1,1,1,1,1,1,1,1,1,1,1),
('Emanuel','Perales','Sanchez','EMPE201698','Independencia','Zona Centro','106','8661526987',1,1,1,1,1,1,1,1,1,1,1,1,1),
('Martin','Zapata','Valdez','MAZA981620','Emiliano','Zona Centro','136','8666976987',1,2,1,1,1,1,1,1,1,1,1,1,1),
('Raul','Sepulveda','Gomez','RASE952698','Aguilar','Zona Centro','136','8666976987',1,2,1,1,1,1,1,1,1,1,1,1,1),
('Maximiliano','Ramos','Duran','MARA201698','Aguilar','Zona Centro','136','8666976987',1,2,1,1,1,1,1,1,1,1,1,1,1),
('Carlos','Manuel','Torres','CAMA970510','Hidalgo','Zona Centro','136','8666976987',1,2,1,1,1,1,1,1,1,1,1,1,1);
use Hospi

Insert into Enfermedad(nombre,descripcion,estatus,IdTipoEnfermedad)
Values
('Cancer 1','Enfermedad',1,1),
('Asma 2','Enfermedad',1,1),
('Autismo 3','Enfermedad',1,1),
('Diabetes 4','Enfermedad',1,1),
('Gripe 5','Enfermedad',1,1),
('Covid 6','Enfermedad',1,1),
('Influenza 7','Enfermedad',1,1),
('Rabia 8','Enfermedad',1,1),
('Tabaquismo 9','Enfermedad',1,1),
('Rabia 10','Enfermedad',1,1);
Insert into Equipo(nombre,cantidad,descripcion,estatus)
Values
('Respirador  1','2','Usar el uso correcto',1),
('M�quina de anestesia 2','3','Usar el uso correcto',1),
('Esterilizadores 3','5','Usar el uso correcto',1),
('Sistemas de estr�s: 4','6','Usar el uso correcto',1),
('electroquir�rgicas 5','8','Usar el uso correcto',1),
('Ultrasonido  6','8','Usar el uso correcto',1),
('Desfibrilador 7','8','Usar el uso correcto',1),
('electrocardiograma 8','8','Usar el uso correcto',1),
('Monitor de signos vitales 9','7','Usar el uso correcto',1),
('mesas quir�rgicas 10','6','Usar el uso correcto',1);

Insert into Especialidad(nombre,descripcion,estatus)
Values
('Especialidad 1', 'Acerca de la especialidad,',1),
('Especialidad 2', 'Acerca de la especialidad,',1),
('Especialidad 3', 'Acerca de la especialidad,',1),
('Especialidad 4', 'Acerca de la especialidad,',1),
('Especialidad 5', 'Acerca de la especialidad,',1),
('Especialidad 6', 'Acerca de la especialidad,',1),
('Especialidad 7', 'Acerca de la especialidad,',1),
('Especialidad 8', 'Acerca de la especialidad,',1),
('Especialidad 9', 'Acerca de la especialidad,',1),
('Especialidad 10', 'Acerca de la especialidad,',1);
--Visualizar Registro de tablas--

Insert Into  Estudiante
(nombreEstudiante, 
apellidoPaterno,
apellidoMaterno,
matricula,
estatus 
)values
('Carlos','Ramirez','Torres', '15649849',1),
('Pedro','Ramirez','Torres', '15643849',1),
('Luis','Ibarra','Gomez', '15643849',1),
('Juan','Nu�ez','Palacios', '1569849',1),
('Morata','Suarez','Sanchez', '15642849',1),
('Lionel','Ramirez','Perales', '15646849',1),
('Ronaldo','Ramirez','Zapata', '15647849',1),
('Esquivel','Idelfonso','Torres', '15689849',1),
('Raul','Tamar','Torres', '15649989',1),
('Sebas','Ramirez','Zamora', '156483749',1);
select  * from paciente
INSERT INTO Paciente
(nombre,fecha,estatus,IdEnfermedad,IdCitaMedica,IdCama,
IdAltaMedica,IdConsultaMedica ,IdAnalisMedico  ,IdTratamiento ,
IdComida  ,IdRecetaMedica ,IdClinicaMedica  ,IdExpedienteMedico ,
IdCartillaSalud ,IdIngreso  ,IdCedulaMedica ,IdCirugia  ,IdAsamblea, 
IdTransporteEmpleado,IdMantenimiento) Values

('Luis','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2),
('Pedro','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2),
('Carlos','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2),
('Juan','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2),
('Monica','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2),
('Miguel','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2),
('Raul','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2),
('Lupita','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2),
('Maria','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2),
('Marta','05/12/2022',1,1,2,1,2,3,1,2,5,1,1,4,7,2,5,6,2,1,2);
select *  from  almacen
select *  from  AltaMedica
select *  from  Ambulancia
select *  from  Area
select *  from  Asamblea
select * from cama
select * from CartillaSalud
select * from CedulaMedica
select * from Cirugia
select * from Cita
select * from Cliente
select * from ClinicaMedica
select * from Comida
select * from Compra
select * from CompraPaciente
select * from ConsultaMedica
select * from Edificio
select * from Elevador
select * from Empleado
select * from Enfermedad
select * from Equipo
select * from Especialidad

select * from Paciente