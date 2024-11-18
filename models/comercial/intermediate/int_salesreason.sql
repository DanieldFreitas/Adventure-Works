with
    motivo_venda as (
        select * 
        from {{ ref('sgt_erp_salesreason') }}
    )
    , ordem_motivo_venda as (
        select *
        from {{ ref('sgt_erp_salesorderheadersalesreason') }}
    )

    , joneid as (
        select 
        motivo_venda.PK_MOTIVOVENDA
          , motivo_venda.NOME_LOJA
          , motivo_venda.TIPO_VENDA
          , ordem_motivo_venda.FK_ORDEMVENDA
        from motivo_venda
        join ordem_motivo_venda on motivo_venda.pk_motivovenda = ordem_motivo_venda.fk_motivovenda
    )

select *
from joneid 
