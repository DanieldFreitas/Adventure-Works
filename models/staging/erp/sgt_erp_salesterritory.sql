with 
    fonte_territorio as (
        select *
        from {{ source('erp_adventure-works', 'SALESTERRITORY') }}
    )

    , renomeacao as (
        select 
         cast(TERRITORYID as int) as pk_territorio
        , cast(NAME as varchar) as nome_territorio
        , cast(COUNTRYREGIONCODE as varchar) as codigo_pais
        , cast(SALESYTD as numeric(18,2)) as venda_acumulada 
        , cast(SALESLASTYEAR as numeric(18,2)) as venda_ultimo_ano
        from fonte_territorio
    )

select * 
from renomeacao
