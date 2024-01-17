USE SysConVendas;
SELECT * FROM DADOS;

SELECT SUM(TOTAL) AS [Faturamento Total] FROM Dados;

SELECT
	Cidade,SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade;


SELECT
	Produto,Cidade,SUM(TOTAL) AS [Faturamento Total],
	COUNT(*) AS [Nº de Ocorrências]
FROM Dados
GROUP BY Cidade,Produto;

-- Filtros em Agrupamento HAVING

SELECT
	Cidade,SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade
HAVING SUM(TOTAL) > 20000
ORDER BY 2;

-- Subtotais
SELECT
	Cidade,SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade
WITH ROLLUP


SELECT
	Cidade,Produto,SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade,Produto
WITH ROLLUP

SELECT
	Cidade,Produto,SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade,Produto
WITH CUBE

--------------------------------------------------------------------------
USE SisDep;

-- Agrupamento com junções

SELECT
	NomeFuncionario,count(*) [Nº de Dependentes] 
FROM Funcionario AS F INNER JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
GROUP BY NomeFuncionario;
