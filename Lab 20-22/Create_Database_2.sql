-- 1.	Criar um banco de dados chamado PEDIDOS_VENDA:

CREATE DATABASE PEDIDOS_VENDA;

-- Colocar em uso o banco de dados PEDIDOS_VENDA:

USE PEDIDOS_VENDA;

-- 2.	Criar tabela chamada TB_PRODUTO com os campos:
/*
	C�digo do produto		inteiro, autonumera��o e chave prim�ria
	Nome do produto			alfanum�rico
	C�digo da unid. de medida	inteiro
	C�digo da categoria		inteiro
	Quantidade em estoque		num�rico
	Quantidade m�nima		num�rico
	Pre�o de custo			num�rico
	Pre�o de venda			num�rico
	Caracter�sticas t�cnicas	texto longo
	Fotografia			bin�rio longo
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
	C�digo da unidade		inteiro, autonumera��o e chave prim�ria
	Nome da unidade			alfanum�rico
*/

CREATE TABLE TB_UNIDADE
(	COD_UNIDADE		INT	IDENTITY	PRIMARY KEY,
	UNIDADE			VARCHAR(30) );

-- 4. Inserir na tabela as seguintes unidades:
/*
PE�AS, METROS, QUILOGRAMAS, D�ZIAS, PACOTE, CAIXA
*/

INSERT INTO TB_UNIDADE (UNIDADE)
VALUES ('PE�AS'), ('METROS'), ('QUILOGRAMAS'), ('D�ZIAS'), ('PACOTE'), ('CAIXA');


-- 5.	Criar a tabela TB_CATEGORIA para armazenar as categorias de produto:
/*
	C�digo da categoria		inteiro, autonumera��o e chave prim�ria
	Nome da categoria		alfanum�rico
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

-- 7.Inserir os produtos a seguir utilizando a cl�usula OUTPUT:

INSERT INTO TB_PRODUTO
(DESCRICAO	,COD_UNIDADE,COD_CATEGORIA,QTD_ESTOQUE,QTD_MINIMA,PRECO_CUSTO,PRECO_VENDA )
OUTPUT INSERTED.*
VALUES
('Caneta Azul'		, 	1 ,	1 ,	150	,40 	, 0.50	, 0.75),
('Caneta Verde'		,	1 ,	1 ,	50	,40	, 0.50	, 0.75),
('Caneta Vermelha'	,	1 ,	1 ,	80	,35	, 0.50	, 0.75),
('L�pis'		,	1 ,	1 ,	400	,80	, 0.50	, 0.80),
('R�gua'		,	1 ,	1 ,	40	,10	, 1.00	, 1.50)
