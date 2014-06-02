SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb_logistica` ;
CREATE SCHEMA IF NOT EXISTS `mydb_logistica` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
USE `mydb_logistica` ;

-- -----------------------------------------------------
-- Table `Regiao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Regiao` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Regiao` (
  `cod_regiao` INT NOT NULL,
  `zona` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`cod_regiao`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `motorista`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `motorista` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `motorista` (
  `cpf_motorista` INT NOT NULL,
  `nome` VARCHAR(20) NULL,
  `Regiao_cod_regiao` INT NOT NULL,
  PRIMARY KEY (`cpf_motorista`, `Regiao_cod_regiao`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_motorista_Regiao1_idx` ON `motorista` (`Regiao_cod_regiao` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `veiculo` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `veiculo` (
  `cod_veiculo` INT NOT NULL,
  `marca` VARCHAR(10) NULL,
  `modelo` VARCHAR(10) NULL,
  `motorista_cpf_motorista` INT NOT NULL,
  PRIMARY KEY (`cod_veiculo`, `motorista_cpf_motorista`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_veiculo_motorista1_idx` ON `veiculo` (`motorista_cpf_motorista` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `PontoEstratégico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PontoEstratégico` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `PontoEstratégico` (
  `idPontoEstratégico` INT NOT NULL,
  `PontoEstratégicoEnd` VARCHAR(20) NULL,
  `Regiao_cod_regiao` INT NOT NULL,
  PRIMARY KEY (`idPontoEstratégico`, `Regiao_cod_regiao`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_PontoEstratégico_Regiao1_idx` ON `PontoEstratégico` (`Regiao_cod_regiao` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Loja`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Loja` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `Loja` (
  `cnpj_loja` INT NOT NULL,
  `Lojanome` VARCHAR(15) NULL,
  `PontoEstratégico_idPontoEstratégico` INT NOT NULL,
  PRIMARY KEY (`cnpj_loja`, `PontoEstratégico_idPontoEstratégico`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_Loja_PontoEstratégico1_idx` ON `Loja` (`PontoEstratégico_idPontoEstratégico` ASC);

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `assistentes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assistentes` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `assistentes` (
  `cpfassistentes` INT NOT NULL,
  `assistentesnome` VARCHAR(45) NULL,
  `motorista_cpf_motorista` INT NOT NULL,
  `veiculo_cod_veiculo` INT NOT NULL,
  `veiculo_motorista_cpf_motorista` INT NOT NULL,
  PRIMARY KEY (`cpfassistentes`, `motorista_cpf_motorista`, `veiculo_cod_veiculo`, `veiculo_motorista_cpf_motorista`))
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `fk_assistentes_motorista1_idx` ON `assistentes` (`motorista_cpf_motorista` ASC);

SHOW WARNINGS;
CREATE INDEX `fk_assistentes_veiculo1_idx` ON `assistentes` (`veiculo_cod_veiculo` ASC, `veiculo_motorista_cpf_motorista` ASC);

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
