﻿-- MySQL Script generated by MySQL Workbench
-- Mon Jul  8 09:08:07 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema San_Martin
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema San_Martin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `San_Martin` DEFAULT CHARACTER SET utf8 ;
USE `San_Martin` ;

-- -----------------------------------------------------
-- Table `San_Martin`.`Bus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `San_Martin`.`Bus` (
  `idBus` INT NOT NULL AUTO_INCREMENT,
  `Nom_Bus` VARCHAR(15) NULL,
  PRIMARY KEY (`idBus`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `Nom_Bus_UNIQUE` ON `San_Martin`.`Bus` (`Nom_Bus` ASC);


-- -----------------------------------------------------
-- Table `San_Martin`.`Asiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `San_Martin`.`Asiento` (
  `idAsiento` INT NOT NULL AUTO_INCREMENT,
  `Nro_Asiento` CHAR(3) NULL,
  `Estado` VARCHAR(45) NULL,
  `idBus` INT NOT NULL,
  PRIMARY KEY (`idAsiento`),
  CONSTRAINT `fk_Asiento_Bus1`
    FOREIGN KEY (`idBus`)
    REFERENCES `San_Martin`.`Bus` (`idBus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Asiento_Bus1_idx` ON `San_Martin`.`Asiento` (`idBus` ASC);


-- -----------------------------------------------------
-- Table `San_Martin`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `San_Martin`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(50) NULL,
  `Ape_Paterno` VARCHAR(25) NULL,
  `Ape_Materno` VARCHAR(25) NULL,
  `Fecha_Nacimiento` DATE NULL,
  `DNI` CHAR(8) NULL,
  `Email` VARCHAR(35) NULL,
  `Celular` INT NULL,
  `Nacionalidad` VARCHAR(20) NULL,
  `idAsiento` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_Cliente_Asiento1`
    FOREIGN KEY (`idAsiento`)
    REFERENCES `San_Martin`.`Asiento` (`idAsiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Cliente_Asiento1_idx` ON `San_Martin`.`Cliente` (`idAsiento` ASC);

CREATE UNIQUE INDEX `DNI_UNIQUE` ON `San_Martin`.`Cliente` (`DNI` ASC);

CREATE UNIQUE INDEX `Email_UNIQUE` ON `San_Martin`.`Cliente` (`Email` ASC);

CREATE UNIQUE INDEX `idAsiento_UNIQUE` ON `San_Martin`.`Cliente` (`idAsiento` ASC);


-- -----------------------------------------------------
-- Table `San_Martin`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `San_Martin`.`Ciudad` (
  `idCiudad` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Ciudad` VARCHAR(25) NULL,
  PRIMARY KEY (`idCiudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `San_Martin`.`Pasaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `San_Martin`.`Pasaje` (
  `idPasaje` INT NOT NULL AUTO_INCREMENT,
  `Precio` DOUBLE NULL,
  `Fecha_salida` DATE NULL,
  `Hora_Salida` TIME NULL,
  `idCiudad_Origen` INT NOT NULL,
  `idCiudad_Destino` INT NOT NULL,
  PRIMARY KEY (`idPasaje`),
  CONSTRAINT `fk_Pasaje_Ciudad1`
    FOREIGN KEY (`idCiudad_Origen`)
    REFERENCES `San_Martin`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pasaje_Ciudad2`
    FOREIGN KEY (`idCiudad_Destino`)
    REFERENCES `San_Martin`.`Ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Pasaje_Ciudad1_idx` ON `San_Martin`.`Pasaje` (`idCiudad_Origen` ASC);

CREATE INDEX `fk_Pasaje_Ciudad2_idx` ON `San_Martin`.`Pasaje` (`idCiudad_Destino` ASC);


-- -----------------------------------------------------
-- Table `San_Martin`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `San_Martin`.`Reserva` (
  `idReserva` INT NOT NULL AUTO_INCREMENT,
  `FH_Reserva` DATETIME NULL,
  `idCliente` INT NOT NULL,
  `idPasaje` INT NOT NULL,
  PRIMARY KEY (`idReserva`),
  CONSTRAINT `fk_Reserva_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `San_Martin`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Pasaje1`
    FOREIGN KEY (`idPasaje`)
    REFERENCES `San_Martin`.`Pasaje` (`idPasaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Reserva_Cliente1_idx` ON `San_Martin`.`Reserva` (`idCliente` ASC);

CREATE INDEX `fk_Reserva_Pasaje1_idx` ON `San_Martin`.`Reserva` (`idPasaje` ASC);


-- -----------------------------------------------------
-- Table `San_Martin`.`Personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `San_Martin`.`Personas` (
  `idPersonas` INT NOT NULL AUTO_INCREMENT,
  `Nombres` VARCHAR(50) NULL,
  `Ape_Paterno` VARCHAR(25) NULL,
  `Ape_Materno` VARCHAR(25) NULL,
  `Fecha_Nacimiento` DATE NULL,
  `DNI` CHAR(8) NULL,
  `idPasaje` INT NOT NULL,
  `idAsiento` INT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`idPersonas`),
  CONSTRAINT `fk_Personas_Pasaje1`
    FOREIGN KEY (`idPasaje`)
    REFERENCES `San_Martin`.`Pasaje` (`idPasaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personas_Asiento1`
    FOREIGN KEY (`idAsiento`)
    REFERENCES `San_Martin`.`Asiento` (`idAsiento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Personas_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `San_Martin`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Personas_Pasaje1_idx` ON `San_Martin`.`Personas` (`idPasaje` ASC);

CREATE INDEX `fk_Personas_Asiento1_idx` ON `San_Martin`.`Personas` (`idAsiento` ASC);

CREATE UNIQUE INDEX `DNI_UNIQUE` ON `San_Martin`.`Personas` (`DNI` ASC);

CREATE UNIQUE INDEX `idAsiento_UNIQUE` ON `San_Martin`.`Personas` (`idAsiento` ASC);

CREATE INDEX `fk_Personas_Cliente1_idx` ON `San_Martin`.`Personas` (`idCliente` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into Ciudad (Nombre_Ciudad) values ('Lima');
insert into Ciudad (Nombre_Ciudad) values ('Ancón');
insert into Ciudad (Nombre_Ciudad) values ('Chancay');
insert into Ciudad (Nombre_Ciudad) values ('Huacho');

insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','4:30:00',1,2);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','4:30:00',1,3);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','4:30:00',1,4);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','6:30:00',2,1);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','6:30:00',2,3);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','6:30:00',2,4);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','5:30:00',3,1);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','5:30:00',3,2);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','5:30:00',3,4);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','4:30:00',4,1);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (12,'2019-07-02','4:30:00',4,2);
insert into pasaje (Precio,Fecha_salida,Hora_salida,idCiudad_Origen,idCiudad_Destino) values (6,'2019-07-02','4:30:00',4,3);

insert into bus (Nom_Bus) values ('SANMARTIN1');
insert into bus (Nom_Bus) values ('SANMARTIN2');
insert into bus (Nom_Bus) values ('SANMARTIN3');
insert into bus (Nom_Bus) values ('SANMARTIN4');
insert into bus (Nom_Bus) values ('SANMARTIN5');
insert into bus (Nom_Bus) values ('SANMARTIN6');
insert into bus (Nom_Bus) values ('SANMARTIN7');
insert into bus (Nom_Bus) values ('SANMARTIN8');

insert into asiento (Nro_Asiento,estado,idBus) values ('A01','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A02','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A03','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A04','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A05','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A06','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A07','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A08','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A09','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A10','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A11','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A12','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A13','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A14','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A15','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A16','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A17','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A18','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A19','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A20','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A21','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A22','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A23','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A24','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A25','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A26','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A27','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A28','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A29','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A30','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A31','Disponible',1);
insert into asiento (Nro_Asiento,estado,idBus) values ('A32','Disponible',1);

CREATE PROCEDURE SP_CLIENTE_ASIENTO(
  in pNombres varchar(50),
  in pApe_Paterno varchar(25),
  in pApe_Materno varchar(25),
  in pFecha_Nacimiento date,
  in pDNI char(8),
  in pEmail varchar(35),
  in pCelular int,
  in pNacionalidad varchar(20),
  in pidAsiento int
  )
  BEGIN
  insert into cliente (Nombres,Ape_Paterno,Ape_Materno,Fecha_Nacimiento,DNI,Email,Celular,Nacionalidad,idAsiento)
  values (pNombres,pApe_Paterno,pApe_Materno,pFecha_Nacimiento,pDNI,pEmail,pCelular,pNacionalidad,pidAsiento);
  update asiento set estado='Ocupado' where idAsiento=pidAsiento;
  end;
  
CREATE PROCEDURE SP_PERSONA_ASIENTO(
  in pNombres varchar(50),
  in pApe_Paterno varchar(25),
  in pApe_Materno varchar(25),
  in pFecha_Nacimiento date,
  in pDNI char(8),
  in pidPasaje int,
  in pidAsiento int,
  in pidCliente int
  )
  BEGIN
  insert into personas (Nombres,Ape_Paterno,Ape_Materno,Fecha_Nacimiento,DNI,idPasaje,idAsiento,idCliente)
  values (pNombres,pApe_Paterno,pApe_Materno,pFecha_Nacimiento,pDNI,pidPasaje,pidAsiento,pidCliente);
  update asiento set estado='Ocupado' where idAsiento=pidAsiento;
  end;
  
CREATE PROCEDURE SP_ELI_CLIENTE_ASIENTO(
 in pidAsiento int
)
BEGIN
delete from Cliente where idAsiento=pidAsiento;
update asiento set estado='Disponible' where idAsiento=pidAsiento;
end;

CREATE PROCEDURE SP_ELI_PERSONA_ASIENTO(
 in pidAsiento int
)
BEGIN
delete from Personas where idAsiento=pidAsiento;
update asiento set estado='Disponible' where idAsiento=pidAsiento;
end;

