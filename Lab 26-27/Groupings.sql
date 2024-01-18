USE SysConVendas;
SELECT * FROM DADOS;

SELECT SUM(TOTAL) AS [Faturamento Total] FROM Dados;

SELECT
	Cidade,SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade;


SELECT
	Produto,Cidade,SUM(TOTAL) AS [Faturamento Total],
	COUNT(*) AS [N� de Ocorr�ncias]
FROM Dados
GROUP BY Cidade,Produto;

-- Filtros em Agrupamento HAVING

SELECT
	Cidade,SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade
HAVING SUM(TOTAL) > 20000
ORDER BY 2;

SELECT
	Cidade,Produto,SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade,Produto
WITH ROLLUP

-- Subtotais
SELECT
	Cidade,SUM(TOTAL) AS [Faturamento Total]
FROM Dados
GROUP BY Cidade
WITH ROLLUP
