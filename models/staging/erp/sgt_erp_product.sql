with
    fonte_produto as (
        select * 
        from {{ source('erp_adventure-works', 'PRODUCT') }}
    )

    , renomeacao as (
        select 
            cast (PRODUCTID as int) as pk_produto
            , cast (PRODUCTSUBCATEGORYID as int) as fk_subcategoria_produto
            , cast (SELLSTARTDATE as date) as data_inicio_venda
            , cast (NAME as varchar) as nome_produto
            , cast (PRODUCTNUMBER as varchar) as numero_produto        
        from fonte_produto
    )

select *
from renomeacao