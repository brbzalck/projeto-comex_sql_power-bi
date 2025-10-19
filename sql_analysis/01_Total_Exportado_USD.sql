-- PERGUNTA DE NEG�CIO:
-- Qual o valor total exportado (em USD) no per�odo analisado?

USE ComexDB;
GO

SELECT
	SUM(VL_FOB) AS TotalExportadoUSD
FROM
	fMovimentacoes
WHERE
	TIPO_MOVIMENTO = 'Exporta��o';