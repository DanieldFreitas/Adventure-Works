with
    motivo_venda as (
        select * 
        from {{ ref('sgt_erp_salesreason') }}
    ),
    ordem_motivo_venda as (
        select *
        from {{ ref('sgt_erp_salesorderheadersalesreason') }}
    ),
    joneid as (
        select 
            motivo_venda.PK_MOTIVOVENDA,
            motivo_venda.TIPO_VENDA,
            motivo_venda.NOME_LOJA,
            ordem_motivo_venda.FK_ORDEMVENDA
        from motivo_venda
        full outer join ordem_motivo_venda 
        on motivo_venda.PK_MOTIVOVENDA = ordem_motivo_venda.FK_MOTIVOVENDA
    )
select 
    TIPO_VENDA,
    MIN(NOME_LOJA) as NOME_LOJA, -- Escolhe um nome de loja (menor valor alfabético)
    LISTAGG(FK_ORDEMVENDA, ', ') WITHIN GROUP (ORDER BY FK_ORDEMVENDA) as FK_ORDEMVENDAS -- Concatena as FKs
from joneid
group by 
    TIPO_VENDA
order by 
    TIPO_VENDA
