


CREATE FUNCTION [dbo].[F_CONSULTA_LIVROS_EDITORA] ( @CODIGO INT)
RETURNS @lIVROS_EDITORA TABLE
(ID_LIVRO INT,
NOME_EDITOR VARCHAR(30),
NOME_LIVRO VARCHAR(30),
NOME_AUTOR VARCHAR(30),
DATA_PUBLICACAO DATE,
PRECO_LIVRO MONEY
)
AS
BEGIN
    INSERT @lIVROS_EDITORA (ID_LIVRO, NOME_EDITOR,NOME_LIVRO,NOME_AUTOR, DATA_PUBLICACAO,PRECO_LIVRO)

	SELECT LI.ID_LIVRO, 
	 ED.NOME_EDITORA,
	 LI.ID_LIVRO, 
	 AU.NOME_AUTOR, 
	 LI.DATA_PUBLICACAO, 
	 LI.PRECO_LIVRO
	 FROM TBL_LIVROS AS LI
	JOIN TBL_EDITORAS AS ED ON LI.ID_EDITORA = ED.ID_EDITORA
	JOIN TBL_AUTORES AS AU ON AU.ID_AUTOR = LI.ID_AUTOR
	WHERE LI.ID_LIVRO = @CODIGO
	RETURN
END;

SELECT * FROM dbo.F_CONSULTA_LIVROS_EDITORA (100)