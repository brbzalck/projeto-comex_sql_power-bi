# Análise da Balança Comercial Brasileira (SQL ETL & Power BI)

**Visualize o Dashboard Interativo:** https://app.powerbi.com/view?r=eyJrIjoiNTAzZWFmYTAtODgyMy00ODczLTgxMTctMDllODU1MWQ1NzhlIiwidCI6IjYzZDBkNmQzLWIxNGUtNDM4Yy1hOWU1LWUzMmZmMTQ3MzE5YiJ9 🚀

## 📜 Descrição do Projeto

Este projeto realiza uma análise completa da balança comercial brasileira (exportações e importações) referente ao período de 2022 a 2025. O principal diferencial deste trabalho é a demonstração de **proficiência em SQL** para todo o fluxo de ETL (Extração, Transformação e Carga) e modelagem de dados, simulando um ambiente profissional onde os dados são preparados no banco de dados antes de serem consumidos pela ferramenta de BI.

O resultado final é um dashboard interativo no Power BI, complementado por um conjunto de scripts SQL que replicam as principais análises de forma ad-hoc.

## 🎯 Objetivos

* Analisar o desempenho da balança comercial brasileira.
* Identificar os principais produtos e parceiros comerciais (exportação e importação).
* Analisar o impacto dos custos logísticos (frete e seguro) nas importações.
* **Demonstrar a aplicação de T-SQL (SQL Server) para:**
    * Extração e carga de dados brutos (CSV).
    * Limpeza e transformação de dados (tratamento de erros, duplicatas, tipos de dados).
    * Modelagem dimensional (criação de Modelo Estrela).
    * Realização de análises ad-hoc complexas.
* Construir um dashboard claro e informativo no Power BI.

## 💾 Fonte dos Dados

Os dados brutos foram extraídos do portal oficial do Governo Federal, **Comex Stat**, garantindo informações atualizadas e relevantes sobre o comércio exterior brasileiro.

* **Fonte:** [Estatísticas de Comércio Exterior em Dados Abertos](https://www.gov.br/mdic/pt-br/assuntos/comercio-exterior/estatisticas/base-de-dados-bruta)
* **Período Analisado:** 2022 - 2025
* **Formato:** Arquivos `.csv`

## 🛠️ Ferramentas Utilizadas

* **Banco de Dados:** Microsoft SQL Server
* **Linguagem SQL:** T-SQL
* **BI & Visualização:** Power BI Desktop & Service
* **Versionamento:** Git & GitHub
* **Arquivos Grandes:** Git LFS (para o arquivo `.pbix`)
* **Figma:** (para design dos backgrounds das páginas)

## 📁 Estrutura do Repositório

* **/dados:** (Idealmente deveria conter os CSVs, mas podem ser muito grandes para o GitHub).
* **/figma:** Contém todos os backgrounds desenvolvidos no figma para o projeto.
* **/sql_scripts:** Contém os scripts T-SQL sequenciais (01 a 05) para criar o banco, as tabelas de staging, carregar os dados brutos, criar as dimensões e a tabela fato (processo ETL completo).
* **/sql_analysis:** Contém scripts T-SQL individuais (`.sql`) que replicam as análises e KPIs apresentados no dashboard Power BI, demonstrando a capacidade de realizar consultas ad-hoc.
* `Relatorio_Comex.pbix`: O arquivo final do Power BI (rastreado via Git LFS).
* `README.md`: Esta documentação.

## ⚙️ Processo de ETL e Modelagem (SQL)

Todo o processo de preparação dos dados foi realizado via T-SQL no SQL Server:

1.  **Extração e Carga (Staging):**
    * Criação do banco `ComexDB` e tabelas de Staging (`stage_...`).
    * Carga eficiente de milhões de registros dos arquivos CSV usando `BULK INSERT`, tratando desafios como codificação de caracteres (`CODEPAGE='65001'`) e delimitadores (`FORMAT='CSV'`, `FIELDTERMINATOR`).
    * Implementação de scripts "re-executáveis" com `TRUNCATE TABLE` para garantir a limpeza antes da carga.
2.  **Transformação:**
    * Limpeza de dados duplicados na tabela de calendário (`stage_calendario`) usando `GROUP BY`.
    * Conversão dos valores numéricos (originalmente `VARCHAR` devido à carga inicial) para `BIGINT`, após validação de que não havia decimais implícitos.
    * Enriquecimento da dimensão de calendário (`dCalendario`) com `DATEFROMPARTS` e `FORMAT`.
    * Cálculo de novas métricas, como o `VL_CIF` (FOB + Frete + Seguro) para importações.
3.  **Modelagem:**
    * Criação das tabelas de Dimensão (`dCalendario`, `dPais`, `dProduto`, `dUnidade`, `dURF`, `dVia`) a partir das tabelas de Staging, selecionando colunas relevantes e garantindo unicidade (`DISTINCT`, `PRIMARY KEY`).
    * Criação da Tabela Fato centralizada (`fMovimentacoes`), unindo dados de exportação e importação e incluindo chaves estrangeiras (`FK_...`) para as dimensões.
    * Implementação de um **Modelo Estrela (Star Schema)** otimizado para consultas analíticas.

## ✨ Principais Análises no Dashboard

O dashboard Power BI permite explorar:

* A evolução da Balança Comercial (superávit/déficit) ao longo do tempo.
* Os Top 10 países parceiros (destino das exportações e origem das importações).
* O ranking das principais categorias e produtos comercializados (valor e volume).
* A composição do custo de importação (produto vs. frete vs. seguro).
* O impacto percentual dos custos logísticos (`Overhead Logístico %`) sobre o valor dos produtos importados.

## 🚀 Como Executar/Reproduzir (Opcional - Adapte à sua necessidade)

1.  Clone este repositório.
2.  Certifique-se de ter o Git LFS instalado (`git lfs install`).
3.  Baixe os arquivos CSV originais da fonte de dados mencionada e coloque-os na pasta `/dados/`.
4.  Execute os scripts na pasta `/sql_scripts/` em ordem (01 a 05) em uma instância do SQL Server para criar e popular o Data Mart `ComexDB`.
5.  Abra o arquivo `Relatorio_Comex.pbix` no Power BI Desktop. (Pode ser necessário atualizar a fonte de dados se o servidor SQL não for `localhost`).

## 📊 Análises Ad-Hoc em SQL

Além do dashboard, a pasta `/sql_analysis/` contém scripts T-SQL prontos para responder diretamente às principais perguntas de negócio, demonstrando a capacidade de realizar análises rápidas diretamente no banco de dados.

## 👨‍💻 Autor

**[Lucas Barbosa de Oliveira]**

* **LinkedIn:** [https://www.linkedin.com/in/lucabrbza]
* **GitHub:** [https://github.com/brbzalck/projeto-comex_sql_power-bi.git]

---