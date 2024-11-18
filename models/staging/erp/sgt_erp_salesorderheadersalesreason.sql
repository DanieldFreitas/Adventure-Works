with 
    fonte_ordem_venda as (
        select *
        from {{ source('erp_adventure-works', 'SALESORDERHEADERSALESREASON') }}
    )

    , renomeacao as (
        select 
        cast (SALESORDERID as int) as fk_ordemvenda
        , cast (SALESREASONID as int) as fk_motivovenda
        from fonte_ordem_venda
    )

select *
from renomeacao   