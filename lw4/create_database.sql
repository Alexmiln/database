SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lw4
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `lw4`;

-- -----------------------------------------------------
-- Schema lw4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lw4` DEFAULT CHARACTER SET utf8;
USE `lw4`;

-- -----------------------------------------------------
-- Table `employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employee`;

CREATE TABLE IF NOT EXISTS `employee`
(
    `employee_id` INT         NOT NULL AUTO_INCREMENT,
    `first_name`  VARCHAR(45) NOT NULL,
    `middle_name` VARCHAR(45) NULL,
    `last_name`   VARCHAR(45) NOT NULL,
    `birth_date`  DATE        NOT NULL,
    `salary`      INT         NOT NULL,
    PRIMARY KEY (`employee_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `client`;

CREATE TABLE IF NOT EXISTS `client`
(
    `client_id`      INT          NOT NULL AUTO_INCREMENT,
    `name`           VARCHAR(45)  NOT NULL,
    `country`        VARCHAR(45)  NOT NULL,
    `address`        VARCHAR(255) NOT NULL,
    `specialization` VARCHAR(45)  NOT NULL,
    PRIMARY KEY (`client_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `project`;

CREATE TABLE IF NOT EXISTS `project`
(
    `project_id`    INT          NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(45)  NOT NULL,
    `description`   VARCHAR(255) NULL,
    `deadline_date` DATETIME     NOT NULL,
    `client_id`     INT          NOT NULL,
    PRIMARY KEY (`project_id`, `client_id`),
    INDEX `fk_project_company_idx` (`client_id` ASC) VISIBLE,
    CONSTRAINT `fk_project_company`
        FOREIGN KEY (`client_id`)
            REFERENCES `client` (`client_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `completed_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `completed_project`;

CREATE TABLE IF NOT EXISTS `completed_project`
(
    `completed_project_id` INT NOT NULL AUTO_INCREMENT,
    `cost`                 INT NOT NULL,
    `project_id`           INT NOT NULL,
    PRIMARY KEY (`completed_project_id`, `project_id`),
    INDEX `fk_completed_project_project1_idx` (`project_id` ASC) VISIBLE,
    CONSTRAINT `fk_completed_project_project1`
        FOREIGN KEY (`project_id`)
            REFERENCES `project` (`project_id`)
)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `participation_in_project`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `participation_in_project`;

CREATE TABLE IF NOT EXISTS `participation_in_project`
(
    `participation_in_project_id` INT NOT NULL AUTO_INCREMENT,
    `employee_id`                 INT NOT NULL,
    `project_id`                  INT NOT NULL,
    PRIMARY KEY (`participation_in_project_id`, `employee_id`, `project_id`),
    INDEX `fk_participation_in_project_employee1_idx` (`employee_id` ASC) VISIBLE,
    INDEX `fk_participation_in_project_project1_idx` (`project_id` ASC) VISIBLE,
    CONSTRAINT `fk_participation_in_project_employee1`
        FOREIGN KEY (`employee_id`)
            REFERENCES `employee` (`employee_id`),
    CONSTRAINT `fk_participation_in_project_project1`
        FOREIGN KEY (`project_id`)
            REFERENCES `project` (`project_id`)
)
    ENGINE = InnoDB;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
