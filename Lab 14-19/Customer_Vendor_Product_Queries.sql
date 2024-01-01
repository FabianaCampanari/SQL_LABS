/* 1. Usar o banco de dados PEDIDOS. */
USE PEDIDOS;

/* 2. Listar clientes do estado de S�o Paulo (SP). */
-- Campo ESTADO da tabela TB_CLIENTE � CHAR(2) e cont�m a sigla do estado
SELECT * FROM TB_CLIENTE WHERE ESTADO = 'SP';

/* 3. Listar clientes do estado de  Minas Gerais e Rio de Janeiro 
      (MG, RJ). */
SELECT * FROM TB_CLIENTE WHERE ESTADO IN ('MG','RJ');

/* 4. Listar clientes do estado de  S�o Paulo, Minas Gerais e 
      Rio de Janeiro (SP,MG,RJ). */
SELECT * FROM TB_CLIENTE WHERE ESTADO IN ('SP','MG','RJ');

/* 5. Listar os vendedores com o nome LEIA. */
SELECT * FROM TB_VENDEDOR WHERE NOME LIKE 'LEIA%';

/* 6. Listar todos os clientes que tenham NOME 
      come�ando com BRINDES. */
SELECT * FROM TB_CLIENTE WHERE NOME LIKE 'BRINDES%';

/* 7. Listar todos os clientes que tenham NOME
      terminando com BRINDES. */
SELECT * FROM TB_CLIENTE WHERE NOME LIKE '%BRINDES';

/* 8. Listar todos os clientes que tenham NOME
      contendo BRINDES. */
SELECT * FROM TB_CLIENTE WHERE NOME LIKE '%BRINDES%';

/* 9. Listar todos os produtos com DESCRICAO 
      come�ando por �CANETA�.*/
SELECT * FROM TB_PRODUTO WHERE DESCRICAO LIKE 'CANETA%';

/* 10. Listar todos os produtos com 
       DESCRICAO contendo �SPECIAL�. */
SELECT * FROM TB_PRODUTO WHERE DESCRICAO LIKE '%SPECIAL%';

/* 11. Listar todos os produtos com 
       DESCRICAO terminando por �GOLD�.*/
SELECT * FROM TB_PRODUTO WHERE DESCRICAO LIKE '%GOLD';

/* 12. Listar todos os clientes que tenham a 
       letra A como segundo caractere do nome. */
SELECT * FROM TB_CLIENTE WHERE NOME LIKE '_A%';

/* 13. Listar todos os produtos que tenham
       �0� (ZERO) como segundo caractere do
       campo COD_PRODUTO. */
SELECT * FROM TB_PRODUTO WHERE COD_PRODUTO LIKE '_0%';

/* 14. Listar todos os produtos que tenham
       �A� como terceiro caractere do
       campo COD_PRODUTO.*/
SELECT * FROM TB_PRODUTO WHERE COD_PRODUTO LIKE '__A%';



