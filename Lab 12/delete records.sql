USE Consorcio;

-- visualizando dados da tabela carteira
SELECT * FROM Carteiras;

-- Excluindo Registros
DELETE FROM Carteiras
WHERE Cpf = 74632202244;

DELETE FROM Carteiras
WHERE Uf = 'GO';

USE SisDep;

-- Exclus�o Bem Sucedida
DELETE FROM Funcionario
WHERE idMatricula = 1001;

-- Exclus�o Mal Sucedida (ERRO)
DELETE FROM Funcionario
WHERE idMatricula = 1000;

SELECT * FROM Dependente
WHERE idMatricula = 1000;

