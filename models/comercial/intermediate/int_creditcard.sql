with 
    pessoacartao as (
        select *
        from {{ ref('stg_erp_personcreditcard') }}
    )

    , cartao as (
        select *
        from {{ ref('sgt_erp_creditcard') }}
    )

    , joneid as (
        select 
            pessoacartao.PK_PESSOA_CARTAO
            , cartao.PK_CARTAO
            , cartao.TIPO_CARTAO
            , cartao.NUMERO_CARTAO
            , cartao.MES_EXPIRACAO
            , cartao.ANO_EXPIRACAO
        from pessoacartao
        left join cartao on pessoacartao.fk_cartao = cartao.pk_cartao
    )

select *
from joneid
