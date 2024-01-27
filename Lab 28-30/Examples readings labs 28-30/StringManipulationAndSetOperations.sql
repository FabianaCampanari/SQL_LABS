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

SELECT NOME
