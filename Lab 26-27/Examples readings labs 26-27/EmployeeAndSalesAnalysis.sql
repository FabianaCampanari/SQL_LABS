-- CAP�TULO 9
USE PEDIDOS;
USE PEDIDOS;
-- neste caso, o grupo corresponde a toda a tabela TB_EMPREGADO
SELECT AVG(SALARIO) AS SALARIO_MEDIO
FROM TB_EMPREGADO;
-- neste caso, o grupo corresponde aos empregados com
-- COD_DEPTO = 2
SELECT AVG(SALARIO) AS SALARIO_MEDIO FROM TB_EMPREGADO
WHERE COD_DEPTO = 2;

-- neste caso, o grupo corresponde a toda a tabela TB_EMPREGADO
SELECT COUNT(*) AS QTD_EMPREGADOS
FROM TB_EMPREGADO;
-- neste caso, o grupo corresponde aos empregados com
-- COD_DEPTO = 2
SELECT COUNT(COD_DEPTO) AS QTD_EMPREGADOS FROM TB_EMPREGADO
WHERE COD_DEPTO = 2;

-- neste caso, o grupo corresponde a toda a tabela TB_EMPREGADO
SELECT MIN(SALARIO) AS MENOR_SALARIO FROM TB_EMPREGADO;
-- neste caso, o grupo corresponde aos empregados com
-- COD_DEPTO = 2
SELECT MIN(SALARIO) AS MENOR_SALARIO FROM TB_EMPREGADO
WHERE COD_DEPTO = 2

-- neste caso, o grupo corresponde a toda a tabela TB_EMPREGADO
SELECT MAX(SALARIO) AS MAIOR_SALARIO
FROM TB_EMPREGADO;
-- neste caso, o grupo corresponde aos empregados com
-- COD_DEPTO = 2
SELECT MAX(SALARIO) AS MAIOR_SALARIO FROM TB_EMPREGADO
WHERE COD_DEPTO = 2

-- neste caso, o grupo corresponde a toda a tabela TB_EMPREGADO
SELECT SUM(SALARIO) AS SOMA_SALARIOS
FROM TB_EMPREGADO;
-- neste caso, o grupo corresponde aos empregados com
-- COD_DEPTO = 2
SELECT SUM(SALARIO) AS SOMA_SALARIOS FROM TB_EMPREGADO
WHERE COD_DEPTO = 2

--	Exemplo 1

-- Total de sal�rio de cada departamento
SELECT COD_DEPTO, SUM( SALARIO ) AS TOT_SAL
FROM TB_EMPREGADO
GROUP BY COD_DEPTO
ORDER BY TOT_SAL;		


--	Exemplo 2

-- GROUP BY + JOIN
SELECT E.COD_DEPTO, D.DEPTO, SUM( E.SALARIO ) AS TOT_SAL
FROM TB_EMPREGADO E
     JOIN TB_DEPARTAMENTO D ON E.COD_DEPTO = D.COD_DEPTO
GROUP BY E.COD_DEPTO, D.DEPTO
ORDER BY TOT_SAL;

--	Exemplo 3

-- Consulta do tipo RANKING utilizando TOP n + ORDER BY
-- Os 5 departamentos que mais gastam com sal�rios
SELECT TOP 5 E.COD_DEPTO, D.DEPTO, SUM( E.SALARIO ) AS TOT_SAL
FROM TB_EMPREGADO E
     JOIN TB_DEPARTAMENTO D ON E.COD_DEPTO = D.COD_DEPTO
GROUP BY E.COD_DEPTO, D.DEPTO
ORDER BY TOT_SAL DESC;

--	Exemplo 4

-- Os 10 clientes que mais compraram em Janeiro de 2014
SELECT TOP 10 C.CODCLI, C.NOME, SUM(P.VLR_TOTAL) AS TOT_COMPRADO
FROM TB_PEDIDO P JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY C.CODCLI, C.NOME
ORDER BY TOT_COMPRADO DESC;

-- Clientes que compraram em janeiro de 2014. Veremos que
-- todas as linhas do resultado ter�o um total n�o nulo.
SELECT C.CODCLI, C.NOME, SUM(P.VLR_TOTAL) AS TOT_COMPRADO
FROM TB_PEDIDO P JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY C.CODCLI, C.NOME;


-- Neste caso, aparecer�o tamb�m os clientes que n�o 
-- compraram. Totais estar�o nulos.
SELECT C.CODCLI, C.NOME, SUM(P.VLR_TOTAL) AS TOT_COMPRADO
FROM TB_PEDIDO P JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY ALL C.CODCLI, C.NOME;

SELECT E.COD_DEPTO, D.DEPTO, SUM( E.SALARIO ) AS TOT_SAL
FROM TB_EMPREGADO E
     JOIN TB_DEPARTAMENTO D ON E.COD_DEPTO = D.COD_DEPTO
GROUP BY E.COD_DEPTO, D.DEPTO HAVING SUM(E.SALARIO) > 100000
ORDER BY TOT_SAL;

SELECT C.CODCLI, C.NOME, SUM(P.VLR_TOTAL) AS TOT_COMPRADO
FROM TB_PEDIDO P JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY C.CODCLI, C.NOME HAVING SUM(P.VLR_TOTAL) > 5.000
ORDER BY TOT_COMPRADO;

SELECT C.CODCLI, C.NOME, SUM(P.VLR_TOTAL) AS TOT_COMPRADO
FROM TB_PEDIDO P JOIN TB_CLIENTE C ON P.CODCLI = C.CODCLI
WHERE P.DATA_EMISSAO BETWEEN '2014.1.1' AND '2014.1.31'
GROUP BY ALL C.CODCLI, C.NOME HAVING SUM(P.VLR_TOTAL) IS NULL;

SELECT
  V.NOME AS VENDEDOR, C.NOME AS CLIENTE,
  T.TIPO AS TIPO_PRODUTO, SUM( I.QUANTIDADE ) AS QTD_TOT
FROM 
  TB_PEDIDO Pe 
  JOIN TB_CLIENTE C ON Pe.CODCLI = C.CODCLI
  JOIN TB_VENDEDOR V ON Pe.CODVEN = V.CODVEN
  JOIN TB_ITENSPEDIDO I ON Pe.NUM_PEDIDO = I.NUM_PEDIDO
  JOIN TB_PRODUTO Pr ON I.ID_PRODUTO = Pr.ID_PRODUTO
  JOIN TB_TIPOPRODUTO T ON Pr.COD_TIPO = T.COD_TIPO
WHERE Pe.DATA_EMISSAO BETWEEN '2013.1.1' AND '2013.6.30'
GROUP BY V.NOME , C.NOME, T.TIPO;

SELECT
  V.NOME AS VENDEDOR, C.NOME AS CLIENTE,
  T.TIPO AS TIPO_PRODUTO, SUM( I.QUANTIDADE ) AS QTD_TOT
FROM   TB_PEDIDO Pe 
  JOIN TB_CLIENTE C ON Pe.CODCLI = C.CODCLI
  JOIN TB_VENDEDOR V ON Pe.CODVEN = V.CODVEN
  JOIN TB_ITENSPEDIDO I ON Pe.NUM_PEDIDO = I.NUM_PEDIDO
  JOIN TB_PRODUTO Pr ON I.ID_PRODUTO = Pr.ID_PRODUTO
  JOIN TB_TIPOPRODUTO T ON Pr.COD_TIPO = T.COD_TIPO
WHERE Pe.DATA_EMISSAO BETWEEN '2013.1.1' AND '2013.6.30'
GROUP BY V.NOME , C.NOME, T.TIPO 
WITH ROLLUP;

SELECT
  V.NOME AS VENDEDOR, C.NOME AS CLIENTE,
  T.TIPO AS TIPO_PRODUTO, SUM( I.QUANTIDADE ) AS QTD_TOT
FROM  TB_PEDIDO Pe 
JOIN TB_CLIENTE C ON Pe.CODCLI = C.CODCLI
JOIN TB_VENDEDOR V ON Pe.CODVEN = V.CODVEN
JOIN TB_ITENSPEDIDO I ON Pe.NUM_PEDIDO = I.NUM_PEDIDO
JOIN TB_PRODUTO Pr ON I.ID_PRODUTO = Pr.ID_PRODUTO
JOIN TB_TIPOPRODUTO T ON Pr.COD_TIPO = T.COD_TIPO
WHERE Pe.DATA_EMISSAO BETWEEN '2013.1.1' AND '2013.6.30'
GROUP BY V.NOME , C.NOME, T.TIPO 
WITH CUBE;