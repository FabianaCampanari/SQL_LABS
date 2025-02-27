/* 1. Usar o banco de dados PEDIDOS. */
USE PEDIDOS;

/* 2. Listar todos os pedidos com data de
      emiss�o anterior a Jan/2014. */
-- SOLU��O 1
SELECT * FROM TB_PEDIDO
WHERE DATA_EMISSAO < '2014.1.1';
-- SOLU��O 2
SELECT * FROM TB_PEDIDO
WHERE YEAR( DATA_EMISSAO ) < 2014;

/* 3. Listar todos os pedidos com data de
      emiss�o no primeiro semestre de 2014. */
SELECT * FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.6.30'
ORDER BY DATA_EMISSAO;
------- JANEIRO
SELECT * FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31';
------- JUNHO
SELECT * FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2014.6.1' AND '2014.6.30';

/* 4. Listar todos os pedidos com data de
      emiss�o em janeiro e junho de 2014. */
SELECT * FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
      OR
      DATA_EMISSAO BETWEEN '2014.6.1' AND '2014.6.30';     

/* 5. Listar todos os pedidos do Vendedor
      C�digo 1 em Jan/2014. */
SELECT * FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
      AND CODVEN = 1;      

/* 6. Listar os pedidos emitidos em Jan/2014
      em uma sexta-feira. */
SELECT * FROM TB_PEDIDO
WHERE DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
      AND DATEPART( WEEKDAY,DATA_EMISSAO) = 6;     
