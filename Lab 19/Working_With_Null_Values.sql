USE SysConVendas;
SELECT * FROM Dados;

BEGIN TRAN
	UPDATE Dados
	SET Vendedor = NULL
	WHERE Pedido IN(21820,21872,21924,21963,22080)
COMMIT

-- Fun��o ISNULL
SELECT
	Pedido,ISNULL(Vendedor,'Sem Informa��o') AS Vendedor,Produto,Total
FROM Dados;

SELECT
	Pedido,ISNULL(Vendedor,'') AS Vendedor,Produto,Total
FROM Dados;

-- Filtrar Nulos e N�o Nulos
SELECT
	Pedido,Vendedor,Produto,Total
FROM Dados
WHERE Vendedor IS NULL;

SELECT
	Pedido,Vendedor,Produto,Total
FROM Dados
WHERE Vendedor IS NOT NULL;

-- COALESCE
CREATE TABLE Cotacao
(
	codigo		int		identity,
	produto		varchar(50)		not null,
	cotacao1	money			null,
	cotacao2	money			null,
	cotacao3	money			null
);

INSERT INTO Cotacao
VALUES
('Mouse',NULL,25,NULL),
('Impressora',200,NULL,350),
('Monitor',NULL,NULL,500),
('HD Externo',NULL,NULL,NULL);

SELECT * FROM Cotacao;

SELECT
	Produto,
	COALESCE(cotacao1,cotacao2,cotacao3,0) AS Cota��o
FROM Cotacao;

SELECT * FROM Cotacao
WHERE COALESCE(cotacao1,cotacao2,cotacao3,0) = 0;
