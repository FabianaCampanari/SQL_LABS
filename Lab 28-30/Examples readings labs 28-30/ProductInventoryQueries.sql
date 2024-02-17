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
FROM TB_EMPREGADO
ORDER BY 3;
       
-- Pela coluna SALARIO * 1.10
SELECT CODFUN AS C�digo, 
       NOME AS Nome, 
       SALARIO AS Sal�rio,
       SALARIO * 1.10 [Sal�rio com 10% de aumento]
FROM TB_EMPREGADO
ORDER BY [Sal�rio com 10% de Aumento]; 

-- Idem ao anterior
SELECT CODFUN AS C�digo, 
       NOME AS Nome, 
       SALARIO AS Sal�rio,
       SALARIO * 1.10 [Sal�rio com 10% de aumento]
FROM TB_EMPREGADO
ORDER BY 4     
      
SELECT CODFUN, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY SALARIO;
--
SELECT CODFUN, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY DATA_ADMISSAO;

SELECT COD_DEPTO, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY COD_DEPTO;

SELECT COD_DEPTO, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY COD_DEPTO, NOME;

SELECT COD_DEPTO, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY COD_DEPTO, SALARIO;
--
SELECT COD_DEPTO, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY COD_DEPTO, DATA_ADMISSAO;
-- Continua valendo o uso do "alias" ou da posi��o da 
-- coluna
SELECT COD_DEPTO, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY 1, 3;

SELECT COD_DEPTO, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY COD_DEPTO DESC, SALARIO;
--
SELECT COD_DEPTO, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY COD_DEPTO, SALARIO DESC;
--
SELECT COD_DEPTO, NOME, DATA_ADMISSAO, SALARIO 
FROM TB_EMPREGADO 
ORDER BY COD_DEPTO DESC, SALARIO DESC;

-- Lista os 5 primeiros empregados de acordo com a chave 
-- prim�ria
SELECT TOP 5 * FROM TB_EMPREGADO;

-- Lista os 5 empregados mais antigos
SELECT TOP 5 * FROM TB_EMPREGADO
ORDER BY DATA_ADMISSAO;

-- Lista os 5 empregados mais novos
SELECT TOP 5 * FROM TB_EMPREGADO 
ORDER BY DATA_ADMISSAO DESC;

-- Lista os 5 empregados que ganham menos
SELECT TOP 5 * FROM TB_EMPREGADO 
ORDER BY SALARIO;

-- Lista os 5 empregados que ganham mais
SELECT TOP 5 * FROM TB_EMPREGADO
ORDER BY SALARIO DESC;
--
SELECT CODFUN, NOME, SALARIO 
FROM TB_EMPREGADO 
ORDER BY SALARIO DESC;

-- Listar os 7 funcion�rios que ganham mais
SELECT TOP 7 CODFUN, NOME, SALARIO 
FROM TB_EMPREGADO 
ORDER BY SALARIO DESC;

-- Listar os 7 empregados que ganham mais, inclusive 
-- aqueles empatados com o �ltimo
SELECT TOP 7 WITH TIES CODFUN, NOME, SALARIO FROM TB_EMPREGADO 
ORDER BY SALARIO DESC;

-- Listar os 7 empregados que ganham mais, inclusive 
-- aqueles empatados com o �ltimo
SELECT TOP 7 WITH TIES CODFUN, NOME, SALARIO FROM TB_EMPREGADO 
ORDER BY SALARIO DESC;

--Mostrando os funcion�rios com SAL�RIO abaixo de 1000
SELECT CODFUN, NOME, COD_CARGO, SALARIO FROM TB_EMPREGADO 
WHERE SALARIO < 1000
ORDER BY SALARIO;

--Mostrando os funcion�rios com SAL�RIO acima de 5000
SELECT CODFUN, NOME, COD_CARGO, SALARIO FROM TB_EMPREGADO
WHERE SALARIO > 5000
ORDER BY SALARIO;

--Mostrando os funcion�rios com campo COD_DEPTO menor ou igual a 3
SELECT * FROM TB_EMPREGADO 
WHERE COD_DEPTO <= 3
ORDER BY COD_DEPTO;

--Mostrando os funcion�rios com campo COD_DEPTO igual a 2
SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO = 2
ORDER BY COD_DEPTO;

--Mostrando os funcion�rios com campo COD_DEPTO diferente de 2
SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO <> 2
ORDER BY COD_DEPTO;

--Mostrando os funcion�rios que tenham NOME alfabeticamente maior que RAQUEL
SELECT CODFUN, NOME, SALARIO
FROM TB_EMPREGADO
WHERE NOME > 'RAQUEL'
ORDER BY NOME;
--
SELECT CODFUN, NOME, SALARIO
FROM TB_EMPREGADO
WHERE NOME < 'ELIANA'
ORDER BY NOME;

SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO = 2 AND SALARIO > 5000;

SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO = 2 OR SALARIO > 5000;

SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO = 2 AND COD_DEPTO = 5;

SELECT * FROM TB_EMPREGADO
WHERE COD_DEPTO = 2 OR COD_DEPTO = 5;

SELECT * FROM TB_EMPREGADO
