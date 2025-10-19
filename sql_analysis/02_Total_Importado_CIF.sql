-- PERGUNTA DE NEGÓCIO:
-- Qual o valor total importado (em USD) no período analisado?

USE ComexDB;
GO

SELECT
	SUM(VL_CIF) AS TotalImportadoUSD
FROM
	fMovimentacoes
WHERE
	TIPO_MOVIMENTO = 'Importação';