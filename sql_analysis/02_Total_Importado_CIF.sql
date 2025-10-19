-- PERGUNTA DE NEG�CIO:
-- Qual o valor total importado (em USD) no per�odo analisado?

USE ComexDB;
GO

SELECT
	SUM(VL_CIF) AS TotalImportadoUSD
FROM
	fMovimentacoes
WHERE
	TIPO_MOVIMENTO = 'Importa��o';