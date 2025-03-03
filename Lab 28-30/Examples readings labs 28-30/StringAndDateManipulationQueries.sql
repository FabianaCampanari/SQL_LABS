--1
USE PEDIDOS

--2
SELECT NOME, SALARIO, DATA_ADMISSAO, 
       CASE DATEPART(MONTH,DATA_ADMISSAO)
       WHEN 1 THEN 'Janeiro'
       WHEN 2 THEN 'Fevereiro'
       WHEN 3 THEN 'Mar�o'
       WHEN 4 THEN 'Abril'
       WHEN 5 THEN 'Maio'
       WHEN 6 THEN 'Junho'
       WHEN 7 THEN 'Julho'      
       WHEN 8 THEN 'Agosto'      
       WHEN 9 THEN 'Setembro'      
       WHEN 10 THEN 'Outubro'      
       WHEN 11 THEN 'Novembro'      
       WHEN 12 THEN 'Dezembro' 
      END AS MES
FROM tb_EMPREGADO;

--3
SELECT NOME , 
CONCAT(ENDERECO, ' - ' , BAIRRO , ' - ' , CIDADE , '/', ESTADO) AS ENDERECO
FROM tb_CLIENTE

--4
SELECT SUBSTRING(NOME, 1, CHARINDEX(' ' , NOME)) as Nome, 
FORMAT( DATA_NASCIMENTO , 'dd/MM' ) AS [Anivers�rio]
FROM tb_EMPREGADO

--5
SELECT * FROM TBPROD
INTERSECT
SELECT * FROM TB_PRODUTO

--6
SELECT * FROM TBPROD
EXCEPT
SELECT * FROM TB_PRODUTO
,



