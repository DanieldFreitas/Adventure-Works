with 
    fonte_provincia as (
        select *
        from {{ source('erp_adventure-works', 'STATEPROVINCE') }}
    )

    , renomeacao as (
        select 
         cast(STATEPROVINCEID as int) as pk_provincia
        , cast(TERRITORYID as int) as fk_territorio
        , cast(STATEPROVINCECODE as varchar) as codigo_provincia
        , cast(COUNTRYREGIONCODE as varchar) as codigo_regiao
        , cast(NAME as varchar) as nome_estado
        from fonte_provincia
    )

select *
from renomeacao
