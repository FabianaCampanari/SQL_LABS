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

-