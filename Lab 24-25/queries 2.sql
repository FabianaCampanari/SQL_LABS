USE Clientes;

SELECT * FROM Clientes2015;
SELECT * FROM Clientes2016;

-- Quais clientes na base 2015 tamb�m est�o na base 2016
SELECT * FROM Clientes2015 C15
WHERE
	EXISTS
	(
		SELECT Codigo FROM Clientes2016 C16
		WHERE C15.Codigo = C16.Codigo
	);

-- Quais clientes na base 2015 que n�o est�o na base 2016
SELECT * FROM Clientes2015 C15
WHERE
	NOT EXISTS
	(
		SELECT Codigo FROM Clientes2016 C16
		WHERE C15.Codigo = C16.Codigo	
	)

--------------------------------------------------------------------------------
USE SisDep;

-- Nome dos Funcion�rios que possuam dependentes
SELECT
	F.NomeFuncionario
FROM Funcionario AS F
WHERE
	F.idMatricula IN(
		SELECT D.idMatricula FROM Dependente D);

-- Nome dos Funcion�rios que n�o possuam dependentes
SELECT
	F.NomeFuncionario
FROM Funcionario AS F
WHERE
	F.idMatricula NOT IN(
		SELECT D.idMatricula FROM Dependente D);

-- Retornar funcion�rios com sal�rio acima da m�dia salarial

SELECT AVG(SALARIO) FROM Funcionario;

SELECT
	NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE SALARIO > (SELECT AVG(SALARIO) FROM Funcionario);