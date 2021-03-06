CREATE TABLE `aeroplatzi`.`routes`(

    id INTEGER NOT NULL AUTO_INCREMENT,
    origin VARCHAR(50) NOT NULL,
    destination VARCHAR(50) NOT NULL,
    distance INTEGER,
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    is_active TINYINT ,
    PRIMARY KEY (id)

);


CREATE TABLE `aeroplatzi`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `is _active` TINYINT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC));



CREATE TABLE `aeroplatzi`.`planes` (
  `id` INT NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `capacity` VARCHAR(45) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `update_at` DATETIME NULL,
  `is_active` TINYINT NULL,
  PRIMARY KEY (`id`));


CREATE TABLE `aeroplatzi`.`flights` (
  `id` INT NOT NULL,
  `rout_id` INT NULL,
  `plane_id` INT NULL,
  `takeoff_time` DATETIME NULL,
  `landing_time` DATETIME NULL,
  `boarding_gate` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  `is_active` TINYINT NULL,
  PRIMARY KEY (`id`),
  INDEX `planes_id_idx` (`plane_id` ASC),
  CONSTRAINT `planes_id`
    FOREIGN KEY (`plane_id`)
    REFERENCES `aeroplatzi`.`planes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `routes_id`
    FOREIGN KEY (`plane_id`)
    REFERENCES `aeroplatzi`.`routes` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

