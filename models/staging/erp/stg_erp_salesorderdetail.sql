with 
    venda_detalhe as (
        select *
        from {{ source('erp_adventure-works', 'SALESORDERDETAIL') }}
    )

    , renomeacao as (
        select 
        SALESORDERID::string || '-' || PRODUCTID::string as pk_pedido_item
        , cast(SALESORDERID as int) as fk_pedido
        , cast(PRODUCTID as int) as fk_produto
        , cast(SPECIALOFFERID as int) as oferta_especial
        , cast(UNITPRICE as int) as preco_unitario
        from venda_detalhe
    )
select *
from renomeacao

