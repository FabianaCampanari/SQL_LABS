Use SeguroVeiculo;

SELECT * FROM Apolices;

-- Operadores relacionais
SELECT * FROM Apolices
WHERE valorApolice >= 50000;

-- Operadores Lógicos
SELECT * FROM Apolices
WHERE idSeguradora = 1 OR idSeguradora = 3;

SELECT * FROM Apolices
WHERE idSeguradora = 1 AND valorApolice >= 50000;

SELECT * FROM Apolices
WHERE NOT idCidade = 5;


SELECT * FROM Apolices
WHERE valorApolice >= 30000
ORDER BY valorApolice DESC;

-- Operadores Aritiméticos
SELECT nContrato,valorApolice,valorApolice * 1.1 AS [Reajuste Anual]
FROM Apolices;

-- Operadores Compostos
BEGIN TRAN
	UPDATE Apolices
	SET valorApolice *= 1.1
COMMIT
