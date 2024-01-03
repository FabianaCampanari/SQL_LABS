USE Clientes;

-- Todas os comandos SELECT deverão ter o mesmo número de colunas
-- Todas as colunas unidas deverão ter o mesmo tipo de dado

SELECT * FROM Clientes2015
UNION
SELECT * FROM Clientes2016;


SELECT * FROM Clientes2015
UNION
SELECT * FROM Clientes2016
ORDER BY Cliente ASC;

SELECT 'Cliente 2015' AS Ano,* FROM Clientes2015
UNION
SELECT 'Cliente 2016',* FROM Clientes2016
ORDER BY Cliente ASC;


-- UNION
SELECT * FROM Clientes2015
UNION
SELECT * FROM Clientes2016
ORDER BY Cliente ASC;


-- UNION ALL
SELECT * FROM Clientes2015
UNION ALL
SELECT * FROM Clientes2016
ORDER BY Cliente ASC;


UPDATE CLientes2015
SET Apolice = 30000
WHERE codigo = 2790

UPDATE CLientes2016
SET Apolice = 30000
WHERE codigo = 2790


SELECT * FROM Clientes2015
WHERE Cidade = 'São Paulo'
UNION
SELECT * FROM Clientes2016
WHERE Cidade = 'Rio de Janeiro'
ORDER BY Cliente ASC;