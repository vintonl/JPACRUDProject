-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema grocerydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `grocerydb` ;

-- -----------------------------------------------------
-- Schema grocerydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grocerydb` DEFAULT CHARACTER SET utf8 ;
USE `grocerydb` ;

-- -----------------------------------------------------
-- Table `grocery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grocery` ;

CREATE TABLE IF NOT EXISTS `grocery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `item` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  `amount` INT NOT NULL,
  `size` VARCHAR(100) NULL,
  `store` VARCHAR(100) NULL,
  `purchased` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS shopper@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'shopper'@'localhost' IDENTIFIED BY 'shopper';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'shopper'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `grocery`
-- -----------------------------------------------------
START TRANSACTION;
USE `grocerydb`;
INSERT INTO `grocery` (`id`, `item`, `description`, `amount`, `size`, `store`, `purchased`) VALUES (1, 'bananas', 'yellow ones, not GREEN!', 5, 'large', 'Costco', DEFAULT);
INSERT INTO `grocery` (`id`, `item`, `description`, `amount`, `size`, `store`, `purchased`) VALUES (2, 'milk', 'whole', 1, 'gallon', 'Trader-Joe\'s', DEFAULT);
INSERT INTO `grocery` (`id`, `item`, `description`, `amount`, `size`, `store`, `purchased`) VALUES (3, 'bread', 'whole wheat', 1, 'double pack', 'King Soopers', DEFAULT);
INSERT INTO `grocery` (`id`, `item`, `description`, `amount`, `size`, `store`, `purchased`) VALUES (4, 'yogurt', 'variety', 2, 'large pack', 'Costco', DEFAULT);
INSERT INTO `grocery` (`id`, `item`, `description`, `amount`, `size`, `store`, `purchased`) VALUES (5, 'berries', 'strawberries or something fresh', 1, 'box', 'Sprouts', DEFAULT);
INSERT INTO `grocery` (`id`, `item`, `description`, `amount`, `size`, `store`, `purchased`) VALUES (6, 'Coke Zero', 'cherry if possible ', 2, '12 pack', 'King Soopers', DEFAULT);

COMMIT;

