USE SisDep;

-- Todas as colunas de uma tabela
SELECT * FROM Funcionario;

-- Somente algumas colunas
SELECT idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario;

-- Ordernar Dados
SELECT idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
ORDER BY NomeFuncionario ASC;

SELECT idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
ORDER BY Salario DESC;

-- Ordenação por mais de uma coluna
SELECT idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
ORDER BY idDepartamento ASC,Salario DESC;

-- Ordenar pela posição da coluna
SELECT idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
ORDER BY 1 ASC,5 DESC;

-- RANK TOP
-- 20 primeiras linhas da tabela
SELECT TOP 20 idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario;

-- 10% DE REGISTROS
SELECT TOP 10 PERCENT idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario;

-- 10 Maiores Salários
SELECT TOP 9 idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
ORDER BY Salario DESC;

-- Com Empates
SELECT TOP 9 WITH TIES idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
ORDER BY Salario DESC;


-- Retornar 5 funcionários mais antigos
SELECT TOP 5 WITH TIES idDepartamento,idMatricula,NomeFuncionario,Admissao,Salario
FROM Funcionario
ORDER BY Admissao ASC;