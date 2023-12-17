/*
	Criando um Banco de Dados
	Autor: Hélio de Almeida
	Data: 09/01/2016
*/

-- Criando uma Banco via T-SQL
CREATE DATABASE DepartamentoPessoal;

-- Colocando um Banco em Uso
USE DepartamentoPessoal;

-- Excluir um Banco de Dados
-- O mesmo não poderá estar em uso
USE master;
DROP DATABASE DepartamentoPessoal;
