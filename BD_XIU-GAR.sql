drop database XIUGAR;
create database XIUGAR;
use XIUGAR;

CREATE TABLE tblUsuario (
  idUsuario int NOT NULL identity(1,1),
  strUsuario varchar(50) NOT NULL,
  strPassword varchar(50) NOT NULL,
  strTipousuario varchar(50) NOT NULL,
  constraint pk_Uduario primary key(idUsuario)
);

create table tblTelefono(
	idTelefono int not null identity(1,1),
	strCelular varchar(50),
	strTelCasa varchar(50),
	strOtro varchar(50),
	constraint pk_Telefono primary key (idTelefono)
);

create table tblDireccion (
	idDireccion int not null identity(1,1),
	strEstado varchar(150),
	strMunicipio varchar(150),
	strColonia varchar(150),
	strCalle varchar(150),
	intCodpost varchar(10),
	strNumInt varchar(50),
	strNumExt varchar(50),
	strReferencias varchar(400),
	constraint pk_Direccion primary key(idDireccion)
);

CREATE TABLE tblCliente (
	idCliente int NOT NULL identity(1,1),
	strNombre varchar(150) NOT NULL,
	strApellidoP varchar(150) NOT NULL,
	strApellidoM varchar(150) NOT NULL,
	strSituacionFiscal varchar(50) NOT NULL,
	strCorreo varchar(150),
	strEntrega varchar(150) NOT NULL,
	strHorario varchar(150) NOT NULL,
	strMetodoPago varchar(150) NOT NULL,
    fkDireccion int,
    fkTelefono int,
	constraint pk_Cliente primary key (idCliente),   
	constraint fk_Direccion foreign key(fkDireccion) references tblDireccion(idDireccion),
	constraint fk_Telefono foreign key(fkTelefono) references tblTelefono(idTelefono)
);

CREATE TABLE tblVenta (
  idVenta int NOT NULL identity(1,1),
  Fecha timestamp NOT NULL,
  intBulto int NOT NULL,
  intKilos int NOT NULL,
  strDescripcion varchar(250),
  intImporte int NOT NULL,
  strMetodoPago varchar(150) NOT NULL,
  strlapso varchar(150),
  fkCliente int,
  primary key (idVenta),
  constraint FK_Cliente foreign key(fkCliente) references tblCliente(idCliente)    
);

CREATE TABLE tblTotalVenta (
  idTotalVenta int NOT NULL identity(1,1),
  dblTotal decimal (19,4),
  fkVenta int,
  constraint pk_TotalVenta primary key (idTotalVenta),
  CONSTRAINT FK_Venta FOREIGN KEY(fkVenta) REFERENCES tblVenta(idVenta)    
);

