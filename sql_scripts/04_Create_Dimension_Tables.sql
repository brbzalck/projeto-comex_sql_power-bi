USE ComexDB;
GO

----------------------------------------------------
-- Dimensão: Calendário (dCalendario)
-- Transforma os dados brutos em uma dimensão de tempo rica e otimizada.
----------------------------------------------------

-- Bloco de Limpeza: Apaga as tabelas de dimensão se elas já existirem
DROP TABLE IF EXISTS dCalendario;
DROP TABLE IF EXISTS dPais;
DROP TABLE IF EXISTS dProduto;
DROP TABLE IF EXISTS dVia;
DROP TABLE IF EXISTS dURF;
DROP TABLE IF EXISTS dUnidade;
GO

CREATE TABLE dCalendario (
    DATA DATE PRIMARY KEY, 
    ANO INT NOT NULL,
    MES INT NOT NULL,
    DIA INT NOT NULL,
    NOME_MES VARCHAR(50),
    DIA_SEMANA VARCHAR(50),
    TRIMESTRE INT,
    FERIADO BIT NOT NULL,
    NOME_FERIADO VARCHAR(255),
    DIA_UTIL BIT NOT NULL
);
GO

INSERT INTO dCalendario (DATA, ANO, MES, DIA, NOME_MES, DIA_SEMANA, TRIMESTRE, FERIADO, NOME_FERIADO, DIA_UTIL)
SELECT DISTINCT
    -- Cria uma data real a partir das colunas de ano, mês e dia
    DATEFROMPARTS(CO_ANO, CO_MES, CO_DIA) AS DATA,
    CO_ANO AS ANO,
    CO_MES AS MES,
    CO_DIA AS DIA,
    -- Extração do nome do mês
    FORMAT(DATEFROMPARTS(CO_ANO, CO_MES, CO_DIA), 'MMMM', 'pt-BR') AS NOME_MES,
    -- Extração do dia da semana
    FORMAT(DATEFROMPARTS(CO_ANO, CO_MES, CO_DIA), 'dddd', 'pt-BR') AS DIA_SEMANA,
    -- Extração do trimestre por número
    DATEPART(QUARTER, DATEFROMPARTS(CO_ANO, CO_MES, CO_DIA)) AS TRIMESTRE,
    -- Feriado e dia_util em bool
    CAST(FERIADO AS BIT) AS FERIADO,
    NOME_FERIADO,
    CAST(DIA_UTIL AS BIT) AS DIA_UTIL
FROM
    stage_calendario;
GO

----------------------------------------------------
-- Dimensão: Países (dPais)
-- Cria uma lista única de países.
----------------------------------------------------

CREATE TABLE dPais (
    CO_PAIS VARCHAR(5) PRIMARY KEY,
    NO_PAIS VARCHAR(255) NOT NULL
);
GO

INSERT INTO dPais (CO_PAIS, NO_PAIS)
SELECT DISTINCT -- DISTINCT remove as duplicatas
    CO_PAIS,
    NO_PAIS
FROM
    stage_co_pais;
GO

----------------------------------------------------
-- Dimensão: Produto (dProduto)
-- Cria a dimensão de produto com as necessárias.
----------------------------------------------------

CREATE TABLE dProduto (
    CO_NCM VARCHAR(8) PRIMARY KEY,
    -- Nome do Produto
    NO_NCM_POR VARCHAR(2000),
    -- Categoria do produto
    NO_SH2_POR  VARCHAR(2000)
);
GO

INSERT INTO dProduto (CO_NCM, NO_NCM_POR, NO_SH2_POR)
SELECT DISTINCT -- DISTINCT remove as duplicatas
    CO_NCM,
    -- Nome do Produto
    NO_NCM_POR,
    -- Categoria do produto
    NO_SH2_POR
FROM
    stage_co_ncm;
GO

CREATE TABLE dVia (
    CO_VIA VARCHAR(255) PRIMARY KEY,
    NO_VIA VARCHAR(255)
);
GO

INSERT INTO dVia (CO_VIA, NO_VIA)
SELECT DISTINCT CO_VIA, NO_VIA FROM stage_co_via;
GO

CREATE TABLE dUrf (
    CO_URF VARCHAR(255) PRIMARY KEY,
    NO_URF VARCHAR(255)
);
GO

INSERT INTO dUrf (CO_URF, NO_URF)
SELECT DISTINCT CO_URF, NO_URF FROM stage_co_urf;
GO

CREATE TABLE dUnidade (
    CO_UNID VARCHAR(255) PRIMARY KEY,
    NO_UNID VARCHAR(255),
    SG_UNID VARCHAR(255)
);
GO

INSERT INTO dUnidade (CO_UNID, NO_UNID, SG_UNID)
SELECT DISTINCT CO_UNID, NO_UNID, SG_UNID FROM stage_co_unid;
GO