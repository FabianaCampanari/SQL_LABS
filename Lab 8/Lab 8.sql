USE Concessionaria;

-- visualizar índices
EXEC sp_help tblEstoque;

-- Criando Índice
CREATE NONCLUSTERED INDEX IX_tblEstoque
ON tblEstoque(dataEntrada DESC);

EXEC sp_helpindex tblEstoque;

-- Excluir um Índice
DROP INDEX IX_tblEstoque
ON tblEstoque;