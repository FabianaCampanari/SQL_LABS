IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Produto')
BEGIN
    PRINT 'Creating Product table';
    CREATE TABLE Produto (
        Id INT PRIMARY KEY,
        Nome VARCHAR(255)
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'VendaDetalhe')
BEGIN
    PRINT 'Creating VendaDetalhe table';
    CREATE TABLE VendaDetalhe (
        Id INT PRIMARY KEY,
        Vendasid INT,
        Quantidade INT,
        Valor DECIMAL(10,2),
        Produtold INT,
        FOREIGN KEY (Produtold) REFERENCES Produto(Id)
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Validade')
BEGIN
    PRINT 'Creating Validade table';
    CREATE TABLE Validade (
        Validadeld INT PRIMARY KEY,
        EstoqueProduto INT,
        Dias INT
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'EstoqueProduto')
BEGIN
    PRINT 'Creating EstoqueProduto table';
    CREATE TABLE EstoqueProduto (
        Id INT PRIMARY KEY,
        Produtold INT,
        FOREIGN KEY (Produtold) REFERENCES Produto(Id)
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'EstoqueProduto')
BEGIN
    PRINT 'Creating EstoqueProduto table';
    CREATE TABLE EstoqueProduto (
        Id INT PRIMARY KEY,
        Produtold INT,
        FOREIGN KEY (Produtold) REFERENCES Produto(Id)
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'MovimentoEstoque')
BEGIN
    PRINT 'Creating MovimentoEstoque table';
    CREATE TABLE MovimentoEstoque (
        Id INT PRIMARY KEY,
        EstoqueProdutold INT,
        Quantidade INT,
        Data DATE,
        TipoMovimentold INT,
        VendaDetalheld INT,
        FOREIGN KEY (EstoqueProdutold) REFERENCES EstoqueProduto(Id),
        FOREIGN KEY (VendaDetalheld) REFERENCES VendaDetalhe(Id)
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'TipoMovimento')
BEGIN
    PRINT 'Creating TipoMovimento table';
    CREATE TABLE TipoMovimento (
        Id INT PRIMARY KEY,
        Descricao VARCHAR(255),
        CHECK (Descricao IN ('Entrada', 'Saida'))
    );
END

SELECT *
FROM Produto p
INNER JOIN TipoMovimento tm ON p.Nome = tm.Descricao AND tm.Descricao IS NOT NULL;