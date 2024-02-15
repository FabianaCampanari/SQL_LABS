USE PEDIDOS;
SELECT * FROM TB_EMPREGADO;

SELECT CODFUN, NOME, SALARIO FROM TB_EMPREGADO;


SELECT CODFUN, NOME, SALARIO, SALARIO * 1.10 
FROM TB_EMPREGADO;

SELECT CODFUN, NOME, SALARIO, 
        SALARIO * 1.10 AS SALARIO_MAIS_10_POR_CENTO
FROM TB_EMPREGADO;


SELECT CODFUN AS Codigo, 
NOME AS Nome, SALARIO AS Salario 
FROM TB_EMPREGADO;

SELECT CODFUN AS Codigo, NOME AS Nome, SALARIO AS Salario,
       DATA_ADMISSAO AS [Data de Admiss�o] 
FROM TB_EMPREGADO;
-- ou
SELECT CODFUN AS Codigo, NOME AS Nome, SALARIO AS Salario,
       DATA_ADMISSAO AS 'Data de Admiss�o' 
FROM TB_EMPREGADO;
-- ou
SELECT CODFUN AS Codigo, NOME AS Nome, SALARIO AS Salario,
       DATA_ADMISSAO AS "Data de Admiss�o"
FROM TB_EMPREGADO;

-- Campo calculado
SELECT CODFUN AS Codigo, 
       NOME AS Nome, 
SALARIO AS Salario,
       SALARIO * 1.10 [Sal�rio com 10% de Aumento]
FROM TB_EMPREGADO       

SELECT * FROM TB_EMPREGADO ORDER BY NOME;
SELECT * FROM TB_EMPREGADO ORDER BY NOME ASC;
SELECT * FROM TB_EMPREGADO ORDER BY SALARIO;
SELECT * FROM TB_EMPREGADO ORDER BY SALARIO ASC;

SELECT * FROM TB_EMPREGADO ORDER BY DATA_ADMISSAO;

SELECT * FROM TB_EMPREGADO ORDER BY NOME DESC;
SELECT * FROM TB_EMPREGADO ORDER BY SALARIO DESC;
SELECT * FROM TB_EMPREGADO ORDER BY DATA_ADMISSAO DESC;

-- Pela coluna SALARIO
SELECT CODFUN AS C�digo, 
       NOME AS Nome, 
       SALARIO AS Sal�rio,
       SALARIO * 1.10 [Sal�rio com 10% de aumento]
FROM TB_EMPREGADO
ORDER BY Sal�rio; 

-- Idem ao anterior
SELECT CODFUN AS C�digo, 
       NOME AS Nome,
       SALARIO AS Sal�rio,
       SALARIO * 1.10 [Sal�rio com 10% de aumento]

       
