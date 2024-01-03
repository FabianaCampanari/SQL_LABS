-- 1.	Criar um banco de dados chamado PEDIDOS_VENDA:

CREATE DATABASE PEDIDOS_VENDA;

-- Colocar em uso o banco de dados PEDIDOS_VENDA:

USE PEDIDOS_VENDA;

-- 2.	Criar tabela chamada TB_PRODUTO com os campos:
/*
	Código do produto		inteiro, autonumeração e chave primária
	Nome do produto			alfanumérico
	Código da unid. de medida	inteiro
	Código da categoria		inteiro
	Quantidade em estoque		numérico
	Quantidade mínima		numérico
	Preço de custo			numérico
	Preço de venda			numérico
	Características técnicas	texto longo
	Fotografia			binário longo
*/

CREATE TABLE TB_PRODUTO
(	COD_PRODUTO		INT	IDENTITY	PRIMARY KEY,
	DESCRICAO		VARCHAR(50),
	COD_UNIDADE		INT,
	COD_CATEGORIA	INT,
	QTD_ESTOQUE		NUMERIC(12,2),
	QTD_MINIMA		NUMERIC(12,2),
	PRECO_CUSTO		NUMERIC(12,2),
	PRECO_VENDA		NUMERIC(12,2),
	CARACTERISTICAS	VARCHAR(max),
	FOTO			VARBINARY(max)	);

-- 3.	Criar a tabela TB_UNIDADE para armazenar as unidades de medida:
/*
	Código da unidade		inteiro, autonumeração e chave primária
	Nome da unidade			alfanumérico
*/

CREATE TABLE TB_UNIDADE
(	COD_UNIDADE		INT	IDENTITY	PRIMARY KEY,
	UNIDADE			VARCHAR(30) );

-- 4. Inserir na tabela as seguintes unidades:
/*
PEÇAS, METROS, QUILOGRAMAS, DÚZIAS, PACOTE, CAIXA
*/

INSERT INTO TB_UNIDADE (UNIDADE)
VALUES ('PEÇAS'), ('METROS'), ('QUILOGRAMAS'), ('DÚZIAS'), ('PACOTE'), ('CAIXA');


-- 5.	Criar a tabela TB_CATEGORIA para armazenar as categorias de produto:
/*
	Código da categoria		inteiro, autonumeração e chave primária
	Nome da categoria		alfanumérico
*/

CREATE TABLE TB_CATEGORIA
(	COD_CATEGORIA	INT	IDENTITY	PRIMARY KEY,
	CATEGORIA		VARCHAR(30) );

-- 6. Inserir na tabela as seguintes categorias:
/*
MOUSE, PEN-DRIVE, MONITOR DE VIDEO, TECLADO, CPU, CABO DE REDE
*/

INSERT INTO TB_CATEGORIA
VALUES ('MOUSE'), ('PEN-DRIVE'), ('MONITOR DE VIDEO'), ('TECLADO'), ('CPU'), ('CABO DE REDE');

-- 7.Inserir os produtos a seguir utilizando a cláusula OUTPUT:

INSERT INTO TB_PRODUTO
(DESCRICAO	,COD_UNIDADE,COD_CATEGORIA,QTD_ESTOQUE,QTD_MINIMA,PRECO_CUSTO,PRECO_VENDA )
OUTPUT INSERTED.*
VALUES
('Caneta Azul'		, 	1 ,	1 ,	150	,40 	, 0.50	, 0.75),
('Caneta Verde'		,	1 ,	1 ,	50	,40	, 0.50	, 0.75),
('Caneta Vermelha'	,	1 ,	1 ,	80	,35	, 0.50	, 0.75),
('Lápis'		,	1 ,	1 ,	400	,80	, 0.50	, 0.80),
('Régua'		,	1 ,	1 ,	40	,10	, 1.00	, 1.50)
