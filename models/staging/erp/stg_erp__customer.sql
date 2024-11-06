with 
    fonte_customer as (
        select *
        from {{ source('erp_adventure-works', 'CUSTOMER') }}
    )

    , renomeacao as (
        select
            cast(CUSTOMERID as int) as pk_cliente
            , cast(PERSONID as int) as fk_pessoa
            , cast(STOREID as int) as fk_loja
            , cast(TERRITORYID as int) as fk_territorio
            , cast(MODIFIEDDATE as date) as data_modificada
        from fonte_customer
    )

select * 
from renomeacao
