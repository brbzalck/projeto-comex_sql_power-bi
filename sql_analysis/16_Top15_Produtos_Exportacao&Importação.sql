-- PERGUNTA DE NEG�CIO:
-- Quais s�o os 15 produtos espec�ficos (NCM) mais exportados pelo Brasil (em valor FOB USD) entre 2022 e 2025?

USE ComexDB;
GO

SELECT TOP 15
	p.NO_NCM_POR AS	Produto,
	SUM(f.VL_FOB) AS ValorTotal -- Ou ent�o VL_CIF para ver importa��o
FROM
	fMovimentacoes AS f
INNER JOIN
	dProduto AS p ON f.FK_PRODUTO = p.CO_NCM
WHERE
	f.TIPO_MOVIMENTO = 'Exporta��o' -- Ou ent�o importa��o junto do VL_CIF da linha 9
GROUP BY
	p.NO_NCM_POR
ORDER BY
	ValorTotal DESC;