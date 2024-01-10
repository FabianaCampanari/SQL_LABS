USE Concessionaria;

CREATE TABLE tblEstoque
(
	idEstoque			int			identity
	Constraint PK_tblEstoque_idEstoque
	Primary Key (idEstoque),

	idModelo			int			not null
	Constraint FK_tblEstoque_tblModelos
	Foreign Key (idModelo)
	References tblModelos(idModelo),

	dataEntrada			date		Default GETDATE(),

	precoEstoque		money		not null
	Constraint CK_tblEstoque_precoEstoque
	CHECK (precoEstoque >= 10000 AND precoEstoque <= 200000)

);

-- Nova Coluna
ALTER TABLE tblEstoque
ADD placa nChar(8) not null;


-- Alterar o tamanho de uma coluna
ALTER TABLE tblEstoque
ALTER COLUMN placa nChar(7) Null;

EXEC sp_help tblEstoque;

-- Excluir Coluna
ALTER TABLE tblEstoque
DROP COLUMN placa;


