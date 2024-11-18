with 
    fonte_cartao as (
        select * 
        from {{ source('erp_adventure-works', 'CREDITCARD') }}
    )

    , renomeacao as (
        select
             cast (CREDITCARDID as int) as pk_cartao
            , cast (CARDTYPE as varchar) as tipo_cartao
            , cast (CARDNUMBER as int) as numero_cartao 
            , cast (EXPMONTH as int) as mes_expiracao
            , cast (EXPYEAR as int ) as ano_expiracao     
        from fonte_cartao
    )

select * 
from renomeacao
