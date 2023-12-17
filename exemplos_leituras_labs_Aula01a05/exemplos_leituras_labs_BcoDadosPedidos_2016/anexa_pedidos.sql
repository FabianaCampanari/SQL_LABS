EXEC sp_attach_db 
 @dbname    = 'PEDIDOS',   
 @filename1 = 'c:\Dados\PEDIDOS_TABELAS.mdf', 
 @filename2 = 'c:\Dados\PEDIDOS_INDICES.ndf', 
 @filename3 = 'c:\Dados\PEDIDOS_log.ldf'

