with 
    fonte_endereco as (
        select * 
        from {{ source('erp_adventure-works', 'ADDRESS') }}
    )

    , renomeacao as (
        select 
             cast(ADDRESSID as int) as pk_endereco
            , cast(STATEPROVINCEID as int) as fk_provincia
            , cast(ADDRESSLINE1 as varchar) as nome_endereco
            , cast(CITY as varchar) as cidade
            , cast(POSTALCODE as varchar) as codigo_postal 
        from fonte_endereco
    )

select *
from renomeacao
