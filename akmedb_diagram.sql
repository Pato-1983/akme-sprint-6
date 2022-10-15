-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema akmedb_diagram
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema akmedb_diagram
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `akmedb_diagram` DEFAULT CHARACTER SET utf8 ;
USE `akmedb_diagram` ;

-- -----------------------------------------------------
-- Table `akmedb_diagram`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `akmedb_diagram`.`categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `akmedb_diagram`.`colors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `akmedb_diagram`.`colors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `akmedb_diagram`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `akmedb_diagram`.`products` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `price` DECIMAL(10,0) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `categories_id` INT(11) NOT NULL,
  `colors_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `categories_id`, `colors_id`),
  INDEX `fk_products_categories1_idx` (`categories_id` ASC) ,
  INDEX `fk_products_colors1_idx` (`colors_id` ASC) ,
  CONSTRAINT `fk_products_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `akmedb_diagram`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_colors1`
    FOREIGN KEY (`colors_id`)
    REFERENCES `akmedb_diagram`.`colors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 59
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `akmedb_diagram`.`images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `akmedb_diagram`.`images` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `productId` INT(11) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `products_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `products_id`),
  INDEX `fk_images_products1_idx` (`products_id` ASC) ,
  CONSTRAINT `fk_images_products1`
    FOREIGN KEY (`products_id`)
    REFERENCES `akmedb_diagram`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 45
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `akmedb_diagram`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `akmedb_diagram`.`roles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `akmedb_diagram`.`sequelizemeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `akmedb_diagram`.`sequelizemeta` (
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE INDEX `name` (`name` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `akmedb_diagram`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `akmedb_diagram`.`users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(255) NULL DEFAULT NULL,
  `lastName` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NULL DEFAULT NULL,
  `celular` VARCHAR(255) NOT NULL,
  `image` VARCHAR(255) NULL DEFAULT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `roles_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `roles_id`),
  INDEX `fk_users_roles_idx` (`roles_id` ASC) ,
  CONSTRAINT `fk_users_roles`
    FOREIGN KEY (`roles_id`)
    REFERENCES `akmedb_diagram`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
