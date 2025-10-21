-- PERGUNTA DE NEGÓCIO:
-- Qual o volume (KG) e o valor (FOB USD) exportado, detalhado por Categoria (SH2) e Produto (NCM), entre 2022 e 2025?

USE ComexDB;
GO

SELECT
	p.NO_SH2_POR AS Categoria,
	P.NO_NCM_POR AS Produto,
	SUM(f.KG_LIQUIDO) AS Quantidade,
	SUM(f.VL_FOB) AS ValorTotalUSD
FROM
	fMovimentacoes AS f
INNER JOIN dProduto AS p ON f.FK_PRODUTO = p.CO_NCM
WHERE f.TIPO_MOVIMENTO = 'Exportação'
GROUP BY
	p.NO_SH2_POR,
	P.NO_NCM_POR
ORDER BY
	ValorTotalUSD DESC,
	Categoria;