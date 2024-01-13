--1. Primeiramente, crie o banco de dados TESTE_CONSTRAINT:
GO
CREATE DATABASE TESTE_CONSTRAINT;
GO

USE TESTE_CONSTRAINT;

--2. Agora, crie a tabela TB_TIPO_PRODUTO com os tipos (categorias) de produto:
GO
-- Tabela de tipos (categorias) de produto
CREATE TABLE TB_TIPO_PRODUTO
(	COD_TIPO			INT IDENTITY NOT NULL,
	TIPO				VARCHAR(30) NOT NULL,
    -- Convenção de nome: PK_NomeTabela
    CONSTRAINT PK_TB_TIPO_PRODUTO PRIMARY KEY (COD_TIPO),
    -- Convenção De nome: UQ_NomeTabela_NomeCampo
    CONSTRAINT UQ_TB_TIPO_PRODUTO_TIPO UNIQUE( TIPO ) );
