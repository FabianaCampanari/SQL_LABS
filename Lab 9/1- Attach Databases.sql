/*
|-----------------------------------------------------------------------------------------
| Manter os arquivos no diretório C:\Databases
| Dar controle total na permissão de pasta do windows
| Executar o script inteiro							   
|-----------------------------------------------------------------------------------------
*/
------------------------------------------------------------------------------------------------		
		EXEC SP_ATTACH_DB 
			@DBNAME ='SisDep',
			@FILENAME1 = 'C:\DATABASES\SisDep.mdf',
			@FILENAME2 = 'C:\DATABASES\SisDep_log.ldf';
------------------------------------------------------------------------------------------------		
		EXEC SP_ATTACH_DB 
			@DBNAME ='Clientes',
			@FILENAME1 = 'C:\DATABASES\Clientes.mdf',
			@FILENAME2 = 'C:\DATABASES\Clientes.ldf';

------------------------------------------------------------------------------------------------			
		EXEC SP_ATTACH_DB 
			@DBNAME ='SeguroVeiculo',
			@FILENAME1 = 'C:\DATABASES\SeguroVeiculo.mdf',
			@FILENAME2 = 'C:\DATABASES\SeguroVeiculo_log.ldf';
------------------------------------------------------------------------------------------------
		EXEC SP_ATTACH_DB 
			@DBNAME ='SysConVendas',
			@FILENAME1 = 'C:\DATABASES\SysConVendas.mdf',
			@FILENAME2 = 'C:\DATABASES\SysConVendas_log.ldf';
------------------------------------------------------------------------------------------------
		EXEC SP_ATTACH_DB 
			@DBNAME ='Consorcio',
			@FILENAME1 = 'C:\DATABASES\Consorcio.mdf',
			@FILENAME2 = 'C:\DATABASES\Consorcio_log.ldf';
------------------------------------------------------------------------------------------------	
		PRINT 'DATABASE IS READY NOW...'


	
