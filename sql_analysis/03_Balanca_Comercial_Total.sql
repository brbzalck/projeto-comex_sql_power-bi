-- PERGUNTA DE NEGÓCIO:
-- Qual o saldo da balança comercial (Exportações - Importações CIF) no período analisado?

USE ComexDB;
GO

SELECT
	SUM(
		CASE
			WHEN TIPO_MOVIMENTO = 'Exportação' THEN VL_FOB
			WHEN TIPO_MOVIMENTO = 'Importação' THEN -VL_CIF -- Subtrai o valor CIF das importações
			ELSE 0
		END
	) AS BalancaComercialUSD
FROM
	fMovimentacoes