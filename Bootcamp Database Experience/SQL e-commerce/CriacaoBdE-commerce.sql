-- MySQL Script generated by MySQL Workbench
-- Mon Sep 19 21:37:44 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecommerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecommerce` DEFAULT CHARACTER SET utf8 COLLATE utf8_danish_ci ;
USE `ecommerce` ;

-- -----------------------------------------------------
-- Table `ecommerce`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`produto` (
  `idProduto` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  `preco` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`pf` (
  `idPF` INT NOT NULL AUTO_INCREMENT,
  `CPF` INT NOT NULL,
  PRIMARY KEY (`idPF`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`pj` (
  `idPJ` INT NOT NULL AUTO_INCREMENT,
  `CNPJ` INT NOT NULL,
  PRIMARY KEY (`idPJ`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `identFiscal` ENUM('PF', 'PJ') NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `pf_idPF` INT NULL,
  `pj_idPJ` INT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_cliente_pf1_idx` (`pf_idPF` ASC) VISIBLE,
  INDEX `fk_cliente_pj1_idx` (`pj_idPJ` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_pf1`
    FOREIGN KEY (`pf_idPF`)
    REFERENCES `ecommerce`.`pf` (`idPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_pj1`
    FOREIGN KEY (`pj_idPJ`)
    REFERENCES `ecommerce`.`pj` (`idPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`estoque` (
  `idEstoque` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL DEFAULT 'Armazem',
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`frete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`frete` (
  `idFrete` INT NOT NULL AUTO_INCREMENT,
  `statusEntrega` VARCHAR(45) NOT NULL,
  `codRastreio` VARCHAR(45) NOT NULL,
  `valorFrete` INT NOT NULL,
  `tempoEntrega` VARCHAR(45) NOT NULL,
  `transportadora` VARCHAR(45) NOT NULL,
  UNIQUE INDEX `Codigo de rastreio_UNIQUE` (`codRastreio` ASC) VISIBLE,
  PRIMARY KEY (`idFrete`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`pedido` (
  `idPedido` INT NOT NULL AUTO_INCREMENT,
  `statusPedido` ENUM('Aguardando Pagamento', 'Pagamento Confirmado', 'Em separação', 'Em rota de Entrega', 'Entregue', 'Cancelado') NOT NULL,
  `descricao` VARCHAR(45) NULL,
  `frete_idFrete` INT NOT NULL,
  `cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `frete_idFrete`, `cliente_idCliente`),
  INDEX `fk_pedido_frete1_idx` (`frete_idFrete` ASC) VISIBLE,
  INDEX `fk_pedido_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_frete1`
    FOREIGN KEY (`frete_idFrete`)
    REFERENCES `ecommerce`.`frete` (`idFrete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ecommerce`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`fornecedor` (
  `idFornecedor` INT NOT NULL AUTO_INCREMENT,
  `razaoSocial` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`vendedorTerceiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`vendedorTerceiro` (
  `idVendedorTerceiro` INT NOT NULL AUTO_INCREMENT,
  `razaoSocial` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVendedorTerceiro`),
  UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`cartoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`cartoes` (
  `idCartao` INT NOT NULL AUTO_INCREMENT,
  `numCartao` INT NOT NULL,
  `nomeCartao` VARCHAR(45) NOT NULL,
  `bandeira` VARCHAR(45) NOT NULL,
  `dataVencimento` INT NOT NULL,
  `cliente_idCliente` INT NULL,
  PRIMARY KEY (`idCartao`),
  INDEX `fk_cartoes_cliente1_idx` (`cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_cartoes_cliente1`
    FOREIGN KEY (`cliente_idCliente`)
    REFERENCES `ecommerce`.`cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`disponibilizaProduto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`disponibilizaProduto` (
  `fornecedor_idFornecedor` INT NOT NULL,
  `produto_idProduto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`fornecedor_idFornecedor`, `produto_idProduto`),
  INDEX `fk_fornecedor_has_produto_produto1_idx` (`produto_idProduto` ASC) VISIBLE,
  INDEX `fk_fornecedor_has_produto_fornecedor1_idx` (`fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_fornecedor_has_produto_fornecedor1`
    FOREIGN KEY (`fornecedor_idFornecedor`)
    REFERENCES `ecommerce`.`fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornecedor_has_produto_produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `ecommerce`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`produtoEmEstoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`produtoEmEstoque` (
  `produto_idProduto` INT NOT NULL,
  `estoque_idEstoque` INT NOT NULL,
  `quantidade` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`produto_idProduto`, `estoque_idEstoque`),
  INDEX `fk_produto_has_estoque_estoque1_idx` (`estoque_idEstoque` ASC) VISIBLE,
  INDEX `fk_produto_has_estoque_produto1_idx` (`produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_estoque_produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `ecommerce`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_estoque_estoque1`
    FOREIGN KEY (`estoque_idEstoque`)
    REFERENCES `ecommerce`.`estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`relacaoProdutoTerceiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`relacaoProdutoTerceiro` (
  `vendedorTerceiro_idVendedorTerceiro` INT NOT NULL,
  `produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`vendedorTerceiro_idVendedorTerceiro`, `produto_idProduto`),
  INDEX `fk_vendedorTerceiro_has_produto_produto1_idx` (`produto_idProduto` ASC) VISIBLE,
  INDEX `fk_vendedorTerceiro_has_produto_vendedorTerceiro1_idx` (`vendedorTerceiro_idVendedorTerceiro` ASC) VISIBLE,
  CONSTRAINT `fk_vendedorTerceiro_has_produto_vendedorTerceiro1`
    FOREIGN KEY (`vendedorTerceiro_idVendedorTerceiro`)
    REFERENCES `ecommerce`.`vendedorTerceiro` (`idVendedorTerceiro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendedorTerceiro_has_produto_produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `ecommerce`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ecommerce`.`relacaoProdutoPedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecommerce`.`relacaoProdutoPedido` (
  `produto_idProduto` INT NOT NULL,
  `pedido_idPedido` INT NOT NULL,
  PRIMARY KEY (`produto_idProduto`, `pedido_idPedido`),
  INDEX `fk_produto_has_pedido_pedido1_idx` (`pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_produto_has_pedido_produto1_idx` (`produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_pedido_produto1`
    FOREIGN KEY (`produto_idProduto`)
    REFERENCES `ecommerce`.`produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_pedido_pedido1`
    FOREIGN KEY (`pedido_idPedido`)
    REFERENCES `ecommerce`.`pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;