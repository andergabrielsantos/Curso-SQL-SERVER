
--DEFAULT 
/*Quando o valor de um campo não é especificado e ele aceitar valores nulos, automaticamente esse valor 
será definido como NULL. O DEFAULT é usado para alterar esse comportamento padrão. Com ele, é possível 
indicar o valor que será inserido se nenhum valor for especificado.*/ 

--Por exemplo:
CREATE TABLE salario (
  codinst int NOT NULL,
  valor money NOT NULL DEFAULT 2000.00,
  cargo varchar(20) NOT NULL DEFAULT 'Instrutor Passeio'
);

/*Se um registro da tabela acima for inserido sem valores para os campos valor e cargo, o SQL Server irá definir,
respectivamente, os valores 2000,00 e "Instrutor Passeio", para eles.

Um detalhe importante é que a restrição DEFAULT sobrepõe a NOT NULL. Como há um valor padrão, mesmo se os campos 
valor e cargo não forem definidos, eles receberão o valor padrão ao invés de NULL. Isso só iria ocorrer se este 
valor fosse especificado na inserção caso não utilizássemos a cláusula DEFAULT.*/

