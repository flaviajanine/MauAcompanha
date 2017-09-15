-- MySQL Script generated by MySQL Workbench
-- Tue Sep 12 22:37:46 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mauacompanha_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mauacompanha_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mauacompanha_db` DEFAULT CHARACTER SET utf8 ;
USE `mauacompanha_db` ;

-- -----------------------------------------------------
-- Table `mauacompanha_db`.`tb_aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mauacompanha_db`.`tb_aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `ra_aluno` INT NOT NULL,
  `nome_aluno` VARCHAR(45) NOT NULL,
  `email_aluno` VARCHAR(45) NOT NULL,
  `senha_aluno` VARCHAR(45) NOT NULL,
  `curso_aluno` VARCHAR(45) NOT NULL,
  `maua_net` VARCHAR(45) NULL,
  PRIMARY KEY (`id_aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mauacompanha_db`.`tb_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mauacompanha_db`.`tb_disciplina` (
  `id_disciplina` INT NOT NULL AUTO_INCREMENT,
  `cod_disciplina` VARCHAR(45) NOT NULL,
  `nome_disciplina` VARCHAR(45) NOT NULL,
  `nome_coordenador` VARCHAR(45) NOT NULL,
  `email_coordenador` VARCHAR(45) NOT NULL,
  `semestralidade_disciplina` VARCHAR(45) NOT NULL,
  `serie_oferecida_d` VARCHAR(45) NOT NULL,
  `serie_oferecida_n` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_disciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mauacompanha_db`.`tb_notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mauacompanha_db`.`tb_notas` (
  `tb_aluno_id_aluno` INT NOT NULL,
  `tb_disciplina_id_disciplina` INT NOT NULL,
  `prova_p1` FLOAT NULL,
  `prova_p2` FLOAT NULL,
  `prova_sub1` FLOAT NULL,
  `prova_p3` FLOAT NULL,
  `prova_p4` FLOAT NULL,
  `prova_ps2` FLOAT NULL,
  `trabalho_t1` FLOAT NULL,
  `trabalho_t2` FLOAT NULL,
  `trabalho_t3` FLOAT NULL,
  `trabalho_t4` FLOAT NULL,
  PRIMARY KEY (`tb_aluno_id_aluno`, `tb_disciplina_id_disciplina`),
  INDEX `fk_tb_aluno_has_tb_disciplina_tb_disciplina1_idx` (`tb_disciplina_id_disciplina` ASC),
  INDEX `fk_tb_aluno_has_tb_disciplina_tb_aluno_idx` (`tb_aluno_id_aluno` ASC),
  CONSTRAINT `fk_tb_aluno_has_tb_disciplina_tb_aluno`
    FOREIGN KEY (`tb_aluno_id_aluno`)
    REFERENCES `mauacompanha_db`.`tb_aluno` (`id_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_aluno_has_tb_disciplina_tb_disciplina1`
    FOREIGN KEY (`tb_disciplina_id_disciplina`)
    REFERENCES `mauacompanha_db`.`tb_disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mauacompanha_db`.`tb_curso_engenharia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mauacompanha_db`.`tb_curso_engenharia` (
  `id_curso` INT NOT NULL AUTO_INCREMENT,
  `nome_curso` VARCHAR(45) NOT NULL,
  `tb_aluno_id_aluno` INT NOT NULL,
  PRIMARY KEY (`id_curso`, `tb_aluno_id_aluno`),
  INDEX `fk_tb_curso_engenharia_tb_aluno1_idx` (`tb_aluno_id_aluno` ASC),
  CONSTRAINT `fk_tb_curso_engenharia_tb_aluno1`
    FOREIGN KEY (`tb_aluno_id_aluno`)
    REFERENCES `mauacompanha_db`.`tb_aluno` (`id_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mauacompanha_db`.`tb_engenharia_basico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mauacompanha_db`.`tb_engenharia_basico` (
  `tb_curso_engenharia_id_curso` INT NOT NULL,
  `tb_curso_engenharia_tb_aluno_id_aluno` INT NOT NULL,
  `tb_disciplina_id_disciplina` INT NOT NULL,
  PRIMARY KEY (`tb_curso_engenharia_id_curso`, `tb_curso_engenharia_tb_aluno_id_aluno`, `tb_disciplina_id_disciplina`),
  INDEX `fk_tb_curso_engenharia_has_tb_disciplina_tb_disciplina1_idx` (`tb_disciplina_id_disciplina` ASC),
  INDEX `fk_tb_curso_engenharia_has_tb_disciplina_tb_curso_engenhari_idx` (`tb_curso_engenharia_id_curso` ASC, `tb_curso_engenharia_tb_aluno_id_aluno` ASC),
  CONSTRAINT `fk_tb_curso_engenharia_has_tb_disciplina_tb_curso_engenharia1`
    FOREIGN KEY (`tb_curso_engenharia_id_curso` , `tb_curso_engenharia_tb_aluno_id_aluno`)
    REFERENCES `mauacompanha_db`.`tb_curso_engenharia` (`id_curso` , `tb_aluno_id_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_curso_engenharia_has_tb_disciplina_tb_disciplina1`
    FOREIGN KEY (`tb_disciplina_id_disciplina`)
    REFERENCES `mauacompanha_db`.`tb_disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;