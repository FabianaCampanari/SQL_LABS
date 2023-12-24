-- 1. Colocar o banco de dados PEDIDOS em uso
USE PEDIDOS;
-- 2. Aumentar o preço de custo de todos os produtos do tipo 2 em 15%
--    Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
-- Abrir transação
BEGIN TRAN
-- Executar o UPDATE
UPDATE TB_PRODUTO SET PRECO_CUSTO = PRECO_CUSTO * 1.15
OUTPUT INSERTED.COD_PRODUTO, INSERTED.DESCRICAO, INSERTED.COD_TIPO,
       DELETED.PRECO_CUSTO AS PRECO_ANTIGO, INSERTED.PRECO_CUSTO AS PRECO_NOVO,
	   INSERTED.PRECO_CUSTO / DELETED.PRECO_CUSTO AS FATOR 
WHERE COD_TIPO = 2;
-- Verificar se deu certo analisando o resultado do comando

-- Obs.: Como o campo PRECO_CUSTO tem 4 casas depois da vírgula,
--       a coluna calculada FATOR não será exatamente 1.15, mas próximo disso
-- Ok. Alteração correta
COMMIT

-- 3. Fazer com que os preços de venda dos produtos do 
-- tipo 2 fiquem 30% acima do preço de custo
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_PRODUTO SET PRECO_VENDA = PRECO_CUSTO * 1.3
OUTPUT INSERTED.COD_PRODUTO, INSERTED.DESCRICAO, INSERTED.COD_TIPO,
       INSERTED.PRECO_VENDA / INSERTED.PRECO_CUSTO AS FATOR 
WHERE COD_TIPO = 2;

COMMIT
-- 4. Alterar o campo IPI de todos os produtos com 
--    COD_TIPO = 3 para 5%
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_PRODUTO SET IPI = 5 
OUTPUT INSERTED.COD_PRODUTO, inserted.COD_TIPO,
       DELETED.IPI AS IPI_ANTIGO, INSERTED.IPI AS IPI_NOVO
WHERE COD_TIPO = 3;

COMMIT
-- 5. Reduzir em 10% (multiplicar QTD_MINIMA por 0.9) o campo 
-- QTD_MINIMA de todos os produtos 
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_PRODUTO SET QTD_MINIMA *= 0.9
OUTPUT INSERTED.COD_PRODUTO, DELETED.QTD_MINIMA AS QTD_ANTIGA,
       INSERTED.QTD_MINIMA AS QTD_NOVA;

COMMIT
-- 6. Alterar os seguintes campos do cliente de código 11
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
/*
	ENDEREÇO: AV. CELSO GARCIA, 1234
	BAIRRO:   TATUAPE
	CIDADE:   SAO PAULO
	ESTADO:   SP 
	CEP   :   03407080 
*/
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE
SET	ENDERECO = 'AV. CELSO GARCIA, 1234',
	BAIRRO =   'TATUAPE',
	CIDADE =   'SAO PAULO',
	ESTADO =   'SP' ,
	CEP    =   '03407080'
OUTPUT INSERTED.*
WHERE CODCLI = 11;

COMMIT 
-- 7. Copiar ENDERECO, BAIRRO, CIDADE, ESTADO e CEP do 
-- cliente código 13 para os campos 
--  END_COB, BAI_COB, CID_COB, EST_COB e CEP_COB (do mesmo cliente)
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE
SET	END_COB = ENDERECO,
	BAI_COB = BAIRRO  ,
	CID_COB = CIDADE  ,
	EST_COB = ESTADO  ,
	CEP_COB = CEP
OUTPUT INSERTED.*	     
WHERE CODCLI = 13;

COMMIT
-- 8. Alterar o campo ICMS para 12 da tabela TB_CLIENTE para os clientes dos
--    estados RJ, RO, AC, RR, MG, PR, SC, RS, MS, MT
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE SET ICMS = 12
OUTPUT INSERTED.*
WHERE ESTADO IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 'RS', 'MS', 'MT');

COMMIT
-- 9. Alterar o campos ICMS para 18 de todos os clientes de SP
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE SET ICMS = 18
OUTPUT INSERTED.*
WHERE ESTADO = 'SP';	

COMMIT
-- 10. Alterar o campo ICMS para 7 da tabela TB_CLIENTE para clientes que
--    NÃO SEJAM dos estados RJ, RO, AC, RR, MG, PR, SC, RS, MS, MT, SP
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_CLIENTE SET ICMS = 7
OUTPUT INSERTED.*
WHERE ESTADO NOT IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 
                     'RS', 'MS', 'MT', 'SP');

SELECT * FROM TB_CLIENTE
WHERE ESTADO NOT IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 
                     'RS', 'MS', 'MT', 'SP');

COMMIT
-- 11. Alterar para 7 o campo DESCONTO da tabela TB_ITENSPEDIDO, 
-- mas somente dos itens do produto com ID_PRODUTO = 8 com 
-- data de entrega em janeiro de 2014 e com 
-- QUANTIDADE acima de 1000.
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_ITENSPEDIDO SET DESCONTO = 7
OUTPUT INSERTED.*
WHERE ID_PRODUTO = 8 AND 
      DATA_ENTREGA BETWEEN '2014.1.1' AND '2014.1.31' AND
      QUANTIDADE > 1000;

COMMIT
-- 12. Zerar o campo DESCONTO de todos os itens de pedido 
-- com quantidade abaixo de 1000, com data de entrega 
-- posterior a 1-Junho-2014 e que tenham desconto acima de zero.
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

UPDATE TB_ITENSPEDIDO SET DESCONTO = 0
OUTPUT INSERTED.*
WHERE DATA_ENTREGA > '2014.6.1' AND QUANTIDADE < 1000 AND
      DESCONTO > 0;

COMMIT
-- 13. Usando SELECT INTO gere uma cópia da tabela VENDEDORES
SELECT * INTO VENDEDORES_TMP FROM TB_VENDEDOR;

-- 14. Exclua de VENDEDORES_TMP os registros com CODVEN acima de 5
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN 

DELETE FROM VENDEDORES_TMP 
OUTPUT DELETED.*
WHERE CODVEN > 5;

COMMIT
-- 15. Utilizando o comando SELECT...INTO, faça uma cópia da tabela TB_PEDIDO
--     chamada COPIA_PEDIDOS
-- Resposta:
SELECT * INTO COPIA_PEDIDOS FROM TB_PEDIDO;

-- 16. Exclua os registros da tabela COPIA_PEDIDOS que sejam  do vendedor código 2
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

DELETE FROM COPIA_PEDIDOS 
OUTPUT DELETED.*
WHERE CODVEN = 2;

COMMIT
-- 17. Exclua os registros da tabela COPIA_PEDIDOS que sejam 
-- do primeiro semestre de 2014
-- Utilize transação e a cláusula OUTPUT para conferir o resultado
-- Resposta:
BEGIN TRAN

DELETE FROM COPIA_PEDIDOS 
OUTPUT DELETED.*
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.6.30';

COMMIT
-- 18. Exclua todos os registros restantes da tabela COPIA_PEDIDOS
-- Resposta:
DELETE FROM COPIA_PEDIDOS;

-- 19. Exclua a tabela COPIA_PEDIDOS do banco de dados
-- Resposta:
DROP TABLE COPIA_PEDIDOS;