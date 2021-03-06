CREATE TABLE PAC_PONTOS_ACESSO
(
PAC_ID INT IDENTITY(1,1) PRIMARY KEY,
PAC_DATA_INICIAL DATETIME NOT NULL,
PAC_DATA_FINAL DATETIME DEFAULT NULL,
FUN_ID INT NOT NULL
);

ALTER TABLE PAC_PONTOS_ACESSO 
ADD CONSTRAINT FK_PAC_PONTOS_ACESSO__FUN_FUNCIONARIO_FUN_ID 
FOREIGN KEY(FUN_ID) REFERENCES FUN_FUNCIONARIOS(FUN_ID);

INSERT INTO PAC_PONTOS_ACESSO (PAC_DATA_INICIAL, FUN_ID) VALUES ('2017-02-01 07:00:00', 1);