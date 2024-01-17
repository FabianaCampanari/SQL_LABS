-- Criando Tabela Tempor�ria Local (modo create table)
CREATE TABLE #Cliente
(
	id				int,
	nomeCliente		varchar(50),
	cadastro		date
);

SELECT * FROM #Cliente;

INSERT INTO #Cliente
VALUES(1,'H�lio',GETDATE());

-- Criando Tabela Tempor�ria Local (modo insert into)

USE SisDep;

SELECT * INTO
#Pesquisa1
FROM Funcionario;

-- Criando Tabela Tempor�ria Global (modo insert into)
SELECT * INTO
##Pesquisa2
FROM Funcionario
WHERE salario >= 3000;

