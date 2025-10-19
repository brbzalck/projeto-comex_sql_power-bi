-- PERGUNTA DE NEGÓCIO:
-- Qual foi a evolução anual da balança comercial (Exportações vs. Importações CIF) entre 2022 e 2025?

USE ComexDB;
GO

SELECT
	-- Extrai o ano da chave de data
	YEAR(FK_DATA) AS Ano,
	-- Calcula o Total Exportado (FOB)
	SUM(CASE WHEN TIPO_MOVIMENTO = 'Exportação' THEN VL_FOB ELSE 0 END) AS TotalExportadoUSD,
	-- Calcula o Total Importado (CIF)
	SUM(CASE WHEN TIPO_MOVIMENTO = 'Importação' THEN VL_CIF ELSE 0 END) AS TotalImportadoCIF,
	-- Calcula a Balança Comercial
	SUM(CASE
			WHEN TIPO_MOVIMENTO = 'Exportação' THEN VL_FOB
			WHEN TIPO_MOVIMENTO = 'Importação' THEN -VL_CIF
			ELSE 0
		END
	) AS BalancaComercialUSD
FROM
	fMovimentacoes
WHERE
	-- Filtra apenas para os anos de interesse
	YEAR(FK_DATA) IN (2022, 2023, 2024, 2025)
GROUP BY
	-- Agrupa os resultados por ano
	YEAR(FK_DATA)
ORDER BY
	-- Ordena o resultado final por ano
	Ano;