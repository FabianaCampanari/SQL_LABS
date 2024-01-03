USE Clientes;

SELECT * FROM Clientes2015;
SELECT * FROM Clientes2016;


-- Clientes Mantidos
SELECT Cliente FROM Clientes2015
INTERSECT
SELECT Cliente FROM Clientes2016;

-- Clientes que recindiram contrato
SELECT Cliente FROM Clientes2015
EXCEPT
SELECT Cliente FROM Clientes2016;

-- Novos Clientes
SELECT Cliente FROM Clientes2016
EXCEPT
SELECT Cliente FROM Clientes2015;
