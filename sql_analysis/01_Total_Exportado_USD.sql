-- PERGUNTA DE NEGÓCIO:
-- Qual o valor total exportado (em USD) no período analisado?

USE ComexDB;
GO

SELECT
	SUM(VL_FOB) AS TotalExportadoUSD
FROM
	fMovimentacoes
WHERE
	TIPO_MOVIMENTO = 'Exportação';