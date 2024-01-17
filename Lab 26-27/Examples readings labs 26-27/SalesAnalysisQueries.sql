--======================================
/* 01- Colocar em uso o banco de dados PEDIDOS.*/
USE PEDIDOS;

/* 02- Calcular a média de preço de venda (PRECO_VENDA)
   do cadastro de PRODUTOS. */
SELECT AVG(PRECO_VENDA) AS PRECO_MEDIO
FROM TB_PRODUTO;

/* 03- Calcular a quantidade de pedidos cadastrados em janeiro de 2014,
   o maior e o menor valor total (VLR_TOTAL).*/
SELECT COUNT(*) AS QTD_PEDIDOS,
       MAX(VLR_TOTAL) AS MAIOR_PEDIDO,
       MIN(VLR_TOTAL) AS MENOR_PEDIDO
FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31';

/* 04- Calcular o valor total vendido (soma de tb_PEDIDO.VLR_TOTAL)
   em janeiro de 2014. */
SELECT SUM(VLR_TOTAL) AS TOT_VENDIDO
FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31';

/* 05- Calcular o valor total vendido pelo vendedor de
   código 1 em janeiro de 2014. */
SELECT SUM(VLR_TOTAL) AS TOT_VENDIDO
FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31' AND
      CODVEN = 1;

/* 06- Calcular o valor total vendido pela 
   vendedora 'LEIA' em janeiro de 2014. */
SELECT SUM(P.VLR_TOTAL) AS TOT_VENDIDO
FROM TB_PEDIDO P 
     JOIN TB_VENDEDOR V ON P.CODVEN = V.CODVEN
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31' AND
      V.NOME = 'LEIA';
	  
/* 07- Calcular o valor total vendido pelo vendedor 
   'MARCELO' em janeiro de 2014. */
SELECT SUM(P.VLR_TOTAL) AS TOT_VENDIDO
FROM TB_PEDIDO P 
     JOIN TB_VENDEDOR V ON P.CODVEN = V.CODVEN
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31' AND
      V.NOME = 'MARCELO';

/* 08- Calcular o valor da comissão 
   (soma de TB_PEDIDO.VLR_TOTAL * TB_VENDEDOR.PORC_COMISSAO/100)
   que a vendedora 'LEIA' recebeu em janeiro de 2014. */
SELECT SUM(P.VLR_TOTAL * V.PORC_COMISSAO / 100 ) AS TOT_VENDIDO
FROM TB_PEDIDO P 
     JOIN TB_VENDEDOR V ON P.CODVEN = V.CODVEN
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31' AND
      V.NOME = 'LEIA';

/* 09- Calcular o valor da comissão que o 
   vendedor 'MARCELO' recebeu em janeiro de 2014. */
SELECT SUM(P.VLR_TOTAL * V.PORC_COMISSAO / 100 ) AS TOT_VENDIDO
FROM TB_PEDIDO P 
     JOIN TB_VENDEDOR V ON P.CODVEN = V.CODVEN
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31' AND
      V.NOME = 'MARCELO';

/* 10- Listar os totais vendidos por cada vendedor 
   (mostrar TB_VENDEDOR.NOME e a soma de TB_PEDIDO.VLR_TOTAL) 
   em janeiro de 2014. Deve exibir o nome do vendedor. */
SELECT V.CODVEN, V.NOME, SUM(P.VLR_TOTAL) AS TOT_VENDIDO
FROM TB_PEDIDO P 
     JOIN TB_VENDEDOR V ON P.CODVEN = V.CODVEN
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY V.CODVEN, V.NOME;
  
/* 11- Listar o total comprado por cada cliente   
   em janeiro de 2014. Deve mostrar o nome do cliente. */
SELECT C.CODCLI, C.NOME, SUM(P.VLR_TOTAL) AS TOT_COMPRADO
FROM TB_PEDIDO P
     JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY C.CODCLI, C.NOME;

/* 12- Listar o valor e a quantidade total vendida 
   de cada produto em janeiro de 2014. */
SELECT 
   PR.ID_PRODUTO, PR.DESCRICAO,
   SUM( I.QUANTIDADE ) AS QTD_TOTAL,
   SUM( I.PR_UNITARIO * I.QUANTIDADE ) AS VLR_TOTAL
FROM TB_ITENSPEDIDO I
   JOIN TB_PRODUTO PR ON I.ID_PRODUTO = PR.ID_PRODUTO
   JOIN TB_PEDIDO PE ON I.NUM_PEDIDO = PE.NUM_PEDIDO
WHERE PE.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY PR.ID_PRODUTO, PR.DESCRICAO;

/* 13- Listar os totais vendidos por cada vendedor em janeiro de 2014 
   Deve exibir o nome do vendedor e mostrar apenas os vendedores que 
   venderam mais de R$ 80.000,00. */
-- CÓPIA DO EXERC 9 COM HAVING
SELECT V.CODVEN, V.NOME, SUM(P.VLR_TOTAL) AS TOT_VENDIDO
FROM TB_PEDIDO P 
     JOIN TB_VENDEDOR V ON P.CODVEN = V.CODVEN
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY V.CODVEN, V.NOME
    HAVING SUM(P.VLR_TOTAL) > 80000
ORDER BY 3;

/* 14- Listar o total comprado por cada cliente em janeiro de 2014. 
   Deve mostrar o nome do cliente e somente os clientes que 
   compraram mais de R$ 6.000,00. */
-- CÓPIA DO EXERC 10 COM HAVING
SELECT C.CODCLI, C.NOME, SUM(P.VLR_TOTAL) AS TOT_COMPRADO
FROM TB_PEDIDO P
     JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY C.CODCLI, C.NOME
    HAVING SUM(P.VLR_TOTAL) > 6000
ORDER BY 3;

/* 15- Listar o total vendido de cada produto em janeiro de 2014  
   Deve mostrar apenas os produtos que venderam mais de 
   R$ 16.000,00. */
-- CÓPIA DO EXERC 11 COM HAVING
SELECT 
   PR.ID_PRODUTO, PR.DESCRICAO,
   SUM( I.PR_UNITARIO * I.QUANTIDADE ) AS VLR_TOTAL
FROM TB_ITENSPEDIDO I
   JOIN TB_PRODUTO PR ON I.ID_PRODUTO = PR.ID_PRODUTO
   JOIN TB_PEDIDO PE ON I.NUM_PEDIDO = PE.NUM_PEDIDO
WHERE PE.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY PR.ID_PRODUTO, PR.DESCRICAO
    HAVING SUM( I.PR_UNITARIO * I.QUANTIDADE ) > 16000
ORDER BY 3;

/* 16- Listar o total comprado por cada cliente em janeiro de 2014.
   Deve mostrar o nome do cliente e somente os 10 primeiros do ranking. */
-- CÓPIA DO EXERC 10 COM TOP n + ORDER BY
SELECT TOP 10 
  C.CODCLI, C.NOME, SUM(P.VLR_TOTAL) AS TOT_COMPRADO
FROM TB_PEDIDO P
     JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY C.CODCLI, C.NOME
ORDER BY 3 DESC;

/* 17- Listar o total vendido de cada produto em janeiro de 2014.
   Deve mostrar os 10 produtos que mais venderam. */
-- CÓPIA DO EXERC 11 COM TOP n + ORDER BY
SELECT TOP 10 
   PR.ID_PRODUTO, PR.DESCRICAO,
   SUM( I.QUANTIDADE ) AS QTD_TOTAL,
   SUM( I.PR_UNITARIO * I.QUANTIDADE ) AS VLR_TOTAL
FROM TB_ITENSPEDIDO I
   JOIN TB_PRODUTO PR ON I.ID_PRODUTO = PR.ID_PRODUTO
   JOIN TB_PEDIDO PE ON I.NUM_PEDIDO = PE.NUM_PEDIDO
WHERE PE.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY PR.ID_PRODUTO, PR.DESCRICAO
ORDER BY 4 DESC;

-----------------------------------------------------
/*
   18- Listar o total vendido em cada um dos meses de 2013.*/ 
SELECT MONTH( DATA_EMISSAO ) AS MES,
       YEAR( DATA_EMISSAO ) AS ANO,
       SUM( VLR_TOTAL ) AS TOT_VENDIDO
FROM TB_PEDIDO
WHERE YEAR(DATA_EMISSAO) = 2013
GROUP BY MONTH( DATA_EMISSAO ), YEAR( DATA_EMISSAO )
ORDER BY MES;