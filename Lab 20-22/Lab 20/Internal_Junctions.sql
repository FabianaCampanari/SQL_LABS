USE SisDep;

SELECT
	NomeFuncionario,Admissao,Salario,uf,Cidade
FROM Funcionario INNER JOIN Localidade
ON Funcionario.idLocalidade = Localidade.idLocalidade;


SELECT
	NomeFuncionario,NomeDepartamento,Admissao,Salario,uf,Cidade
FROM Funcionario INNER JOIN Localidade
ON Funcionario.idLocalidade = Localidade.idLocalidade
INNER JOIN Depto
ON Depto.idDepartamento = Funcionario.idDepartamento;

-- Nomes Qualificados

SELECT
	Funcionario.NomeFuncionario,
	Dependente.NascimentoDependente,
	Dependente.NascimentoDependente
FROM Funcionario INNER JOIN Dependente
ON Dependente.idMatricula = Funcionario.idMatricula
ORDER BY Funcionario.NomeFuncionario;


-- Rótulos ou Alias
SELECT
	F.NomeFuncionario,
	D.NomeDependente,
	D.NascimentoDependente
FROM Funcionario AS F INNER JOIN Dependente AS D
ON D.idMatricula = F.idMatricula
ORDER BY F.NomeFuncionario;

SELECT * from Funcionario;