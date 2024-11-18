with 
    fonte_motivo_venda as (
        select *
        from {{ source('erp_adventure-works', 'SALESREASON') }}
    )

    , renomeacao as (
        select 
        cast (SALESREASONID as int) as pk_motivovenda
        , cast (NAME as varchar) as nome_loja
        , cast (REASONTYPE as varchar) as tipo_venda
        from fonte_motivo_venda
    )

select *
from renomeacao