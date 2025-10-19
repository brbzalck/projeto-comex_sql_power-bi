-- PERGUNTA DE NEG�CIO:
-- Qual o saldo da balan�a comercial (Exporta��es - Importa��es CIF) no per�odo analisado?

USE ComexDB;
GO

SELECT
	SUM(
		CASE
			WHEN TIPO_MOVIMENTO = 'Exporta��o' THEN VL_FOB
			WHEN TIPO_MOVIMENTO = 'Importa��o' THEN -VL_CIF -- Subtrai o valor CIF das importa��es
			ELSE 0
		END
	) AS BalancaComercialUSD
FROM
	fMovimentacoes