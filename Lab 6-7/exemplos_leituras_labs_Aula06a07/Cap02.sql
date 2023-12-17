-- Criação de banco de dados SALA_DE_AULA
CREATE DATABASE SALA_DE_AULA;
GO

-- Colocar banco SALA_DE_AULA em uso
USE SALA_DE_AULA

--Criação da tabela TB_ALUNO
GO
CREATE TABLE TB_ALUNO
(	COD_ALUNO			INT,
	NOME				VARCHAR(30),
	DATA_NASCIMENTO		DATETIME,
	IDADE				TINYINT,
	E_MAIL				VARCHAR(50),
	FONE_RES			CHAR(9),
	FONE_COM			CHAR(9),
	FAX					CHAR(9),
	CELULAR				CHAR(9),
	PROFISSAO			VARCHAR(40),
	EMPRESA				VARCHAR(50) );

GO

--Campo autonumerável (IDENTITY)

DROP TABLE TB_ALUNO;		--Caso a tabela já exista
GO

CREATE TABLE TB_ALUNO
(	NUM_ALUNO			INT IDENTITY,
	NOME				VARCHAR(30),
	DATA_NASCIMENTO		DATETIME,
	IDADE				TINYINT,
	E_MAIL				VARCHAR(50),
	FONE_RES			CHAR(8),
	FONE_COM			CHAR(8),
	FAX					CHAR(8),
	CELULAR				CHAR(9),
	PROFISSAO			VARCHAR(40),
	EMPRESA				VARCHAR(50) );
GO

-- Nulabilidade
DROP TABLE TB_ALUNO;		--Caso a tabela já exista
GO

CREATE TABLE TB_ALUNO
(	CODIGO			INT			NOT NULL,
	NOME			VARCHAR(30)	NOT NULL,
	E_MAIL			VARCHAR(100)	NULL 	);

GO





/*
CONSTRAINTS -> Validações, Restrições, Consistência
               de dados. As constraints permitem
               validar os dados que são gravados nas
               tabelas do banco de dados.

Existem 5 tipos de constraints:
   
   Chave Primária (PRIMARY KEY):
      Indica o(s) campo(s) que identifica(m) uma linha 
      da tabela. Impede também a duplicação do campo.
       
   Chave Única (UNIQUE): 
      Impede a duplicação de outro campo além da
      chave primária.

   Condição de validade (CHECK):
      Testa uma condição toda vez que formos gravar
      dados em uma tabela. Se a condição for FALSA,
      os dados não serão gravados.

   Valor padrão (DEFAULT):
      Indica o valor que deve ser gravado em um campo
      quando um INSERT não fornecer valor para ele.

   Chave Estrangeira (FOREIGN KEY):
      Relaciona 2 tabelas de um banco de dados impedindo
      que seja gravado um registro na tabela detalhe
      sem que exista um registro correspondente na tabela 
      mestre.
*/


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

--3. Em seguida, teste a constraint UNIQUE criada:

-- Testando a constraint UNIQUE
INSERT TB_TIPO_PRODUTO VALUES ('MOUSE');
INSERT TB_TIPO_PRODUTO VALUES ('PEN-DRIVE');
INSERT TB_TIPO_PRODUTO VALUES ('HARD DISK');
-- Ao tentar inserir o SQL gera um erro de violação de
-- CONSTRAINT UNIQUE
INSERT TB_TIPO_PRODUTO VALUES ('HARD DISK');

--4. O próximo passo é criar a tabela de produtos (TB_PRODUTO):

GO
-- Tabela de TB_PRODUTO
CREATE TABLE TB_PRODUTO
(   ID_PRODUTO			INT IDENTITY NOT NULL,
    DESCRICAO			VARCHAR(50),
    COD_TIPO			INT,
    PRECO_CUSTO			NUMERIC(10,2),
    PRECO_VENDA			NUMERIC(10,2),
    QTD_REAL			NUMERIC(10,2),
    QTD_MINIMA			NUMERIC(10,2),
    DATA_CADASTRO		DATETIME DEFAULT GETDATE(),
    SN_ATIVO			CHAR(1) DEFAULT 'S',
    CONSTRAINT PK_TB_PRODUTO PRIMARY KEY( ID_PRODUTO ),
    CONSTRAINT UQ_TB_PRODUTO_DESCRICAO UNIQUE( DESCRICAO ),
    
    CONSTRAINT CK_TB_PRODUTO_PRECOS 
               CHECK( PRECO_VENDA >= PRECO_CUSTO ),
    CONSTRAINT CK_TB_PRODUTO_DATA_CAD
               CHECK( DATA_CADASTRO <= GETDATE() ),
    CONSTRAINT CK_TB_PRODUTO_SN_ATIVO
               CHECK( SN_ATIVO IN ('N','S') ),
    -- Convenção de nome: FK_TabelaDetalhe_TabelaMestre
    CONSTRAINT FK_TB_PRODUTO_TIPO_PRODUTO
               FOREIGN KEY (COD_TIPO)
               REFERENCES TB_TIPO_PRODUTO (COD_TIPO)    );

GO

--6. Feito isso, teste a constraint DEFAULT criada anteriormente. A sequência de código adiante gera os valores para os campos DATA_CADASTRO e SN_ATIVO que não foram mencionados no INSERT:

INSERT TB_PRODUTO 
(DESCRICAO, COD_TIPO, PRECO_CUSTO, PRECO_VENDA,
 QTD_REAL, QTD_MINIMA)
VALUES ('TESTANDO INCLUSAO', 1, 10, 12, 10, 5 );
--
SELECT * FROM TB_PRODUTO;

--7. No código seguinte, teste a constraint UNIQUE:

-- Gera erro pois viola a CONSTRAINT UNIQUE
INSERT TB_PRODUTO 
(DESCRICAO, COD_TIPO, PRECO_CUSTO, PRECO_VENDA,
 QTD_REAL, QTD_MINIMA)
VALUES ('TESTANDO INCLUSAO', 10, 10, 12, 10, 5 );

--8. No próximo código, teste a constraint FOREIGN KEY:

-- Gera um erro pois viola a CONSTRAINT FOREIGN KEY
INSERT TB_PRODUTO 
(DESCRICAO, COD_TIPO, PRECO_CUSTO, PRECO_VENDA,
 QTD_REAL, QTD_MINIMA)
VALUES ('TESTANDO INCLUSAO 2', 10, 10, 12, 10, 5 );

---9. Por fim, o código adiante testa a constraint CHECK:

-- Gera um erro pois viola a constraint CHECK –
-- (CK_PRODUTO_PRECOS)
INSERT TB_PRODUTO 
(DESCRICAO, COD_TIPO, PRECO_CUSTO, PRECO_VENDA,
 QTD_REAL, QTD_MINIMA)
VALUES ('TESTANDO INCLUSAO 2', 1, 14, 12, 10, 5 );

---1.6.3.2.	Criando constraints com ALTER TABLE

USE TESTE_CONSTRAINT;

DROP TABLE TB_PRODUTO
GO
DROP TABLE TB_TIPO_PRODUTO
GO
-- Criação da tabela TIPO_PRODUTO
CREATE TABLE TB_TIPO_PRODUTO
(	COD_TIPO			INT IDENTITY NOT NULL,
	TIPO				VARCHAR(30) NOT NULL );
-- Criando as constraints com ALTER TABLE
ALTER TABLE TB_TIPO_PRODUTO ADD
    CONSTRAINT PK_TIPO_PRODUTO PRIMARY KEY (COD_TIPO);

ALTER TABLE TB_TIPO_PRODUTO ADD
    CONSTRAINT UQ_TIPO_PRODUTO_TIPO UNIQUE( TIPO ); 

-- Criando a tabela TB_PRODUTO
CREATE TABLE TB_PRODUTO
(   ID_PRODUTO			INT IDENTITY NOT NULL,
    DESCRICAO			VARCHAR(50),
    COD_TIPO			INT,
    PRECO_CUSTO			NUMERIC(10,2),
    PRECO_VENDA			NUMERIC(10,2),
    QTD_REAL			NUMERIC(10,2),
    QTD_MINIMA			NUMERIC(10,2),
    DATA_CADASTRO		DATETIME,
    SN_ATIVO			CHAR(1) );

-- Criando as constraints com ALTER TABLE
ALTER TABLE TB_PRODUTO ADD
    CONSTRAINT PK_TB_PRODUTO PRIMARY KEY( ID_PRODUTO );

ALTER TABLE TB_PRODUTO ADD
    CONSTRAINT UQ_TB_PRODUTO_DESCRICAO UNIQUE( DESCRICAO );

-- Criando várias constraints em um único ALTER TABLE
ALTER TABLE TB_PRODUTO ADD    
    CONSTRAINT CK_TB_PRODUTO_PRECOS 
               CHECK( PRECO_VENDA >= PRECO_CUSTO ),
    CONSTRAINT CK_TB_PRODUTO_DATA_CAD
               CHECK( DATA_CADASTRO <= GETDATE() ),
    CONSTRAINT CK_TB_PRODUTO_SN_ATIVO
               CHECK( SN_ATIVO IN ('N','S') ),
    CONSTRAINT FK_TB_PRODUTO_TIPO_PRODUTO
               FOREIGN KEY (COD_TIPO)
               REFERENCES TB_TIPO_PRODUTO (COD_TIPO),    
   CONSTRAINT DF_TB_PRODUTO_SN_ATIVO DEFAULT ('S') FOR SN_ATIVO,
   CONSTRAINT DF_TB_PRODUTO_DATA_CADASTRO DEFAULT (GETDATE())
                               FOR DATA_CADASTRO;

---1.6.3.3.	Criando constraints graficamente

USE TESTE_CONSTRAINT;

DROP TABLE TB_PRODUTO 
GO
DROP TABLE TB_TIPO_PRODUTO
GO
-- Criação da tabela TIPO_PRODUTO
CREATE TABLE TB_TIPO_PRODUTO
(	COD_TIPO			INT IDENTITY NOT NULL,
	TIPO				VARCHAR(30) NOT NULL );

-- Criando a tabela PRODUTO
CREATE TABLE TB_PRODUTOS
(   ID_PRODUTO			INT IDENTITY NOT NULL,
    DESCRICAO			VARCHAR(50),
    COD_TIPO			INT,
    PRECO_CUSTO			NUMERIC(10,2),
    PRECO_VENDA			NUMERIC(10,2),
    QTD_REAL			NUMERIC(10,2),
    QTD_MINIMA			NUMERIC(10,2),
    DATA_CADASTRO		DATETIME,
    SN_ATIVO			CHAR(1) );




