--Funções escalares

--O SQL Server possui diversas funções escalares. 
--Por uma função escalar, você pode entender funções que retornam um único valor. 
--Para tratar cadeias de caracteres, as mais usadas são:

--CONCAT: Agrupa duas ou mais cadeias de caracteres. Sua sintaxe é:
CONCAT(string1, string2 ... stringN);

--EXEMPLO:
SELECT CONCAT(FUN_NOME,' ',FUN_SOBRENOME) AS NOME FROM FUN_FUNCIONARIOS 
NOME
---------------
JOÃO DASILVA
MARIA DE SOUSA
JOSE ALENCAR
_______________________________________________________________________________________________________________
--LOWER: Converte todos os caracteres para minúsculo. Sua sintaxe é:
LOWER(string);
--UPPER: Converte todos os caracteres para maiúsculo. Sua sintaxe é:
UPPER(string);
--EXEMPLO LOWER:
SELECT LOWER(FUN_NOME + ' '+FUN_SOBRENOME) AS NOME FROM FUN_FUNCIONARIOS
NOME
---------------
joão dasilva
maria de sousa
jose alencar

--EXEMPLO UPPER
NOME
---------------
JOÃO DASILVA
MARIA DE SOUSA
JOSE ALENCAR 
__________________________________________________________________________________________________________________
--REPLACE: Substitui todas as ocorrências de uma sequência de caracteres por outra. Sua sintaxe é:
REPLACE(string_original, string_a_trocar, string_nova);
--O exemplo a seguir substitui a cadeia de caracteres cde em abcdefghi por xxx.
SELECT REPLACE('abcdefghicde','cde','xxx');
------------  
abxxxfghixxx  
___________________________________________________________________________________________________________________
--SUBSTRING: Retorna parte de uma cadeia de caracteres definida. Sua sintaxe é:
SUBSTRING('string_original', 'posicao', 'tamanho');
--EXEMPLOS
SELECT FUN_NOME, SUBSTRING(FUN_NOME,1,1) AS INICIAL,
                 SUBSTRING(FUN_NOME, 2,3) INTERVALOS
 FROM FUN_FUNCIONARIOS

 FUN_NOME	INICIAL	INTERVALOS
 -----------------------------
 JOÃO	    J	    OÃO
 MARIA	    M	    ARI
 JOSE	    J	    OSE
 _________________________________________________________________________________________________________________
--FUNÇOES ESCALARES MATEMATICAS

--ABS: Retorna o valor positivo absoluto do valor de entrada. Sua sintaxe é:
ABS(valor);
--EXEMPLO 1:
SELECT ABS(-1.0), ABS(0.0), ABS(1.0); 
-------------------------------
1.0 	0.0	       1.0 

--EXEMPLO 2:
DECLARE @i int;  
SET @i = -21;  
SELECT ABS(@i) AS 'VALOR POSITIVO'; 

VALOR POSITIVO
------------------
21
________________________________________________________________________________________________________________________
--LOG10: Retorna o logaritmo da base 10 do valor de entrada. Sua sintaxe é:
LOG10(valor);

--EXEPLO
DECLARE @var float;  
SET @var = 145.175643;  
SELECT 'O -LOG10- da variavel é: ' + CONVERT(varchar,LOG10(@var)) as '-LOG10-';

-LOG10-
-----------------------
--O -LOG10- da variavel é: 2.16189
__________________________________________________________________________________________________________________________
--PI Retorna o valor da constante PI. Sua sintaxe é:
PI();
--EXEMPLO
SELECT 'O valor de PI é'+ ' '+ CONVERT(varchar,PI()) ;
O valor de PI é 3.14159
___________________________________________________________________________________________________________________________
--RAND: Retorna um número aleatório entre 0 e 1. Se for informado um valor no seu parâmetro, 
--o número gerado deixará de ser aleatório, repetindo sempre que o mesmo parâmetro for informado. 
--Sua sintaxe é
RAND([valor]);

DECLARE @counter smallint;  
SET @counter = 1;  
WHILE @counter < 5  
   BEGIN  
      SELECT RAND() Random_Number  
      SET @counter = @counter + 1  
   END;  

Random_Number
0,848250351683423
Random_Number
0,691863659534912
Random_Number
0,908596857535953
Random_Number
0,543030346178004
_________________________________________________________________________________________________________________________
--Para trabalhar com os tipos de data e hora, o SQL fornece várias funções, as utilizadas são as seguintes:

--SYSDATETIME: Retorna data e hora no formato datetime2(7) do computador onde o banco de dados está instalado:
SYSDATETIME();
--EXEMPLO
SELECT SYSDATETIME() DATA_HORA;
DATA_HORA
----------------------------
2018-11-26 11:56:06.4904208
__________________________________________________________________________________________________________________________
--DATEFROMPARTS: Retorna uma data a partir dos parâmetros passados. Sua sintaxe é:
DATEFROMPARTS ( ano, mes, dia )
--EXEMPPLO
SELECT DATEFROMPARTS ( 2010, 12, 31 ) AS Resultado; 
Resultado
------------
2010-12-31
__________________________________________________________________________________________________________________________
--DATEDIFF: Retorna a diferença entre duas datas. Veja sua sintaxe:
DATEDIFF(unidade_retorno, data_inicial, data_final);
--EXEMPLO
SELECT CONCAT(FUN_NOME, ' ',FUN_SOBRENOME) AS NOME_COMPLETO, FUN_DATA_NASCIMENTO FROM FUN_FUNCIONARIOS
WHERE DATEDIFF(YEAR, FUN_DATA_NASCIMENTO, GETDATE()) >= 25;

--Nessa consulta ira trazer todos os funcionarios que tenham 25 anos ou mais
NOME_COMPLETO	FUN_DATA_NASCIMENTO
-------------------------------------
JOÃO DASILVA	1980-02-15
MARIA DE SOUSA	1990-07-03
JOSE ALENCAR	1968-12-05

--A unidade de retorno pode ser:

Year- Anos;
Quarter – Trimestres;
Month – Meses;
Dayofyear – Dias do Ano;
Day – Dias;
Week – Semanas;
Hour – Horas;
Minute – Minutos;
Second – Segundos;
Millisecond – milissegundos;
Microsecond – Microssegundos;
Nanosecond – Nanossegundos.
___________________________________________________________________________________________________________________________
--Também temos outras funções de uso diverso:

HOST_NAME: Retorna o nome da estação que está executando.

DB_NAME: Retorna o banco de dados que está conectado agora.

SYSTEM_USER: Retorna o usuário conectado.

--CAST: Realiza a conversão entre tipos de dados. Sua sintaxe é:
CAST ( valor AS tipo_dados [ ( tamanho ) ] )

O tamanho é opcional.
	