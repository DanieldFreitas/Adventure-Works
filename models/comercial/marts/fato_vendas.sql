with 
    int_vendas as (
        select *
        from {{ ref('int_vendas_metricas') }}
    )

    , dim_creditcard as (
        select *
        from {{ ref('dim_creditcard') }}
    )
    , dim_customer as (
        select *
        from {{ ref('dim_customer') }}
    )

    , dim_location as (
        select *
        from {{ ref('dim_location') }}
    )
    , dim_product as (
        select *
        from {{ ref('dim_product') }}
    )
    , dim_salesreason as (
        select *
        from {{ ref('dim_salesreason') }}
    )

select *
from int_vendas