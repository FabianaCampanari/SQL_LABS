USE SisDep;

SELECT
	idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE Salario BETWEEN 1500 AND 3000;

SELECT
	idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE Admissao BETWEEN '2005/1/1' AND '2005/12/31';

SELECT
	idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE Admissao NOT BETWEEN '2005/1/1' AND '2005/12/31';

--------------------------------------------------------------------------------
SELECT
	idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE idDepartamento IN(1,3,5,6,10);

SELECT
	idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE idDepartamento NOT IN(1,7)
ORDER BY 1;

--------------------------------------------------------------------------------
-- LIKE

/*
	Caracteres Coringa

	% = 1 ou mais caracteres desconhecidos
	_ = somente 1 caractere desconhecido

*/

SELECT
	idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE NomeFuncionario LIKE 'A%'
ORDER BY NomeFuncionario;


SELECT
	idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE NomeFuncionario LIKE 'A_A%'
ORDER BY NomeFuncionario;

SELECT
	idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE NomeFuncionario LIKE '%Oliveira'
ORDER BY NomeFuncionario;

SELECT
	idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
WHERE NomeFuncionario LIKE '%Silva%'
ORDER BY NomeFuncionario;