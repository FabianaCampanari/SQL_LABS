USE SisDep;

SELECT
	F.NomeFuncionario,F.Admissao,D.NomeDependente,D.NascimentoDependente
FROM Funcionario AS F FULL JOIN Dependente AS D
ON F.idMatricula = D.idMatricula
ORDER BY F.NomeFuncionario;


SELECT * FROM Depto;

SELECT * FROM Projeto;

SELECT
	D.NomeDepartamento,
	P.NomeProjeto,
	P.DataInicio,
	P.DataTermino
FROM DEPTO AS D CROSS JOIN Projeto AS P;