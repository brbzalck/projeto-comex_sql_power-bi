-- PERGUNTA DE NEG�CIO:
-- Quais s�o os 5 principais pa�ses para os quais o Brasil exportou (em valor FOB USD) entre 2022 e 2025?

USE ComexDB;
GO

SELECT TOP 5
	p.NO_PAIS AS PaisDestino,
	SUM(f.VL_FOB) AS TotalExportadoUSD
FROM
	fMovimentacoes AS f
INNER JOIN
	dPais AS p ON f.FK_PAIS = p.CO_PAIS
WHERE
	f.TIPO_MOVIMENTO = 'Exporta��o'
GROUP BY
	p.NO_PAIS
ORDER BY
	TotalExportadoUSD DESC;