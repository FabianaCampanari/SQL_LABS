
-- 01
USE PEDIDOS;
/* 02- Listar os campos NUM_PEDIDO, DATA_EMISSAO, 
   VLR_TOTAL de TB_PEDIDO seguido do NOME do vendedor. */
SELECT P.NUM_PEDIDO, P.DATA_EMISSAO, P.VLR_TOTAL,
       V.NOME AS VENDEDOR
FROM TB_PEDIDO P 
     JOIN TB_VENDEDOR V ON P.CODVEN = V.CODVEN;

/* 03- Listar os campos NUM_PEDIDO, DATA_EMISSAO, 
   VLR_TOTAL de TB_PEDIDO seguido do NOME do cliente. */
SELECT P.NUM_PEDIDO, P.DATA_EMISSAO, P.VLR_TOTAL,
       C.NOME AS CLIENTE
FROM TB_PEDIDO P
     JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI;

/* 04- Listar os pedidos com o nome do vendedor e o nome do cliente */
SELECT P.NUM_PEDIDO, P.DATA_EMISSAO, P.VLR_TOTAL,
       V.NOME AS VENDEDOR, C.NOME AS CLIENTE
FROM TB_PEDIDO P
     JOIN TB_VENDEDOR V ON P.CODVEN = V.CODVEN
     JOIN TB_CLIENTE C   ON P.CODCLI = C.CODCLI;

/* 05- Listar os itens de pedido (TB_ITENSPEDIDO) com o 
   nome do produto (TB_PRODUTO.DESCRICAO)*/
SELECT I.*, PR.DESCRICAO
FROM TB_ITENSPEDIDO I 
     JOIN TB_PRODUTO PR ON I.ID_PRODUTO = PR.ID_PRODUTO;

/* 06- Listar os produtos (tabela TB_PRODUTO, campos 
   COD_PRODUTO, DESCRICAO) com a 
   descrição do tipo de produto (TB_TIPOPRODUTO.TIPO)*/
SELECT 
   PR.COD_PRODUTO, PR.DESCRICAO, T.TIPO
FROM TB_PRODUTO PR
   JOIN TB_TIPOPRODUTO T ON PR.COD_TIPO = T.COD_TIPO;

/* 07- Listar os produtos com a descrição do 
    tipo (TB_TIPOPRODUTO.TIPO) e da unidade (TB_UNIDADE.UNIDADE). */
SELECT 
   PR.COD_PRODUTO, PR.DESCRICAO, T.TIPO, U.UNIDADE
FROM TB_PRODUTO PR
   JOIN TB_TIPOPRODUTO T ON PR.COD_TIPO = T.COD_TIPO
   JOIN TB_UNIDADE U ON PR.COD_UNIDADE = U.COD_UNIDADE;

/* 08- Listar os itens de pedido (tabela TB_ITENSPEDIDO, campos NUM_PEDIDO, NUM_ITEM,
   COD_PRODUTO, QUANTIDADE, PR_UNITARIO) com o nome do 
   produto (TB_PRODUTO.DESCRICAO), descrição do 
    tipo (TB_TIPOPRODUTO.TIPO) e da unidade (TB_UNIDADE.UNIDADE). */
SELECT 
   I.*, PR.COD_PRODUTO, PR.DESCRICAO, T.TIPO, U.UNIDADE
FROM TB_ITENSPEDIDO I
   JOIN TB_PRODUTO PR ON I.ID_PRODUTO = PR.ID_PRODUTO
   JOIN TB_TIPOPRODUTO T ON PR.COD_TIPO = T.COD_TIPO
   JOIN TB_UNIDADE U ON PR.COD_UNIDADE = U.COD_UNIDADE;

/* 09- Listar os itens de pedido (tabela TB_ITENSPEDIDO, campos NUM_PEDIDO, NUM_ITEM,
   COD_PRODUTO, QUANTIDADE, PR_UNITARIO) com o nome do 
   produto (TB_PRODUTO.DESCRICAO), descrição do 
   tipo (TB_TIPOPRODUTO.TIPO), nome da unidade (TB_UNIDADE.UNIDADE) e
   nome da cor (TB_COR.COR). */
SELECT 
   I.*, PR.COD_PRODUTO, PR.DESCRICAO, T.TIPO, U.UNIDADE,
   CR.COR
FROM TB_ITENSPEDIDO I
   JOIN TB_PRODUTO PR ON I.ID_PRODUTO = PR.ID_PRODUTO
   JOIN TB_TIPOPRODUTO T ON PR.COD_TIPO = T.COD_TIPO
   JOIN TB_UNIDADE U ON PR.COD_UNIDADE = U.COD_UNIDADE
   JOIN TB_COR CR ON I.CODCOR = CR.CODCOR;

/* 10- Listar todos os pedidos (TB_PEDIDO) do vendedor 'MARCELO' 
em Jan/2014.*/
SELECT P.*, V.NOME AS VENDEDOR
FROM TB_PEDIDO P JOIN TB_VENDEDOR V ON P.CODVEN = V.CODVEN
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31' AND
      V.NOME = 'MARCELO';

/* 11– Listar os nomes dos clientes (TB_CLIENTE.NOME) que compraram 
   em janeiro de 2014. */
--- Não é a melhor solução
SELECT C.NOME AS CLIENTE
FROM TB_CLIENTE C JOIN TB_PEDIDO P ON C.CODCLI = P.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
ORDER BY C.NOME;
-- solução 1
SELECT C.NOME AS CLIENTE, P.*
FROM TB_CLIENTE C JOIN TB_PEDIDO P ON C.CODCLI = P.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
ORDER BY C.NOME;
-- solução 2
SELECT DISTINCT C.NOME AS CLIENTE
FROM TB_CLIENTE C JOIN TB_PEDIDO P ON C.CODCLI = P.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
ORDER BY C.NOME;

/* 12- Listar os nomes de produto (TB_PRODUTO.DESCRICAO) que foram 
   vendidos em Janeiro de 2014. */
SELECT DISTINCT PR.DESCRICAO
FROM TB_PRODUTO PR
     JOIN TB_ITENSPEDIDO I ON PR.ID_PRODUTO = I.ID_PRODUTO
     JOIN TB_PEDIDO PE ON I.NUM_PEDIDO = PE.NUM_PEDIDO
WHERE PE.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31';

/* 13- Listar NUM_PEDIDO, VLR_TOTAL (TB_PEDIDO) e 
   NOME do CLIENTE. Deve mostrar apenas pedidos 
   de janeiro de 2014 e de clientes que tenham 
   NOME começando por 'MARCIO' */
SELECT P.NUM_PEDIDO, P.VLR_TOTAL, C.NOME AS CLIENTE
FROM TB_PEDIDO P JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31' AND
      C.NOME LIKE 'MARCIO%';

 /* 14- Listar NUM_PEDIDO, QUANTIDADE vendida,  
   o PR_UNITARIO (de TB_ITENSPEDIDO), DESCRICAO (TB_PRODUTO), 
   e o NOME do vendedor (TB_VENDEDOR) que vendeu cada 
   item de pedido */
SELECT 
   I.NUM_PEDIDO, I.QUANTIDADE, I.PR_UNITARIO,
   PR.DESCRICAO, V.NOME AS VENDEDOR
FROM TB_PEDIDO PE
   JOIN TB_VENDEDOR V ON PE.CODVEN = V.CODVEN
   JOIN TB_ITENSPEDIDO I ON PE.NUM_PEDIDO = I.NUM_PEDIDO
   JOIN TB_PRODUTO PR ON I.ID_PRODUTO = PR.ID_PRODUTO;
  
/* 15- Listar todos os itens de Pedido com 
   Desconto superior a 7%. Deve mostrar 
   NUM_PEDIDO, DESCRICAO do produto, 
   NOME do cliente, nome do VENDEDOR e 
   QUANTIDADE vendida */
SELECT
  I.NUM_PEDIDO, I.QUANTIDADE, I.DESCONTO,
  PR.DESCRICAO, V.NOME AS VENDEDOR, C.NOME AS CLIENTE
FROM 
  TB_ITENSPEDIDO I 
  JOIN TB_PRODUTO PR ON I.ID_PRODUTO = PR.ID_PRODUTO
  JOIN TB_PEDIDO PE ON I.NUM_PEDIDO = PE.NUM_PEDIDO
  JOIN TB_CLIENTE C ON PE.CODCLI = C.CODCLI
  JOIN TB_VENDEDOR V ON PE.CODVEN = V.CODVEN 
WHERE I.DESCONTO > 7;
  
 /* 16- Listar os itens de pedido com o nome do 
    produto, descrição do tipo e descrição da 
    unidade e o nome da cor,     
    mas apenas os itens vendidos em 
    janeiro de 2014 na cor 'LARANJA' */
-- CÓPIA DO 8
SELECT 
   I.*, PR.COD_PRODUTO, PR.DESCRICAO, T.TIPO, U.UNIDADE,
   CR.COR
FROM TB_ITENSPEDIDO I
   JOIN TB_PRODUTO PR ON I.ID_PRODUTO = PR.ID_PRODUTO
   JOIN TB_TIPOPRODUTO T ON PR.COD_TIPO = T.COD_TIPO
   JOIN TB_UNIDADE U ON PR.COD_UNIDADE = U.COD_UNIDADE
   JOIN TB_COR CR ON I.CODCOR = CR.CODCOR
   JOIN TB_PEDIDO PE ON I.NUM_PEDIDO = PE.NUM_PEDIDO
WHERE PE.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31' AND
   CR.COR = 'LARANJA';

/* 17- Listar NOME e FONE1 dos fornecedores 
   de quem compramos o produto 'CANETA STAR I' */
SELECT F.NOME, F.FONE1 
FROM TB_FORNECEDOR F 
     JOIN TB_PROD_FORN PF ON F.COD_FORNECEDOR = PF.COD_FORNECEDOR
     JOIN TB_PRODUTO P ON PF.ID_PRODUTO = P.ID_PRODUTO
WHERE P.DESCRICAO = 'CANETA STAR I';
   
/* 18- Listar a DESCRICAO dos produtos que compramos do fornecedor cujo NOME
     começa com 'LINCE'     */
SELECT P.DESCRICAO
FROM TB_FORNECEDOR F 
     JOIN TB_PROD_FORN PF ON F.COD_FORNECEDOR = PF.COD_FORNECEDOR
     JOIN TB_PRODUTO P ON PF.ID_PRODUTO = P.ID_PRODUTO
WHERE F.NOME LIKE 'LINCE%';

/* 19- Listar NOME e FONE1 dos fornecedores, 
   descrição dos produtos
    com QTD_REAL abaixo de QTD_MINIMA */
SELECT F.NOME, F.FONE1, P.DESCRICAO 
FROM TB_FORNECEDOR F 
     JOIN TB_PROD_FORN PF ON F.COD_FORNECEDOR = PF.COD_FORNECEDOR
     JOIN TB_PRODUTO P ON PF.ID_PRODUTO = P.ID_PRODUTO
WHERE P.QTD_REAL < P.QTD_MINIMA;

/* 20- Listar todos os produtos que compramos do fornecedor
   cujo nome começa com 'FESTO' */
SELECT P.DESCRICAO
FROM TB_FORNECEDOR F 
     JOIN TB_PROD_FORN PF ON F.COD_FORNECEDOR = PF.COD_FORNECEDOR
     JOIN TB_PRODUTO P ON PF.ID_PRODUTO = P.ID_PRODUTO
WHERE F.NOME LIKE 'FESTO%';
