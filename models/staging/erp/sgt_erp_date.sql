WITH RECURSIVE date_series AS (
    -- Definindo o ponto de partida (primeiro dia) e o ponto final (último dia)
    SELECT CAST('2011-01-01' AS DATE) AS date  -- Ajustado para refletir 2011, início dos dados
    UNION ALL
    SELECT date + INTERVAL '1 DAY' 
    FROM date_series
    WHERE date + INTERVAL '1 DAY' <= '2030-12-31'  -- Limite final ajustado
)

SELECT
    -- Chave Primária da Dimensão de Data (formato YYYYMMDD)
    TO_CHAR(date, 'YYYYMMDD')::INT AS date_id,
    
    -- Data completa
    date AS full_date,

    -- Ano da data
    EXTRACT(YEAR FROM date) AS year,

    -- Mês da data (numérico)
    EXTRACT(MONTH FROM date) AS month,

    -- Nome do mês
    TO_CHAR(date, 'Month') AS month_name,

    -- Trimestre do ano
    CASE
        WHEN EXTRACT(MONTH FROM date) BETWEEN 1 AND 3 THEN 1
        WHEN EXTRACT(MONTH FROM date) BETWEEN 4 AND 6 THEN 2
        WHEN EXTRACT(MONTH FROM date) BETWEEN 7 AND 9 THEN 3
        ELSE 4
    END AS quarter,

    -- Semana do ano
    EXTRACT(WEEK FROM date) AS week,

    -- Dia do mês
    EXTRACT(DAY FROM date) AS day,

    -- Indicador de fim de semana (1 = fim de semana, 0 = dia de semana)
    CASE 
        WHEN EXTRACT(DOW FROM date) IN (0, 6) THEN 1  -- 0 é domingo, 6 é sábado
        ELSE 0
    END AS is_weekend

FROM date_series
