with 
    fonte_pessoa_cartao as (
        select *
        from {{ source('erp_adventure-works', 'PERSONCREDITCARD') }}
    )

    , renomeacao as (
        select
        cast (BUSINESSENTITYID as int) as pk_pessoa_cartao
        , cast (CREDITCARDID as int ) as fk_cartao
        from fonte_pessoa_cartao
    )

select *
from renomeacao
