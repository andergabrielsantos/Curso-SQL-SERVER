
--DEFAULT 
/*Quando o valor de um campo n�o � especificado e ele aceitar valores nulos, automaticamente esse valor 
ser� definido como NULL. O DEFAULT � usado para alterar esse comportamento padr�o. Com ele, � poss�vel 
indicar o valor que ser� inserido se nenhum valor for especificado.*/ 

--Por exemplo:
CREATE TABLE salario (
  codinst int NOT NULL,
  valor money NOT NULL DEFAULT 2000.00,
  cargo varchar(20) NOT NULL DEFAULT 'Instrutor Passeio'
);

/*Se um registro da tabela acima for inserido sem valores para os campos valor e cargo, o SQL Server ir� definir,
respectivamente, os valores 2000,00 e "Instrutor Passeio", para eles.

Um detalhe importante � que a restri��o DEFAULT sobrep�e a NOT NULL. Como h� um valor padr�o, mesmo se os campos 
valor e cargo n�o forem definidos, eles receber�o o valor padr�o ao inv�s de NULL. Isso s� iria ocorrer se este 
valor fosse especificado na inser��o caso n�o utiliz�ssemos a cl�usula DEFAULT.*/

