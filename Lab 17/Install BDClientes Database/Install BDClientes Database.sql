/*
|----------------------------------------------------------------------------					      
| Manter os arquivos no diretório C:\BANCOS\ 
| Conectado como SA 
| Configurar Permissões da pasta no windows
| Autor: Hélio de Almeida										                           
| Criação: 20/1/2010 - Modificação: 21/4/2017
|----------------------------------------------------------------------------

*/
USE MASTER;
DROP DATABASE BDClientes;
	
		EXEC SP_ATTACH_DB 
			@DBNAME ='Clientes',
			@FILENAME1 = 'C:\BANCOS\clientes.mdf',
			@FILENAME2 = 'C:\BANCOS\clientes_log.ldf';
	
SELECT 'BANCOS INSTALADOS e Compactados!!!' AS Confirmação
