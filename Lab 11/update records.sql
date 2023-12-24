USE SisDep;

-- B�nus de R$ 100,00 para todos os funcion�rios
UPDATE Funcionario
SET salario = salario + 100;


-- Reajuste de 10% para todos os funcion�rios
UPDATE Funcionario
-- SET Salario = Salario * 0.1 + Salario
-- SET Salario = Salario * 1.1
-- Operador Composto
SET Salario *= 1.1;

-- Atualiza��o de mais de uma coluna simultaneamente
-- Com aplica��o de filtros

UPDATE Funcionario
SET Salario = Salario * 1.05,idCargo = 2
WHERE idMatricula = 1000;

