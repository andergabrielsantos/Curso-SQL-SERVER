-----------------------------------------------------------------------------------------
-- Habilita o envio de e-mail no servidor
-----------------------------------------------------------------------------------------
 
sp_configure 'show advanced options', 1;
GO
 
RECONFIGURE
GO
 
sp_configure 'Database Mail XPs', 1;
GO
 
RECONFIGURE
GO
 
 
-----------------------------------------------------------------------------------------
-- Cria uma conta de envio de e-mail no banco de dados
-----------------------------------------------------------------------------------------
 
DECLARE
    @Account_Name SYSNAME = 'ContaEnvioEmail',
    @Profile_Name SYSNAME = 'ProfileEnvioEmail'
    
 
IF ((SELECT COUNT(*) FROM msdb.dbo.sysmail_account WHERE name = @Account_Name) > 0)
    EXEC msdb.dbo.sysmail_delete_account_sp @account_name = @Account_Name
 
 
EXEC msdb.dbo.sysmail_add_account_sp
    @account_name = @Account_Name,
    @description = 'Conta de e-mail para ser utilizada por todos os usuários do banco',
    @email_address = 'usuario@seudominio.com.br',
    @replyto_address = 'naoresponder@seudominio.com.br',
    @display_name = 'Sua Empresa',
    @mailserver_name = 'smtp.seudominio.com.br',
    @mailserver_type = 'SMTP',
    @port = '587',
    @username = 'usuario@seudominio.com.br',
    @password = 'senha',
    @enable_ssl = 1,
    @use_default_credentials = 0
 
 
 
-----------------------------------------------------------------------------------------
-- Cria o profile de e-mail
-----------------------------------------------------------------------------------------
 
IF ((SELECT COUNT(*) FROM msdb.dbo.sysmail_profile WHERE name = @Profile_Name) > 0)
    EXEC msdb.dbo.sysmail_delete_profile_sp @profile_name = @Profile_Name
 
 
 
EXEC msdb.dbo.sysmail_add_profile_sp
    @profile_name = @Profile_Name,
    @description = 'Profile Público para Envio de E-mail' ;
 
 
-----------------------------------------------------------------------------------------
-- Adiciona a conta ao perfil criado
-----------------------------------------------------------------------------------------
 
DECLARE 
    @profile_id INT = (SELECT profile_id FROM msdb.dbo.sysmail_profile WHERE name = @Profile_Name), 
    @account_id INT = (SELECT account_id FROM msdb.dbo.sysmail_account WHERE name = @Account_Name)
    
 
IF ((SELECT COUNT(*) FROM msdb.dbo.sysmail_profileaccount WHERE account_id = @account_id AND profile_id = @profile_id) > 0)
    EXEC msdb.dbo.sysmail_delete_profileaccount_sp @profile_name = @Profile_Name, @account_name = @Account_Name
 
 
EXEC msdb.dbo.sysmail_add_profileaccount_sp
    @profile_name = @Profile_Name,
    @account_name = @Account_Name,
    @sequence_number = 1;
 
 
-----------------------------------------------------------------------------------------
-- Libera acesso no perfil criado para todos os usuários
-----------------------------------------------------------------------------------------
 
IF ((SELECT COUNT(*) FROM msdb.dbo.sysmail_principalprofile WHERE profile_id = @profile_id) > 0)
    EXEC msdb.dbo.sysmail_delete_principalprofile_sp @profile_name = @Profile_Name
 
 
EXEC msdb.dbo.sysmail_add_principalprofile_sp
    @profile_name = @Profile_Name,
    @principal_name = 'public', -- Aqui você pode dar acesso para um usuário específico, se quiser
    @is_default = 1;
 
 
-----------------------------------------------------------------------------------------
-- Define o tamanho máximo por anexo para 5 MB (O Padrão é 1 MB por arquivo)
-----------------------------------------------------------------------------------------
 
EXEC msdb.dbo.sysmail_configure_sp 'MaxFileSize', '5242880'; -- 1024 x 1024 x 5



-----------------------------------------------------------------------------------------------------------

--ENVIANDO EMAIL NO FORMATO HTML
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ProfileEnvioEmail',
    @recipients = 'destinatario@seudominio.com.br',
    @subject = 'Assunto do E-mail',
    @body = 'Olá! <strong>Teste</strong>',
    @body_format = 'html',
    @from_address = 'remetente@seudominio.com.br'
	
--ENVIANDO UM EMAIL CONCATENANDO O RESULTADO DE UMA QUERY AO CORPO DA MENSAGEM 
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ProfileEnvioEmail',
    @recipients = 'destinatario@seudominio.com.br',
    @subject = 'Assunto do E-mail',
    @body = 'Olá! <strong>Teste</strong>',
    @body_format = 'html',
    @from_address = 'remetente@seudominio.com.br',
    @query = 'SELECT TOP 10 * FROM sys.sysobjects'	
	
--ENVIANDO EMAIL COM RESULTADO DE UMA QUERY COMO ANEXO (CSV)
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ProfileEnvioEmail',
    @recipients = 'destinatario@seudominio.com.br',
    @subject = 'Assunto do E-mail',
    @body = 'Olá! <strong>Teste</strong>',
    @body_format = 'html',
    @from_address = 'remetente@seudominio.com.br',
    @query = 'SET NOCOUNT ON; SELECT TOP 10 * FROM sys.sysobjects',
    @query_attachment_filename = 'anexo.csv',
    @attach_query_result_as_file = 1,
    @query_result_header = 1,
    @query_result_width = 256,
    @query_result_separator = ';',
    @query_result_no_padding = 1	
	
	
--ENVIANDO EMAIL COM 2 ARQUIVOS EM ANEXOS
EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ProfileEnvioEmail',
    @recipients = 'destinatario@seudominio.com.br',
    @subject = 'Assunto do E-mail',
    @body = 'Olá! <strong>Teste</strong>',
    @body_format = 'html',
    @from_address = 'remetente@seudominio.com.br',
    @file_attachments = 'C:\Imagem.jpg;C:\Teste.txt'
	
	
--MONITORANDO ENVIO DE EMAILS
CREATE VIEW [dbo].[vwMonitoramento_Email] AS
SELECT
    a.send_request_date AS DataEnvio,
    a.sent_date AS DataEntrega,
    (CASE    
        WHEN a.sent_status = 0 THEN '0 - Aguardando envio'
        WHEN a.sent_status = 1 THEN '1 - Enviado'
        WHEN a.sent_status = 2 THEN '2 - Falhou'
        WHEN a.sent_status = 3 THEN '3 - Tentando novamente'
    END) AS Situacao,
    a.from_address AS Remetente,
    A.recipients AS Destinatario,
    a.subject AS Assunto,
    a.reply_to AS ResponderPara,
    a.body AS Mensagem,
    a.body_format AS Formato,
    a.importance AS Importancia,
    a.file_attachments AS Anexos,
    a.send_request_user AS Usuario,
    B.description AS Erro,
    B.log_date AS DataFalha
FROM 
    msdb.dbo.sysmail_mailitems                  A    WITH(NOLOCK)
    LEFT JOIN msdb.dbo.sysmail_event_log        B    WITH(NOLOCK)    ON A.mailitem_id = B.mailitem_id;
	
	--CONSULTANDO A VIEW
	SELECT * FROM vwMonitoramento_Email;
	
------------------------------------------------------------------------------------------------	
--VERIFICAR SE O SERVICE BROKER ESTA ATIVO PARA O DATABASE MSDB(DEVE RETORNAR 1)
SELECT is_broker_enabled FROM sys.databases WHERE name = 'msdb'
-- SE O RESULTADO FOR (0) QUER DIZER QUE O SERVIÇO ESTA DESABILITADO 

--PARA CORRIGIR ISSO EXECUTE O COMANDO ABAIXO
USE master;
GO
ALTER DATABASE msdb SET ENABLE_BROKER WITH ROLLBACK IMMEDIATE;
GO
__________________________________________________________________________________

--LIMPA TODOS OS EMAIL
DECLARE @GETDATE datetime
SET @GETDATE = GETDATE();
EXECUTE msdb.dbo.sysmail_delete_mailitems_sp @sent_before = @GETDATE;

--CONSULTA AS CONTAS 
EXECUTE msdb.dbo.sysmail_help_account_sp

--DELETA A CONTA 
EXECUTE msdb.dbo.sysmail_delete_account_sp
@account_name = 'Anderson'

--DELETA OS LOGS
EXECUTE msdb.dbo.sysmail_delete_log_sp




	
	
