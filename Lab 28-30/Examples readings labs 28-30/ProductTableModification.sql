IF EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME='TBPROD')
	DROP TABLE TBPROD

SELECT * into TBPROD FROM TB_PRODUTO

UPDATE TBPROD SET PRECO_VENDA *= 1.3  WHERE COD_TIPO=4
