USE ComexDB;
GO

----------------------------------------------------
-- CARGA DAS TABELAS AUXILIARES (DIMENS�ES)
----------------------------------------------------

-- Carga da tabela de Pa�ses
BULK INSERT stage_co_pais
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\co_pais.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga tabela NCM (Descri��o do Produto)
BULK INSERT stage_co_ncm
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\co_ncm.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga tabela Unidade do Produto
BULK INSERT stage_co_unid
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\co_unid.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga tabela Urf (Unidades da Receita Federal)
BULK INSERT stage_co_urf
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\co_urf.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga tabela Via Transporte
BULK INSERT stage_co_via
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\co_via.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga tabela Calend�rio com Feriados
BULK INSERT stage_calendario
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\dados_calendario.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

----------------------------------------------------
-- CARGA DAS TABELAS FATO (EXPORTA��O E IMPORTA��O)
----------------------------------------------------

-- Carga da tabela de Exporta��o - 2022
BULK INSERT stage_exp_completa
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\EXP_2022.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga da tabela de Exporta��o - 2023
BULK INSERT stage_exp_completa
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\EXP_2023.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga da tabela de Exporta��o - 2024
BULK INSERT stage_exp_completa
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\EXP_2024.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga da tabela de Exporta��o - 2025
BULK INSERT stage_exp_completa
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\EXP_2025.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga da tabela de Importa��o - 2022
BULK INSERT stage_imp_completa
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\IMP_2022.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga da tabela de Importa��o - 2023
BULK INSERT stage_imp_completa
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\IMP_2023.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga da tabela de Importa��o - 2024
BULK INSERT stage_imp_completa
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\IMP_2024.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO

-- Carga da tabela de Importa��o - 2025
BULK INSERT stage_imp_completa
FROM 'C:\Users\zero\Desktop\projeto-comex_sql_power-bi\dados\IMP_2025.csv'
WITH (
	FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ';'
);
GO