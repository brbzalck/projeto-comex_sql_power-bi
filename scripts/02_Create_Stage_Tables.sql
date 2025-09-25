USE ComexDB;
GO

-- Tabela de Países
CREATE TABLE stage_co_pais (
	CO_PAIS VARCHAR(5),
	CO_PAIS_ISON3 VARCHAR(5),
	CO_PAIS_ISOA3 VARCHAR(5),
	NO_PAIS VARCHAR(255),
	NO_PAIS_ING VARCHAR(255),
	NO_PAIS_ESP VARCHAR(255)
);
GO

-- Tabela de descrições dos produtos
CREATE TABLE stage_co_ncm (
	CO_NCM VARCHAR(8),
	NO_NCM_POR VARCHAR(2000),
	CO_SH6 VARCHAR(6),
	NO_SH6_POR VARCHAR(255),
    NO_SH6_ESP VARCHAR(255),
    NO_SH6_ING VARCHAR(255),
	CO_SH4 VARCHAR(4),
	NO_SH4_POR VARCHAR(255),
    NO_SH4_ESP VARCHAR(255),
    NO_SH4_ING VARCHAR(255),
	CO_SH2 VARCHAR(2),
	NO_SH2_POR VARCHAR(2000),
    NO_SH2_ESP VARCHAR(255),
    NO_SH2_ING VARCHAR(255),
    CO_NCM_SECROM VARCHAR(5),
    NO_SEC_POR VARCHAR(255),
    NO_SEC_ESP VARCHAR(255),
    NO_SEC_ING VARCHAR(255)
);
GO

-- Tabela de Código da unidade associada ao NCM
CREATE TABLE stage_co_unid (
    CO_NCM VARCHAR(8),
    NO_NCM_POR VARCHAR(2000),
    CO_UNID VARCHAR(10),
    NO_UNID VARCHAR(255),
    SG_UNID VARCHAR(50)
);
GO

-- Tabela de Unidades da Receita Federal (locais de desembaraço)
CREATE TABLE stage_co_urf (
    CO_URF VARCHAR(10),
    NO_URF VARCHAR(255)
);
GO

-- Tabela de Vias de Transporte
CREATE TABLE stage_co_via (
    CO_VIA VARCHAR(10),
    NO_VIA VARCHAR(255)
);
GO

-- Tabela Fato com os registros de Exportação
CREATE TABLE stage_exp_completa (
    -- Ano da transação.
    CO_ANO SMALLINT,
    -- Mês da transação.
    CO_MES TINYINT,
    -- Código NCM do produto.
    CO_NCM VARCHAR(8),
    -- Código da unidade.
    CO_UNID VARCHAR(10),
    -- Código do país de destino.
    CO_PAIS VARCHAR(5),
    -- Sigla da UF de origem do Produto.
    SG_UF_NCM VARCHAR(2),
    -- Código da via de transporte.
    CO_VIA VARCHAR(10),
    -- Código da unidade da Receita Federal.
    CO_URF VARCHAR(10),
    -- Quantidade na medida estatística.
    QT_ESTAT VARCHAR(50),
    -- Peso líquido em KG.
    KG_LIQUIDO VARCHAR(50),
    -- Valor FOB em Dólares.
    VL_FOB VARCHAR(50)
);
GO

CREATE TABLE stage_imp_completa (
    CO_ANO SMALLINT,
    CO_MES TINYINT,
    CO_NCM VARCHAR(8),
    CO_UNID VARCHAR(10),
    CO_PAIS VARCHAR(5),
    SG_UF_NCM VARCHAR(2),
    CO_VIA VARCHAR(10),
    CO_URF VARCHAR(10),
    QT_ESTAT VARCHAR(50),
    KG_LIQUIDO VARCHAR(50),
    VL_FOB VARCHAR(50),
    VL_FRETE VARCHAR(50),
    VL_SEGURO VARCHAR(50)
);
GO

CREATE TABLE stage_dados_calendario (
	CO_ANO INT,
	CO_MES INT,
	CO_DIA INT,
	FERIADO VARCHAR(5),
    NOME_FERIADO VARCHAR(255),
    DIA_UTIL VARCHAR(5)
);
GO