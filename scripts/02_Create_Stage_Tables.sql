USE ComexDB;
GO

-- Tabela de Pa�ses
CREATE TABLE stage_co_pais (
	CO_PAIS VARCHAR(255),
	CO_PAIS_ISON3 VARCHAR(255),
	CO_PAIS_ISOA3 VARCHAR(255),
	NO_PAIS VARCHAR(255),
	NO_PAIS_ING VARCHAR(255),
	NO_PAIS_ESP VARCHAR(255)
);
GO

-- Tabela de descri��es dos produtos
CREATE TABLE stage_co_ncm (
	CO_NCM VARCHAR(2000),
	NO_NCM_POR VARCHAR(2000),
	CO_SH6 VARCHAR(2000),
	NO_SH6_POR VARCHAR(2000),
    NO_SH6_ESP VARCHAR(2000),
    NO_SH6_ING VARCHAR(2000),
	CO_SH4 VARCHAR(2000),
	NO_SH4_POR VARCHAR(2000),
    NO_SH4_ESP VARCHAR(2000),
    NO_SH4_ING VARCHAR(2000),
	CO_SH2 VARCHAR(2000),
	NO_SH2_POR VARCHAR(2000),
    NO_SH2_ESP VARCHAR(2000),
    NO_SH2_ING VARCHAR(2000),
    CO_NCM_SECROM VARCHAR(2000),
    NO_SEC_POR VARCHAR(2000),
    NO_SEC_ESP VARCHAR(2000),
    NO_SEC_ING VARCHAR(2000)
);
GO

-- Tabela de C�digo da unidade associada ao NCM
CREATE TABLE stage_co_unid (
    CO_NCM VARCHAR(255),
    NO_NCM_POR VARCHAR(2000),
    CO_UNID VARCHAR(255),
    NO_UNID VARCHAR(255),
    SG_UNID VARCHAR(255)
);
GO

-- Tabela de Unidades da Receita Federal (locais de desembara�o)
CREATE TABLE stage_co_urf (
    CO_URF VARCHAR(255),
    NO_URF VARCHAR(255)
);
GO

-- Tabela de Vias de Transporte
CREATE TABLE stage_co_via (
    CO_VIA VARCHAR(255),
    NO_VIA VARCHAR(255)
);
GO

-- Tabela Fato com os registros de Exporta��o
CREATE TABLE stage_exp_completa (
    -- Ano da transa��o.
    CO_ANO SMALLINT,
    -- M�s da transa��o.
    CO_MES TINYINT,
    -- C�digo NCM do produto.
    CO_NCM VARCHAR(255),
    -- C�digo da unidade.
    CO_UNID VARCHAR(255),
    -- C�digo do pa�s de destino.
    CO_PAIS VARCHAR(255),
    -- Sigla da UF de origem do Produto.
    SG_UF_NCM VARCHAR(255),
    -- C�digo da via de transporte.
    CO_VIA VARCHAR(255),
    -- C�digo da unidade da Receita Federal.
    CO_URF VARCHAR(255),
    -- Quantidade na medida estat�stica.
    QT_ESTAT VARCHAR(255),
    -- Peso l�quido em KG.
    KG_LIQUIDO VARCHAR(255),
    -- Valor FOB em D�lares.
    VL_FOB VARCHAR(255)
);
GO

CREATE TABLE stage_imp_completa (
    CO_ANO SMALLINT,
    CO_MES TINYINT,
    CO_NCM VARCHAR(255),
    CO_UNID VARCHAR(255),
    CO_PAIS VARCHAR(255),
    SG_UF_NCM VARCHAR(255),
    CO_VIA VARCHAR(255),
    CO_URF VARCHAR(255),
    QT_ESTAT VARCHAR(255),
    KG_LIQUIDO VARCHAR(255),
    VL_FOB VARCHAR(255),
    VL_FRETE VARCHAR(255),
    VL_SEGURO VARCHAR(255)
);
GO

CREATE TABLE stage_calendario (
	CO_ANO INT,
	CO_MES INT,
	CO_DIA INT,
	FERIADO VARCHAR(255),
    NOME_FERIADO VARCHAR(255),
    DIA_UTIL VARCHAR(255)
);
GO