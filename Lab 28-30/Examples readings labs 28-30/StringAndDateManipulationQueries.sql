--1
USE PEDIDOS

--2
SELECT NOME, SALARIO, DATA_ADMISSAO, 
       CASE DATEPART(MONTH,DATA_ADMISSAO)
        WHEN 1 THEN 'Janeiro'
        WHEN 2 THEN 'Fevereiro'
        WHEN 3 THEN 'Mar�o'
        WHEN 4 THEN 'Abril'
