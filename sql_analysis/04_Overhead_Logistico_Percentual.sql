-- PERGUNTA DE NEGÓCIO:
-- Qual o percentual que os custos logísticos (Frete + Seguro) representam sobre o valor do produto (FOB) nas importações?

USE ComexDB;
GO

SELECT
		-- Calcula o Overhead Logístico %
		-- CAST para garantir a divisão decimal e NULLIF para evitar divisão por zero
		CAST(SUM(CASE WHEN TIPO_MOVIMENTO = 'Importação' THEN VL_FRETE ELSE 0 END) + SUM(CASE WHEN TIPO_MOVIMENTO = 'Importação' THEN VL_SEGURO ELSE 0 END) AS DECIMAL(38,2)) 
		/ 
		NULLIF(SUM(CASE WHEN TIPO_MOVIMENTO = 'Importação' THEN VL_FOB ELSE 0 END), 0) AS OverheadLogisticoPercentual
FROM
	fMovimentacoes;