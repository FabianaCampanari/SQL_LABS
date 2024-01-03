-- Operadores
DECLARE @A INT = 10;
SET @A += 5;   -- O mesmo que SET @A = @A + 5;
PRINT @A;
SET @A -= 2;   -- O mesmo que SET @A = @A - 2;
PRINT @A;
SET @A *= 4;   -- O mesmo que SET @A = @A * 4;
PRINT @A;
SET @A /= 2;   -- O mesmo que SET @A = @A / 2;
PRINT @A;
GO

-- Alterar dados de uma coluna
USE PEDIDOS;


-- Aumentar o salário de todos os funcionários em 20%
UPDATE TB_EMPREGADO
SET SALARIO = SALARIO * 1.2;
-- OU
UPDATE TB_EMPREGADO
SET SALARIO *= 1.2;

-- Somar 2 na quantidade de dependentes do funcionário de
-- código 5
UPDATE TB_EMPREGADO
SET NUM_DEPEND = NUM_DEPEND + 2
WHERE CODFUN = 5;
-- OU
UPDATE TB_EMPREGADO
SET NUM_DEPEND += 2
WHERE CODFUN = 5;

SELECT * FROM TB_CLIENTE WHERE CODCLI = 5;

-- Alterar os dados do cliente de código 5
UPDATE TB_CLIENTE
SET ENDERECO = 'AV. PAULISTA, 1009 - 10 AND',
    BAIRRO   = 'CERQUEIRA CESAR',
    CIDADE   = 'SÃO PAULO'
WHERE CODCLI = 5;

-- Conferir o resultado da alteração
SELECT * FROM TB_CLIENTE WHERE CODCLI = 5;


SELECT * FROM TB_PRODUTO
WHERE COD_TIPO = 5;

-- Alterar os dados do grupo de produtos
UPDATE TB_PRODUTO SET QTD_ESTIMADA = QTD_REAL,
                    CLAS_FISC = '96082000',
                    IPI = 8
WHERE COD_TIPO = 5;

-- A linha a seguir confere o resultado da alteração
SELECT * FROM TB_PRODUTO
WHERE COD_TIPO = 5;


-- Consultar
SELECT * FROM EMP_TEMP;
-- Multiplicar por 10 o valor do SALARIO de 15 registros da tabela
UPDATE TOP(15) EMP_TEMP SET SALARIO = 10*SALARIO;
-- Consultar
SELECT * FROM EMP_TEMP;


SELECT * INTO EMPREGADOS_TMP FROM TB_EMPREGADO;


SELECT * FROM EMPREGADOS_TMP WHERE SALARIO > 5000;
--
DELETE FROM EMPREGADOS_TMP WHERE SALARIO > 5000;
-- 
SELECT * FROM EMPREGADOS_TMP WHERE SALARIO > 5000;

SELECT * FROM EMPREGADOS_TMP WHERE CODFUN IN (3,5,7);
--
DELETE FROM EMPREGADOS_TMP WHERE CODFUN IN (3,5,7);

SELECT * FROM EMPREGADOS_TMP WHERE CODFUN IN (3,5,7);


DELETE FROM EMPREGADOS_TMP;
-- OU
TRUNCATE TABLE EMPREGADOS_TMP;
--


SELECT * FROM EMPREGADOS_TMP;

-- Colocar o banco de dados PEDIDOS em uso
USE PEDIDOS;
-- Criar a tabela a partir do comando SELECT INTO
SELECT * INTO CLIENTE_MG FROM TB_CLIENTE;
-- Consultar CLIENTE_MG
SELECT * FROM CLIENTE_MG;

DELETE TOP(10) FROM CLIENTE_MG;
-- Consultar
SELECT * FROM CLIENTE_MG;

-- Colocar o banco PEDIDOS em uso
USE PEDIDOS;

-- 1. Gerar uma cópia da tabela TB_EMPREGADO chamada EMP_TEMP
CREATE TABLE EMP_TEMP
( CODFUN    INT PRIMARY KEY,
  NOME      VARCHAR(30),
  COD_DEPTO INT,
  COD_CARGO	INT,
  SALARIO	NUMERIC(10,2) )
GO  

-- 2. Inserir dados e exibir os registros inseridos
INSERT INTO EMP_TEMP OUTPUT INSERTED.*
SELECT CODFUN, NOME, COD_DEPTO, COD_CARGO, SALARIO
FROM TB_EMPREGADO;
GO

-- 4. Deletar registros e mostrar os registros deletados
DELETE FROM EMP_TEMP OUTPUT DELETED.*
WHERE COD_DEPTO = 2
GO

-- 6. Alterar registros e mostrar os dados antes e depois da 
--    alteração
UPDATE EMP_TEMP SET SALARIO *= 1.5
OUTPUT 
   INSERTED.CODFUN, INSERTED.NOME, INSERTED.COD_DEPTO, 
   DELETED.SALARIO AS SALARIO_ANTIGO, 
   INSERTED.SALARIO AS SALARIO_NOVO
WHERE COD_DEPTO = 3;
GO

-- Alterar os salários dos funcionários com COD_CARGO = 5 
-- para R$950,00
-- Abrir processo de transação
BEGIN TRANSACTION;
-- Verificar se existe processo de transação aberto
SELECT @@TRANCOUNT;
-- Alterar os salários do COD_CARGO = 5
UPDATE TB_Empregado SET SALARIO = 950 
OUTPUT inserted.CODFUN, inserted.NOME , 
deleted.salario as Salario_Anterior,
inserted.salario as Salario_Atualizado
WHERE COD_CARGO = 5 
-- Conferir os resultados na listagem gerada pela cláusula 
-- OUTPUT
-- Se estiver tudo OK...
COMMIT TRANSACTION
-- caso contrário
ROLLBACK TRANSACTION
