USE SisDep;

-- Retornar o total geral de sal�rios pagos
SELECT SUM(salario) AS [Total de Sal�rios] FROM Funcionario;

-- Retornar a m�dia de sal�rios
SELECT AVG(salario) AS [M�dia Salarial] FROM Funcionario;

-- Mais de uma agrega��o no mesmo comando SELECT

SELECT
	MAX(SALARIO) AS [Maior Sal�rio],
	MIN(SALARIO) AS [Menor Sal�rio],
	COUNT(SALARIO) AS [N� de Funcion�rios]
FROM Funcionario;

USE SysConVendas;
SELECT * FROM Dados;

SELECT COUNT(Vendedor) AS Contagem_Coluna FROM Dados;

SELECT COUNT(pedido) AS Contagem_Coluna FROM Dados;

SELECT COUNT(*) AS Contagem_Linha FROM Dados;
