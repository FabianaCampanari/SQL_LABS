/*
|----------------------------------------------------------------------------					      
| Manter os arquivos no diret�rio C:\BANCOS\ 
| Conectado como SA 
| Configurar Permiss�es da pasta no windows
| Autor: H�lio de Almeida										                           
| Cria��o: 20/1/2010 - Modifica��o: 21/4/2017
|----------------------------------------------------------------------------

*/
USE MASTER;
DROP DATABASE BDClientes;
	
		EXEC SP_ATTACH_DB 
			@DBNAME ='Clientes',
			@FILENAME1 = 'C:\BANCOS\clientes.mdf',
			@FILENAME2 = 'C:\BANCOS\clientes_log.ldf';
	
SELECT 'BANCOS INSTALADOS e Compactados!!!' AS Confirma��o
