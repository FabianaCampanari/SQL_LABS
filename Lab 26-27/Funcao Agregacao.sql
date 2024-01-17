USE SisDep;

-- Retornar o total geral de salários pagos
SELECT SUM(salario) AS [Total de Salários] FROM Funcionario;

-- Retornar a média de salários
SELECT AVG(salario) AS [Média Salarial] FROM Funcionario;

-- Mais de uma agregação no mesmo comando SELECT

SELECT
	MAX(SALARIO) AS [Maior Salário],
	MIN(SALARIO) AS [Menor Salário],
	COUNT(SALARIO) AS [Nº de Funcionários]
FROM Funcionario;

USE SysConVendas;
SELECT * FROM Dados;

SELECT COUNT(Vendedor) AS Contagem_Coluna FROM Dados;

SELECT COUNT(pedido) AS Contagem_Coluna FROM Dados;

SELECT COUNT(*) AS Contagem_Linha FROM Dados;
