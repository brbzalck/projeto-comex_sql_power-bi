-- #############################################################################
-- ANÁLISE HIERÁRQUICA DE PRODUTOS - RANKINGS TOP 5
-- Este script contém consultas separadas para identificar os principais 
-- contribuintes em cada nível da hierarquia (Categoria, Produto, Unidade, Via)
-- para Exportações. 
-- Para analisar Importações, substitua 'Exportação' por 'Importação' e VL_FOB por VL_CIF.
-- #############################################################################

USE ComexDB;
GO

-- =============================================================================
-- CONSULTA 1: Top 5 Categorias (SH2) por Valor Exportado
-- =============================================================================

-- PERGUNTA: Quais as 5 categorias (SH2) que mais contribuem para o valor total exportado/importado?

SELECT TOP 5
	p.NO_SH2_POR AS Categoria,
	SUM(VL_FOB) AS TotalSelecionado
FROM fMovimentacoes AS f
INNER JOIN dProduto AS p ON f.FK_PRODUTO = p.CO_NCM
WHERE f.TIPO_MOVIMENTO = 'Exportação'
GROUP BY p.NO_SH2_POR
ORDER BY TotalSelecionado DESC;
GO

-- =============================================================================
-- CONSULTA 2: Top 5 Produtos (NCM) por Valor Exportado
-- =============================================================================

-- PERGUNTA: Quais os 5 produtos específicos (NCM) que mais contribuem para o valor total exportado?

SELECT TOP 5
	p.NO_NCM_POR AS Produto,
	SUM(VL_FOB) AS TotalSelecionado
FROM fMovimentacoes AS f
INNER JOIN dProduto AS p ON f.FK_PRODUTO = p.CO_NCM
WHERE f.TIPO_MOVIMENTO = 'Exportação'
GROUP BY p.NO_NCM_POR
ORDER BY TotalSelecionado DESC;
GO

-- =============================================================================
-- CONSULTA 3: Top 5 Unidades de Medida por Valor Exportado
-- =============================================================================

-- PERGUNTA: Quais as 5 unidades de medida associadas aos maiores valores totais exportados?

SELECT TOP 5
	u.NO_UNID AS Unidade,
	SUM(VL_FOB) AS TotalSelecionado
FROM fMovimentacoes AS f
INNER JOIN dUnidade AS u ON f.FK_UNIDADE = u.CO_UNID
WHERE f.TIPO_MOVIMENTO = 'Exportação'
GROUP BY u.NO_UNID
ORDER BY TotalSelecionado DESC;
GO

-- =============================================================================
-- CONSULTA 4: Top 5 Vias de Transporte por Valor Exportado
-- =============================================================================

-- PERGUNTA: Quais as 5 vias de transporte que movimentam o maior valor total exportado?

SELECT TOP 5
	v.NO_VIA as Via,
	SUM(VL_FOB) AS TotalSelecionado
FROM fMovimentacoes AS f
INNER JOIN dVia as v ON f.FK_VIA = v.CO_VIA
WHERE f.TIPO_MOVIMENTO = 'Exportação'
GROUP BY v.NO_VIA
ORDER BY TotalSelecionado DESC;
GO