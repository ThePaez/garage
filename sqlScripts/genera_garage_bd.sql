SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `COMPRAVENTA` ;
CREATE SCHEMA IF NOT EXISTS `COMPRAVENTA` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci ;
USE `COMPRAVENTA` ;

-- -----------------------------------------------------
-- Table `COMPRAVENTA`.`USUARIO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPRAVENTA`.`USUARIO` ;

CREATE  TABLE IF NOT EXISTS `COMPRAVENTA`.`USUARIO` (
  `USUARIO` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Nombre de usuario de la página web' ,
  `PASSWORD` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Password para iniciar sesión' ,
  `NOMBRE` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Nombre del usuario' ,
  `APELLIDOS` VARCHAR(35) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Apellidos del usuario' ,
  `CORREO` VARCHAR(40) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL COMMENT 'Correo del usuario' ,
  `CONFIRMADO` BIT(1) NOT NULL COMMENT 'Confirmado es un campo que identifica si el usuario ya ha sifo confirmado como válido (mediante correo por ejemplo)' ,
  PRIMARY KEY (`USUARIO`) ,
  INDEX `CORREO` (`CORREO` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci
COMMENT = 'Tabla usada para identificar los usuarios que se registran e';


-- -----------------------------------------------------
-- Table `COMPRAVENTA`.`GARAGE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPRAVENTA`.`GARAGE` ;

CREATE  TABLE IF NOT EXISTS `COMPRAVENTA`.`GARAGE` (
  `ID_GARAGE` INT(11) NOT NULL AUTO_INCREMENT ,
  `FECHA_ULTIMA_ACTUALIZACION` DATETIME NOT NULL ,
  `USUARIO` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `IMAGEN_GARAGE` BLOB NOT NULL ,
  PRIMARY KEY (`ID_GARAGE`) ,
  INDEX `fk_CARRITO_USUARIO1` (`USUARIO` ASC) ,
  CONSTRAINT `fk_CARRITO_USUARIO1`
    FOREIGN KEY (`USUARIO` )
    REFERENCES `COMPRAVENTA`.`USUARIO` (`USUARIO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci
COMMENT = 'Mantiene el registro de los garages de un usuario';


-- -----------------------------------------------------
-- Table `COMPRAVENTA`.`DIRECCION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPRAVENTA`.`DIRECCION` ;

CREATE  TABLE IF NOT EXISTS `COMPRAVENTA`.`DIRECCION` (
  `ID_DIRECCION` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de una DIRECCION' ,
  `CALLE` VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `NUMERO` SMALLINT(6) NOT NULL ,
  `INTERIOR` VARCHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'Numero Interior' ,
  `COLONIA` VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `MUNICIPIO` VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL DEFAULT NULL COMMENT 'Municipio o Delegación' ,
  `ESTADO` VARCHAR(15) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `CODIGO_POSTAL` CHAR(5) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `USUARIO` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  PRIMARY KEY (`ID_DIRECCION`) ,
  INDEX `fk_DIRECCION_USUARIO` (`USUARIO` ASC) ,
  CONSTRAINT `fk_DIRECCION_USUARIO`
    FOREIGN KEY (`USUARIO` )
    REFERENCES `COMPRAVENTA`.`USUARIO` (`USUARIO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci
COMMENT = 'Tabla que contiene direcciones correspondientes a usuarios';


-- -----------------------------------------------------
-- Table `COMPRAVENTA`.`FORMA_PAGO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPRAVENTA`.`FORMA_PAGO` ;

CREATE  TABLE IF NOT EXISTS `COMPRAVENTA`.`FORMA_PAGO` (
  `ID_FORMA_PAGO` VARCHAR(20) NOT NULL ,
  `USUARIO` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `TIPO` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`ID_FORMA_PAGO`) ,
  INDEX `fk_FORMA_PAGO_USUARIO1` (`USUARIO` ASC) ,
  INDEX `USUARIO` (`USUARIO` ASC) ,
  CONSTRAINT `fk_FORMA_PAGO_USUARIO1`
    FOREIGN KEY (`USUARIO` )
    REFERENCES `COMPRAVENTA`.`USUARIO` (`USUARIO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Usada para registrar diferentes forma de pago para un usuari' /* comment truncated */;


-- -----------------------------------------------------
-- Table `COMPRAVENTA`.`PRODUCTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPRAVENTA`.`PRODUCTO` ;

CREATE  TABLE IF NOT EXISTS `COMPRAVENTA`.`PRODUCTO` (
  `ID_PRODUCTO` INT NOT NULL AUTO_INCREMENT ,
  `NOMBRE` VARCHAR(50) NOT NULL ,
  `DESCRIPCION` VARCHAR(200) NULL ,
  `PRECIO_VENTA` DECIMAL(10,2) NOT NULL COMMENT 'Precio al cual se está vendiendo el producto' ,
  `PRECIO_UNITARIO` DECIMAL(10,2) NOT NULL COMMENT 'Precio de Compra' ,
  `CANTIDAD_EXISTENCIA` INT NOT NULL ,
  `IMAGEN` BLOB NOT NULL ,
  PRIMARY KEY (`ID_PRODUCTO`) ,
  INDEX `NOMBRE` (`NOMBRE` ASC) )
ENGINE = InnoDB
COMMENT = 'Usada para registrar productos';


-- -----------------------------------------------------
-- Table `COMPRAVENTA`.`GARAGE_X_PRODUCTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPRAVENTA`.`GARAGE_X_PRODUCTO` ;

CREATE  TABLE IF NOT EXISTS `COMPRAVENTA`.`GARAGE_X_PRODUCTO` (
  `ID_GARAGE` INT NOT NULL ,
  `ID_PRODUCTO` INT NOT NULL ,
  `CANTIDAD` INT NOT NULL ,
  `POS_SUP_IZQ_X` FLOAT NULL ,
  `POS_SUP_DER_Y` FLOAT NULL ,
  `POS_INF_IZQ_X` FLOAT NULL ,
  `POS_INF_DER_Y` FLOAT NULL ,
  INDEX `fk_CARRITO_X_PRODUCTO_CARRITO1` (`ID_GARAGE` ASC) ,
  PRIMARY KEY (`ID_GARAGE`, `ID_PRODUCTO`) ,
  INDEX `fk_CARRITO_X_PRODUCTO_PRODUCTO1` (`ID_PRODUCTO` ASC) ,
  CONSTRAINT `fk_CARRITO_X_PRODUCTO_CARRITO1`
    FOREIGN KEY (`ID_GARAGE` )
    REFERENCES `COMPRAVENTA`.`GARAGE` (`ID_GARAGE` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CARRITO_X_PRODUCTO_PRODUCTO1`
    FOREIGN KEY (`ID_PRODUCTO` )
    REFERENCES `COMPRAVENTA`.`PRODUCTO` (`ID_PRODUCTO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'La relación entre carrito y producto es de n:m por lo que es' /* comment truncated */;


-- -----------------------------------------------------
-- Table `COMPRAVENTA`.`COMPRA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPRAVENTA`.`COMPRA` ;

CREATE  TABLE IF NOT EXISTS `COMPRAVENTA`.`COMPRA` (
  `ID_COMPRA` INT NOT NULL AUTO_INCREMENT ,
  `FECHA_COMPRA` VARCHAR(45) NULL ,
  `PRECIO_TOTAL` VARCHAR(45) NULL ,
  `ID_DIRECCION` INT NOT NULL ,
  `USUARIO` VARCHAR(10) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL ,
  `ID_FORMA_PAGO` VARCHAR(20) NOT NULL ,
  `LIQUIDADO` BIT NOT NULL ,
  PRIMARY KEY (`ID_COMPRA`) ,
  INDEX `fk_COMPRA_DIRECCION1` (`ID_DIRECCION` ASC) ,
  INDEX `fk_COMPRA_USUARIO1` (`USUARIO` ASC) ,
  INDEX `fk_COMPRA_FORMA_PAGO1` (`ID_FORMA_PAGO` ASC) ,
  CONSTRAINT `fk_COMPRA_DIRECCION1`
    FOREIGN KEY (`ID_DIRECCION` )
    REFERENCES `COMPRAVENTA`.`DIRECCION` (`ID_DIRECCION` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_USUARIO1`
    FOREIGN KEY (`USUARIO` )
    REFERENCES `COMPRAVENTA`.`USUARIO` (`USUARIO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_FORMA_PAGO1`
    FOREIGN KEY (`ID_FORMA_PAGO` )
    REFERENCES `COMPRAVENTA`.`FORMA_PAGO` (`ID_FORMA_PAGO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COMPRAVENTA`.`COMPRA_X_PRODUCTO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `COMPRAVENTA`.`COMPRA_X_PRODUCTO` ;

CREATE  TABLE IF NOT EXISTS `COMPRAVENTA`.`COMPRA_X_PRODUCTO` (
  `ID_COMPRA` INT NOT NULL ,
  `ID_PRODUCTO` INT NOT NULL ,
  `CANTIDAD` INT NOT NULL ,
  INDEX `fk_table1_COMPRA1` (`ID_COMPRA` ASC) ,
  INDEX `fk_table1_PRODUCTO1` (`ID_PRODUCTO` ASC) ,
  PRIMARY KEY (`ID_PRODUCTO`, `ID_COMPRA`) ,
  CONSTRAINT `fk_table1_COMPRA1`
    FOREIGN KEY (`ID_COMPRA` )
    REFERENCES `COMPRAVENTA`.`COMPRA` (`ID_COMPRA` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_PRODUCTO1`
    FOREIGN KEY (`ID_PRODUCTO` )
    REFERENCES `COMPRAVENTA`.`PRODUCTO` (`ID_PRODUCTO` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
