-- MySQL Script generated by MySQL Workbench
-- Sat Mar  6 11:09:03 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_schema1` ;
USE `new_schema1` ;

-- -----------------------------------------------------
-- Table `new_schema1`.`User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`User` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`User` (
  `UserId` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  PRIMARY KEY (`UserId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Country` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Country` (
  `CountryId` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`CountryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`City`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`City` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`City` (
  `CityId` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Country_CountryId` INT NOT NULL,
  PRIMARY KEY (`CityId`),
  INDEX `fk_City_Country1_idx` (`Country_CountryId` ASC) VISIBLE,
  CONSTRAINT `fk_City_Country1`
    FOREIGN KEY (`Country_CountryId`)
    REFERENCES `new_schema1`.`Country` (`CountryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Route`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Route` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Route` (
  `RouteId` INT NOT NULL,
  `CityId_Origen` INT NOT NULL,
  `CityId_Destiny` INT NOT NULL,
  PRIMARY KEY (`RouteId`),
  INDEX `fk_Route_City1_idx` (`CityId_Origen` ASC) VISIBLE,
  INDEX `fk_Route_City2_idx` (`CityId_Destiny` ASC) VISIBLE,
  CONSTRAINT `fk_Route_City1`
    FOREIGN KEY (`CityId_Origen`)
    REFERENCES `new_schema1`.`City` (`CityId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Route_City2`
    FOREIGN KEY (`CityId_Destiny`)
    REFERENCES `new_schema1`.`City` (`CityId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Plane`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Plane` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Plane` (
  `PlaneId` INT NOT NULL,
  `Name` INT NULL,
  `Capacity` INT NULL,
  PRIMARY KEY (`PlaneId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Status` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Status` (
  `StatusId` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`StatusId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`Flight`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`Flight` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`Flight` (
  `FlightId` INT NOT NULL,
  `Date` DATE NULL,
  `Time` TIME NULL,
  `Route_RouteId` INT NOT NULL,
  `Plane_PlaneId` INT NOT NULL,
  `Status_StatusId` INT NOT NULL,
  `NumPassanger` INT NULL,
  PRIMARY KEY (`FlightId`),
  INDEX `fk_Flight_Route1_idx` (`Route_RouteId` ASC) VISIBLE,
  INDEX `fk_Flight_Plane1_idx` (`Plane_PlaneId` ASC) VISIBLE,
  INDEX `fk_Flight_Status1_idx` (`Status_StatusId` ASC) VISIBLE,
  CONSTRAINT `fk_Flight_Route1`
    FOREIGN KEY (`Route_RouteId`)
    REFERENCES `new_schema1`.`Route` (`RouteId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight_Plane1`
    FOREIGN KEY (`Plane_PlaneId`)
    REFERENCES `new_schema1`.`Plane` (`PlaneId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Flight_Status1`
    FOREIGN KEY (`Status_StatusId`)
    REFERENCES `new_schema1`.`Status` (`StatusId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `new_schema1`.`FlightUsers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `new_schema1`.`FlightUsers` ;

CREATE TABLE IF NOT EXISTS `new_schema1`.`FlightUsers` (
  `FlightUsers` INT NOT NULL,
  `User_UserId` INT NOT NULL,
  `Flight_FlightId` INT NOT NULL,
  PRIMARY KEY (`FlightUsers`),
  INDEX `fk_FlightUsers_User1_idx` (`User_UserId` ASC) VISIBLE,
  INDEX `fk_FlightUsers_Flight1_idx` (`Flight_FlightId` ASC) VISIBLE,
  CONSTRAINT `fk_FlightUsers_User1`
    FOREIGN KEY (`User_UserId`)
    REFERENCES `new_schema1`.`User` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_FlightUsers_Flight1`
    FOREIGN KEY (`Flight_FlightId`)
    REFERENCES `new_schema1`.`Flight` (`FlightId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
