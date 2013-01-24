SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `voyage_espoire` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `voyage_espoire` ;

-- -----------------------------------------------------
-- Table `voyage_espoire`.`type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `voyage_espoire`.`type` (
  `idtype` INT NOT NULL AUTO_INCREMENT ,
  `label` VARCHAR(45) NULL ,
  PRIMARY KEY (`idtype`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `voyage_espoire`.`commune`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `voyage_espoire`.`commune` (
  `idcommune` INT NOT NULL AUTO_INCREMENT ,
  `label` VARCHAR(45) NULL ,
  `nom` VARCHAR(45) NULL ,
  PRIMARY KEY (`idcommune`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `voyage_espoire`.`personne`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `voyage_espoire`.`personne` (
  `idpersonne` INT NOT NULL AUTO_INCREMENT ,
  `nom` VARCHAR(45) NOT NULL ,
  `prenom` VARCHAR(45) NULL ,
  `date_naissance` DATE NULL ,
  `adresse` VARCHAR(200) NULL ,
  `phone` VARCHAR(20) NULL ,
  `mail` VARCHAR(45) NULL ,
  `commune_idcommune` INT NOT NULL ,
  PRIMARY KEY (`idpersonne`) ,
  INDEX `fk_personne_commune1_idx` (`commune_idcommune` ASC) ,
  CONSTRAINT `fk_personne_commune1`
    FOREIGN KEY (`commune_idcommune` )
    REFERENCES `voyage_espoire`.`commune` (`idcommune` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `voyage_espoire`.`expedition`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `voyage_espoire`.`expedition` (
  `idexpedition` INT NOT NULL AUTO_INCREMENT ,
  `label` VARCHAR(45) NOT NULL ,
  `date_init` DATE NOT NULL ,
  `date_reel` DATE NULL ,
  `nb_famille` INT NULL ,
  PRIMARY KEY (`idexpedition`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `voyage_espoire`.`type_has_personne`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `voyage_espoire`.`type_has_personne` (
  `type_idtype` INT NOT NULL ,
  `personne_idpersonne` INT NOT NULL ,
  `expedition_idexpedition` INT NOT NULL ,
  PRIMARY KEY (`type_idtype`, `personne_idpersonne`) ,
  INDEX `fk_type_has_personne_personne1_idx` (`personne_idpersonne` ASC) ,
  INDEX `fk_type_has_personne_type_idx` (`type_idtype` ASC) ,
  INDEX `fk_type_has_personne_expedition1_idx` (`expedition_idexpedition` ASC) ,
  CONSTRAINT `fk_type_has_personne_type`
    FOREIGN KEY (`type_idtype` )
    REFERENCES `voyage_espoire`.`type` (`idtype` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_has_personne_personne1`
    FOREIGN KEY (`personne_idpersonne` )
    REFERENCES `voyage_espoire`.`personne` (`idpersonne` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_type_has_personne_expedition1`
    FOREIGN KEY (`expedition_idexpedition` )
    REFERENCES `voyage_espoire`.`expedition` (`idexpedition` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `voyage_espoire`.`expedition_has_commune`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `voyage_espoire`.`expedition_has_commune` (
  `expedition_idexpedition` INT NOT NULL ,
  `commune_idcommune` INT NOT NULL ,
  PRIMARY KEY (`expedition_idexpedition`, `commune_idcommune`) ,
  INDEX `fk_expedition_has_commune_commune1_idx` (`commune_idcommune` ASC) ,
  INDEX `fk_expedition_has_commune_expedition1_idx` (`expedition_idexpedition` ASC) ,
  CONSTRAINT `fk_expedition_has_commune_expedition1`
    FOREIGN KEY (`expedition_idexpedition` )
    REFERENCES `voyage_espoire`.`expedition` (`idexpedition` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_expedition_has_commune_commune1`
    FOREIGN KEY (`commune_idcommune` )
    REFERENCES `voyage_espoire`.`commune` (`idcommune` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `voyage_espoire` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
