
--COMANDO UPDATE SIMPLES 
--OBS: N�O � RECOMENDADO FAZER UPDATE SEM A FUN�A� (WHERE) 
--DESSA FORMA VOC� ESTARA INSERIDO O MESMO DADO PARA TODOS REGISTRO DAQUELA COLUNA 
UPDATE FUN_FUNCIONARIOS
     SET FUN_CPF = '12312312312'

--FORMA CORRETA DE FAZER UM UPDATE SEM AFETA TODOS OS REGISTROS 
UPDATE FUN_FUNCIONARIOS
     SET FUN_CPF = '32003705805', FUN_DATA_NASCIMENTO = '1983-07-20'
	  WHERE FUN_ID = 01;

	 
    