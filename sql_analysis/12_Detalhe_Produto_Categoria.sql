-- PERGUNTA DE NEG�CIO:
-- Qual o saldo da balan�a comercial (Exporta��es FOB - Importa��es CIF) do Brasil com cada pa�s parceiro entre 2022 e 2025?

USE ComexDB;
GO

SELECT
	p.NO_PAIS AS PaisParceiro,
	SUM(CASE WHEN f.TIPO_MOVIMENTO = 'Exporta��o' THEN f.VL_FOB ELSE 0 END) AS TotalExportadoUSD,
	SUM(CASE WHEN f.TIPO_MOVIMENTO = 'Importa��o' THEN f.VL_CIF ELSE 0 END) AS TotalImportadoUSD,
	SUM(
		CASE
			WHEN f.TIPO_MOVIMENTO = 'Exporta��o' THEN f.VL_FOB
			WHEN f.TIPO_MOVIMENTO = 'Importa��o' THEN -f.VL_CIF
			ELSE 0
		END
	) AS BalancaComercialUSD
FROM
	fMovimentacoes AS f
INNER JOIN
	dPais AS p ON f.FK_PAIS = p.CO_PAIS
-- WHERE YEAR(f.FK_DATA) IN (2022, 2023, 2024, 2025) -- Descomente se quiser filtrar por ano espec�fico
GROUP BY
	p.NO_PAIS
ORDER BY
	BalancaComercialUSD DESC;