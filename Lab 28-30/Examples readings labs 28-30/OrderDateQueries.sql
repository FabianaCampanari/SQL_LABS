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