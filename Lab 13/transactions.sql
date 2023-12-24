USE SeguroVeiculo;
SELECT * FROM Apolices;

-- Iniciar uma transação
BEGIN TRANSACTION

-- verificar se há alguma transação ativa
SELECT @@TRANCOUNT;

UPDATE Apolices
SET valorApolice = valorApolice + 1500;

-- Cancelar uma operação
ROLLBACK TRANSACTION

BEGIN TRAN
	UPDATE Apolices
	SET valorApolice = valorApolice + 1500
	WHERE nContrato = 1000;

-- Confirmar
COMMIT TRAN

USE SisDep;

BEGIN TRAN
	UPDATE Funcionario
	SET Salario = Salario * 1.1
	OUTPUT
		deleted.idMatricula,
		deleted.NomeFuncionario,
		deleted.Salario AS [Salário Anterior],
		inserted.Salario AS [Novo Salário]
	WHERE Salario <= 3000

COMMIT