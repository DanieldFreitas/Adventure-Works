with 
    fonte_subcategoria_produto as (
        select *
        from {{ source('erp_adventure-works', 'PRODUCTSUBCATEGORY') }}
    )

    , renomeacao as (
        select 
        cast (PRODUCTSUBCATEGORYID as int) as pk_subcategoria_produto
        , cast (PRODUCTCATEGORYID as int ) as fk_categoria
        , cast (NAME as varchar) as nome_subcategoria_produto
        from fonte_subcategoria_produto
    )

select * 
from renomeacao   