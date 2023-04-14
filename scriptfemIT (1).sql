-- MySQL Workbench Forward Engineering

#SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
#SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
#SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema femit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema femit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `femit` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `femit` ;

-- -----------------------------------------------------
-- Table `femit`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NULL DEFAULT NULL,
  `apellidos` VARCHAR(50) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `correo_electronico` VARCHAR(100) NULL DEFAULT NULL,
  `contrasena` VARCHAR(100) NULL DEFAULT NULL,
  `foto_portada` VARCHAR(100) NULL DEFAULT NULL,
  `foto_perfil` VARCHAR(100) NULL DEFAULT NULL,
  `cargo` VARCHAR(50) NULL DEFAULT NULL,
  `estudios` VARCHAR(100) NULL DEFAULT NULL,
  `buscando_empleo` TINYINT NULL DEFAULT NULL,
  `curriculum` VARCHAR(100) NULL DEFAULT NULL,
  `links` VARCHAR(255) NULL DEFAULT NULL,
  `rol_usuario` VARCHAR(45) NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `femit`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`empresa` (
  `id_empresa` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `tamano` VARCHAR(45) NULL,
  `descripcion` VARCHAR(255) NULL,
  `sitio_web` VARCHAR(100) NULL,
  PRIMARY KEY (`id_empresa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `femit`.`publicacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`publicacion` (
  `id_publicacion` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NULL DEFAULT NULL,
  `tipo_publicacion` INT NULL DEFAULT NULL,
  `fecha_hora_publicacion` DATETIME NULL DEFAULT NULL,
  `contenido_publicacion` VARCHAR(500) NULL DEFAULT NULL,
  `id_empresa` INT NULL,
  PRIMARY KEY (`id_publicacion`),
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_publicacion_empresa_id_empresa_idx` (`id_empresa` ASC) VISIBLE,
  CONSTRAINT `fk_publicacion_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `femit`.`usuario` (`id_usuario`),
  CONSTRAINT `fk_publicacion_empresa_id_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `femit`.`empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `femit`.`comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`comentario` (
  `id_comentario` INT NOT NULL AUTO_INCREMENT,
  `id_publicacion` INT NULL DEFAULT NULL,
  `id_usuario` INT NULL DEFAULT NULL,
  `fecha_hora_comentario` DATETIME NULL DEFAULT NULL,
  `contenido_comentario` VARCHAR(500) NULL DEFAULT NULL,
  `id_empresa` INT NULL,
  PRIMARY KEY (`id_comentario`),
  INDEX `id_publicacion_idx` (`id_publicacion` ASC) VISIBLE,
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_comentario_empresa_idx` (`id_empresa` ASC) VISIBLE,
  CONSTRAINT `fk_comentario_publicacion`
    FOREIGN KEY (`id_publicacion`)
    REFERENCES `femit`.`publicacion` (`id_publicacion`),
  CONSTRAINT `fk_comentario_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `femit`.`usuario` (`id_usuario`),
  CONSTRAINT `fk_comentario_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `femit`.`empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `femit`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`contacto` (
  `id_contacto` INT NOT NULL AUTO_INCREMENT,
  `id_usuario1` INT NULL DEFAULT NULL,
  `id_usuario2` INT NULL DEFAULT NULL,
  `estado_contacto` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_contacto`),
  INDEX `id_usuario1_idx` (`id_usuario1` ASC) VISIBLE,
  INDEX `id_usuario2_idx` (`id_usuario2` ASC) VISIBLE,
  CONSTRAINT `fk_contacto_usuario_usuario1`
    FOREIGN KEY (`id_usuario1`)
    REFERENCES `femit`.`usuario` (`id_usuario`),
  CONSTRAINT `fk_contacto_usuario_usuario2`
    FOREIGN KEY (`id_usuario2`)
    REFERENCES `femit`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `femit`.`mensaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`mensaje` (
  `id_mensaje` INT NOT NULL AUTO_INCREMENT,
  `id_emisor` INT NULL DEFAULT NULL,
  `id_receptor` INT NULL DEFAULT NULL,
  `fecha_hora_mensaje` DATETIME NULL DEFAULT NULL,
  `contenido_mensaje` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_mensaje`),
  INDEX `id_emisor_idx` (`id_emisor` ASC) VISIBLE,
  INDEX `id_receptor_idx` (`id_receptor` ASC) VISIBLE,
  CONSTRAINT `fk_mensaje_usuario_emisor`
    FOREIGN KEY (`id_emisor`)
    REFERENCES `femit`.`usuario` (`id_usuario`),
  CONSTRAINT `fk_mensaje_usuario_receptor`
    FOREIGN KEY (`id_receptor`)
    REFERENCES `femit`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `femit`.`portafolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`portafolio` (
  `id_portafolio` INT NOT NULL AUTO_INCREMENT,
  `id_usuario` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id_portafolio`),
  INDEX `id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_portafolio_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `femit`.`usuario` (`id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `femit`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`proyecto` (
  `id_proyecto` INT NOT NULL AUTO_INCREMENT,
  `id_portafolio` INT NULL DEFAULT NULL,
  `nombre_proyecto` VARCHAR(50) NULL DEFAULT NULL,
  `fecha_inicio` DATE NULL DEFAULT NULL,
  `fecha_termino` DATE NULL DEFAULT NULL,
  `imagen_referencia` VARCHAR(100) NULL DEFAULT NULL,
  `descripcion` VARCHAR(255) NULL DEFAULT NULL,
  `colaboradores` VARCHAR(255) NULL DEFAULT NULL,
  `tecnologias` VARCHAR(255) NULL DEFAULT NULL,
  `enlace_codigo` VARCHAR(100) NULL DEFAULT NULL,
  `enlace_proyecto` VARCHAR(100) NULL DEFAULT NULL,
  `categoria` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`),
  INDEX `id_portafolio_idx` (`id_portafolio` ASC) VISIBLE,
  CONSTRAINT `fk_proyecto_portafolio`
    FOREIGN KEY (`id_portafolio`)
    REFERENCES `femit`.`portafolio` (`id_portafolio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `femit`.`reaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`reaccion` (
  `id_reaccion` INT NOT NULL AUTO_INCREMENT,
  `tipo_reaccion` INT NULL,
  `id_usuario` INT NULL,
  PRIMARY KEY (`id_reaccion`),
  INDEX `fk_reaccion_usuario_id_usuario_idx` (`id_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_reaccion_usuario_id_usuario`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `femit`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `femit`.`publicacionReaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`publicacionReaccion` (
  `id_publicacionReaccion` INT NOT NULL AUTO_INCREMENT,
  `id_publicacion` INT NULL,
  `id_reaccion` INT NULL,
  PRIMARY KEY (`id_publicacionReaccion`),
  INDEX `fk_publicacionReaccion_publicacion_id_publicacion_idx` (`id_publicacion` ASC) VISIBLE,
  INDEX `fk_publicacionReaccion_reaccion_id_reaccion_idx` (`id_reaccion` ASC) VISIBLE,
  CONSTRAINT `fk_publicacionReaccion_publicacion_id_publicacion`
    FOREIGN KEY (`id_publicacion`)
    REFERENCES `femit`.`publicacion` (`id_publicacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_publicacionReaccion_reaccion_id_reaccion`
    FOREIGN KEY (`id_reaccion`)
    REFERENCES `femit`.`reaccion` (`id_reaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `femit`.`comentarioReaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`comentarioReaccion` (
  `id_comentarioReaccion` INT NOT NULL AUTO_INCREMENT,
  `id_comentario` INT NULL,
  `id_reaccion` INT NULL,
  PRIMARY KEY (`id_comentarioReaccion`),
  INDEX `fk_comentarioReaccion_comentario_id_comentario_idx` (`id_comentario` ASC) VISIBLE,
  INDEX `fk_comentarioReaccion_reaccion_id_reaccion_idx` (`id_reaccion` ASC) VISIBLE,
  CONSTRAINT `fk_comentarioReaccion_comentario_id_comentario`
    FOREIGN KEY (`id_comentario`)
    REFERENCES `femit`.`comentario` (`id_comentario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarioReaccion_reaccion_id_reaccion`
    FOREIGN KEY (`id_reaccion`)
    REFERENCES `femit`.`reaccion` (`id_reaccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `femit`.`publicacionTrabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `femit`.`publicacionTrabajo` (
  `id_publicacionTrabajo` INT NOT NULL AUTO_INCREMENT,
  `id_empresa` INT NULL,
  `titulo` VARCHAR(50) NULL,
  `ubicacion` VARCHAR(100) NULL,
  `modalidad_trabajo` VARCHAR(45) NULL,
  `descripcion_empleo` VARCHAR(500) NULL,
  PRIMARY KEY (`id_publicacionTrabajo`),
  INDEX `fk_publicacionTrabajo_empresa_idx` (`id_empresa` ASC) VISIBLE,
  CONSTRAINT `fk_publicacionTrabajo_empresa`
    FOREIGN KEY (`id_empresa`)
    REFERENCES `femit`.`empresa` (`id_empresa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


#SET SQL_MODE=@OLD_SQL_MODE;
#SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
#SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
