-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
  UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
  FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE,
  SQL_MODE = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema la_vie_saude_mental
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema la_vie_saude_mental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `la_vie_saude_mental` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `la_vie_saude_mental`;
-- -----------------------------------------------------
-- Table `la_vie_saude_mental`.`atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_vie_saude_mental`.`atendimento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `psicologo_id` INT NOT NULL,
  `paciente_id` INT NOT NULL,
  `data_atendimento` DATE NOT NULL,
  `observacao` TEXT NOT NULL,
  `createdAt` DATE NOT NULL,
  `updatedAt` DATE NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 33 DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `la_vie_saude_mental`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_vie_saude_mental`.`pacientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `idade` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `atendimento_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pacientes_atendimento1_idx` (`atendimento_id` ASC) VISIBLE,
  CONSTRAINT `fk_pacientes_atendimento1` FOREIGN KEY (`atendimento_id`) REFERENCES `la_vie_saude_mental`.`atendimento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `la_vie_saude_mental`.`psicologo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `la_vie_saude_mental`.`psicologo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `senha` VARCHAR(255) NULL DEFAULT NULL,
  `apresentacao` TEXT NULL DEFAULT NULL,
  `createdAt` DATE NULL DEFAULT NULL,
  `updatedAt` DATE NULL DEFAULT NULL,
  `atendimento_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  INDEX `fk_psicologo_atendimento_idx` (`atendimento_id` ASC) VISIBLE,
  CONSTRAINT `fk_psicologo_atendimento` FOREIGN KEY (`atendimento_id`) REFERENCES `la_vie_saude_mental`.`atendimento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;