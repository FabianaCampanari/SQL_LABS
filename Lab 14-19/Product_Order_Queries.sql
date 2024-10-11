
/* 1. Usar o banco de dados PEDIDOS. */
USE PEDIDOS;


/* 2.Listar TB_PRODUTO, criando campo calculado
   (QTD_REAL - QTD_MINIMA), e filtrar os 
   registros resultantes, mostrando somente aqueles que 
   tiverem a quantidade real abaixo da quantidade m�nima. */


SELECT 
 COD_PRODUTO, DESCRICAO, QTD_REAL, QTD_MINIMA,
 QTD_REAL - QTD_MINIMA AS DIFERENCA
FROM TB_PRODUTO
WHERE QTD_REAL < QTD_MINIMA;


/* 3.Listar produtos com quantidade real acima 
   de 5000. */
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL > 5000
ORDER BY QTD_REAL;


/* 4. Listar produtos com pre�o de venda abaixo de R$0,50.*/
SELECT * FROM TB_PRODUTO
WHERE PRECO_VENDA < 0.5
ORDER BY PRECO_VENDA;


/* 5.Listar pedidos com valor total (VLR_TOTAL) 
   acima de R$15.000,00. */
SELECT * FROM TB_PEDIDO
WHERE VLR_TOTAL > 15000
ORDER BY VLR_TOTAL;


/* 6.Listar produtos com QTD_REAL entre 500 e 1000 unidades.*/
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL >= 500 AND QTD_REAL <= 1000
ORDER BY QTD_REAL;

-- OU
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL BETWEEN 500 AND 1000
ORDER BY QTD_REAL;


/* 7.Listar pedidos com valor total entre 
   R$15.000,00 e R$25.000,00. */
SELECT * FROM TB_PEDIDO
WHERE VLR_TOTAL BETWEEN 15000 AND 25000
ORDER BY VLR_TOTAL;


/* 8.Listar produtos com QTD_REAL > 5000 e COD_TIPO = 6. */
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL > 5000 AND COD_TIPO = 6;


/* 9.Listar produtos com QTD_REAL > 5000 ou COD_TIPO = 6. */
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL > 5000 OR COD_TIPO = 6;


/* 10.Listar pedidos com valor total abaixo de 
   R$100,00 ou acima de R$100.000,00. */
SELECT * FROM TB_PEDIDO
WHERE VLR_TOTAL < 100 OR VLR_TOTAL > 100000
ORDER BY VLR_TOTAL;


/* 11.Listar produtos com QTD_REAL menor que 500 ou
   maior que 1000. */
SELECT * FROM TB_PRODUTO
WHERE QTD_REAL < 500 OR QTD_REAL > 1000
ORDER BY QTD_REAL;

