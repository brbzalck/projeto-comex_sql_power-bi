-- PERGUNTA DE NEG�CIO:
-- Qual o percentual que os custos log�sticos (Frete + Seguro) representam sobre o valor do produto (FOB) nas importa��es?

USE ComexDB;
GO

SELECT
		-- Calcula o Overhead Log�stico %
		-- CAST para garantir a divis�o decimal e NULLIF para evitar divis�o por zero
		CAST(SUM(CASE WHEN TIPO_MOVIMENTO = 'Importa��o' THEN VL_FRETE ELSE 0 END) + SUM(CASE WHEN TIPO_MOVIMENTO = 'Importa��o' THEN VL_SEGURO ELSE 0 END) AS DECIMAL(38,2)) 
		/ 
		NULLIF(SUM(CASE WHEN TIPO_MOVIMENTO = 'Importa��o' THEN VL_FOB ELSE 0 END), 0) AS OverheadLogisticoPercentual
FROM
	fMovimentacoes;