-- PERGUNTA DE NEG�CIO:
-- Quais s�o os 10 principais pa�ses dos quais o Brasil importou (em valor CIF USD) entre 2022 e 2025?

USE ComexDB;
GO

SELECT TOP 10
	p.NO_PAIS AS PaisOrigem,
	SUM(f.VL_CIF) AS TotalImportadoCif
FROM
	fMovimentacoes AS f
INNER JOIN
	dPais AS p ON f.FK_PAIS = p.CO_PAIS
WHERE
	f.TIPO_MOVIMENTO = 'Importa��o'
GROUP BY
	p.NO_PAIS
ORDER BY
	TotalImportadoCif DESC;