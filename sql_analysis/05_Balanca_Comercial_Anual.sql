-- PERGUNTA DE NEG�CIO:
-- Qual foi a evolu��o anual da balan�a comercial (Exporta��es vs. Importa��es CIF) entre 2022 e 2025?

USE ComexDB;
GO

SELECT
	-- Extrai o ano da chave de data
	YEAR(FK_DATA) AS Ano,
	-- Calcula o Total Exportado (FOB)
	SUM(CASE WHEN TIPO_MOVIMENTO = 'Exporta��o' THEN VL_FOB ELSE 0 END) AS TotalExportadoUSD,
	-- Calcula o Total Importado (CIF)
	SUM(CASE WHEN TIPO_MOVIMENTO = 'Importa��o' THEN VL_CIF ELSE 0 END) AS TotalImportadoCIF,
	-- Calcula a Balan�a Comercial
	SUM(CASE
			WHEN TIPO_MOVIMENTO = 'Exporta��o' THEN VL_FOB
			WHEN TIPO_MOVIMENTO = 'Importa��o' THEN -VL_CIF
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