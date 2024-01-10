-- 1. Colocar em uso o banco de dados PEDIDOS
-- Resp.:
USE PEDIDOS;

/* 2. Alterar a tabela TB_CARGO, mudando o salário inicial do cargo
      OFFICE BOY para 600,00 */
-- Resp.:      
BEGIN TRAN
--
UPDATE TB_CARGO SET SALARIO_INIC = 600
WHERE CARGO = 'OFFICE BOY';
--
COMMIT
/* 3. Alterar a tabela de cargos, estipulando 10% de aumento para o campo SALARIO_INIC
      de todos os cargos */
-- Resp.:
UPDATE TB_CARGO SET SALARIO_INIC *= 1.1;

/* 4. Transferir para o campo SALARIO da tabela TB_EMPREGADO o salário inicial
      cadastrado no cargo correspondente da TB_CARGO */
-- Resp.:
-- Solução 1
UPDATE TB_EMPREGADO 
SET SALARIO = (SELECT SALARIO_INIC FROM TB_CARGO
               WHERE COD_CARGO = TB_EMPREGADO.COD_CARGO);
-- Solução 2
UPDATE TB_EMPREGADO
SET SALARIO = C.SALARIO_INIC
FROM TB_EMPREGADO E 
     JOIN TB_CARGO C ON E.COD_CARGO = C.COD_CARGO;
                    
/* 5. Reajustar os preços de venda de todos os produtos de modo que
      fiquem 30% acima do preço de custo  (PRECO_VENDA = PRECO_CUSTO * 1.3) */
-- Resp.:     
BEGIN TRAN

UPDATE TB_PRODUTO SET PRECO_VENDA = PRECO_CUSTO * 1.3;
-- Testando
SELECT 
  ID_PRODUTO, PRECO_CUSTO, PRECO_VENDA,
  100 * (PRECO_VENDA - PRECO_CUSTO) / PRECO_CUSTO
FROM TB_PRODUTO
WHERE PRECO_CUSTO > 0;

COMMIT

/* 6. Reajustar os preços de venda de todos os produtos de modo que
       fiquem 20% acima do preço de custo, mas somente dos produtos com
       COD_TIPO = 5 */
-- Resp.:       
BEGIN TRAN

UPDATE TB_PRODUTO SET PRECO_VENDA = PRECO_CUSTO * 1.2
WHERE COD_TIPO = 5;

-- Testando
SELECT 
  ID_PRODUTO, PRECO_CUSTO, PRECO_VENDA,
  100 * (PRECO_VENDA - PRECO_CUSTO) / PRECO_CUSTO
FROM TB_PRODUTO
WHERE PRECO_CUSTO > 0 AND COD_TIPO = 5;

COMMIT
  
/* 7. Reajustar os preços de venda de todos os produtos de modo que
   fiquem 40% acima do preço de custo, mas somente dos produtos com
   descrição do tipo igual a REGUA  
   Tabela TB_PRODUTO -> PRECO_VENDA = PRECO_CUSTO * 1.4
   para TB_PRODUTO com TB_TIPOPRODUTO.TIPO = 'REGUA'
   É preciso fazer um JOIN de TB_PRODUTO com TB_TIPOPRODUTO */
-- Resp.:   
BEGIN TRAN

UPDATE TB_PRODUTO SET PRECO_VENDA = PRECO_CUSTO * 1.4
FROM TB_PRODUTO P 
     JOIN TB_TIPOPRODUTO T ON P.COD_TIPO = T.COD_TIPO
WHERE T.TIPO = 'REGUA';

COMMIT

/* 8.  Alterar a tabela TB_ITENSPEDIDO, mudando todos os itens com produto
       de cor 'VERMELHO' para cor 'LARANJA', mas somente os pedidos com data de 
       entrega em Outubro de 2014 */ 
-- Resp.:      
-- SOLUÇÃO 1    
	BEGIN TRAN

    UPDATE TB_ITENSPEDIDO 
    SET CODCOR = (SELECT CODCOR FROM TB_COR 
                  WHERE COR = 'LARANJA')
    WHERE CODCOR = (SELECT CODCOR FROM TB_COR 
                  WHERE COR = 'VERMELHO') AND
          DATA_ENTREGA BETWEEN '2014.10.1' AND '2014.10.31';      
     
    ROLLBACK
-- SOLUÇÃO 2
	BEGIN TRAN

    UPDATE TB_ITENSPEDIDO 
    SET CODCOR = L.CODCOR
    FROM TB_ITENSPEDIDO I JOIN TB_COR V ON I.CODCOR = V.CODCOR
                       JOIN TB_COR L ON L.COR = 'LARANJA'
    WHERE V.COR = 'VERMELHO' AND
          I.DATA_ENTREGA BETWEEN '2014.10.1' AND '2014.10.31';   
     
    ROLLBACK
       
    
/* 9. Alterar o campo ICMS para 12 da tabela TB_CLIENTE para clientes dos
      estados RJ, RO, AC, RR, MG, PR, SC, RS, MS e MT */
-- Resp.:      
UPDATE TB_CLIENTE SET ICMS = 12
WHERE ESTADO IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 
                 'RS', 'MS', 'MT');

/* 10. Alterar o campo ICMS para 18 para clientes de SP */
-- Resp.:      
UPDATE TB_CLIENTE SET ICMS = 18
WHERE ESTADO = 'SP';

/* 11. Alterar o campo ICMS para 7 da tabela TB_CLIENTE para clientes que
--     NÃO SEJAM dos estados RJ, RO, AC, RR, MG, PR, SC, RS, MS, MT e SP */
-- Resp.:
UPDATE TB_CLIENTE SET ICMS = 7
WHERE ESTADO NOT IN ('RJ', 'RO', 'AC', 'RR', 'MG', 'PR', 'SC', 
                     'RS', 'MS', 'MT', 'SP');
 
/* 12. Criar a tabela ESTADOS com os campos
     COD_ESTADO 	inteiro, autonumeração e chave primária
     SIGLA 		Char(2)
     ICMS 		numérico, tamanho 4 com 2 decimais
*/
-- Resp.:
CREATE TABLE ESTADOS
(	COD_ESTADO		INT		IDENTITY	PRIMARY KEY,
    	SIGLA			CHAR(2) UNIQUE,
	ICMS			NUMERIC(4,2) );

/* 13. Copiar para a tabela ESTADOS o resultado do SELECT abaixo
SELECT DISTINCT ESTADO, ICMS FROM TB_CLIENTE
WHERE ESTADO IS NOT NULL
*/
-- Obs.: Este SELECT deve retornar 21 linhas e sem repetir estado
-- Se der diferente é porque seus UPDATES de ICMS estão errados
-- Resp.:
INSERT INTO ESTADOS ( SIGLA, ICMS )
SELECT DISTINCT ESTADO, ICMS FROM TB_CLIENTE
WHERE ESTADO IS NOT NULL;

-- 14. Criar o campo COD_ESTADO na tabela TB_CLIENTE
ALTER TABLE TB_CLIENTE ADD COD_ESTADO INT;

/* 15. Copiar para TB_CLIENTE.COD_ESTADO o código do estado gerado na tabela ESTADOS */
-- Resp.:
---- COM SUB-QUERY
BEGIN TRAN

UPDATE TB_CLIENTE
SET COD_ESTADO = (SELECT COD_ESTADO FROM ESTADOS
                  WHERE SIGLA = TB_CLIENTE.ESTADO);

ROLLBACK
---- COM JOIN
BEGIN TRAN

UPDATE TB_CLIENTE
SET COD_ESTADO = E.COD_ESTADO
FROM TB_CLIENTE C JOIN ESTADOS E ON C.ESTADO = E.SIGLA;

COMMIT
-- Testando
SELECT C.NOME, C.ESTADO AS ESTADO_CLI, 
       E.SIGLA AS ESTADO_EST
FROM TB_CLIENTE C JOIN ESTADOS E
     ON C.COD_ESTADO = E.COD_ESTADO;