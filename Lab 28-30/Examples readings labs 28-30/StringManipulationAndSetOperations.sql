-- Chapter 10
USE PEDIDOS;

-- LEN - conta a quantidade de caracteres
SELECT LEN ('Brasil');

-- Replica o texto 
SELECT REPLICATE ('Teste',4);

-- Inverte o texto
SELECT REVERSE ('amina');

-- Converte um n�mero em texto
SELECT STR (213);

-- Retorna uma parte do texto a partir de uma posi��o definida
SELECT SUBSTRING ('Paralelep�pedo',3,7);

-- Concatena strings
SELECT CONCAT ( 'SQL ','m�dulo ','I');

-- Charindex
SELECT CHARINDEX ('A' , 'CASA')

-- Formata uma express�o
SELECT FORMAT GETDATE() , 'dd/MM/yyyy');

SELECT NOME, SALARIO, CASE SINDICALIZADO      
                        WHEN 'S' THEN 'Sim'
                        WHEN 'N' THEN 'N�o'
                        ELSE 'N/C'
                      END AS [Sindicato?] ,
       DATA_ADMISSAO
FROM TB_EMPREGADO;


SELECT NOME, SALARIO, DATA_ADMISSAO, 
       CASE DATEPART(WEEKDAY,DATA_ADMISSAO)
           WHEN 1 THEN 'Domingo'
           WHEN 2 THEN 'Segunda-Feira'
           WHEN 3 THEN 'Ter�a-Feira'
           WHEN 4 THEN 'Quarta-Feira'
           WHEN 5 THEN 'Quinta-Feira'
           WHEN 6 THEN 'Sexta-Feira'
           WHEN 7 THEN 'S�bado' 
       END AS DIA_SEMANA 
FROM TB_EMPREGADO;

SELECT NOME, FONE1 FROM TB_CLIENTE
UNION 
SELECT NOME, FONE1 FROM TB_CLIENTE ORDER BY NOME;

SELECT NOME, FONE1 FROM TB_CLIENTE
UNION ALL
SELECT NOME, FONE1 FROM TB_CLIENTE ORDER BY NOME;

SELECT COD_DEPTO FROM TB_DEPARTAMENTO
INTERSECT
SELECT COD_DEPTO FROM TB_EMPREGADO 

