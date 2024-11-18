with 
    produto as (
        select * 
        from {{ ref('sgt_erp_product') }}
    )
    , subcategoria_produto as (
        select *
        from {{ ref('sgt_erp_productsubcategory') }}
    )

    , categoria_produto as (
        select *
        from {{ ref('stg_erp_productcategory') }}
    )

    , joneid as (
        select 
            produto.PK_PRODUTO
            , subcategoria_produto.PK_SUBCATEGORIA_PRODUTO
            , categoria_produto.PK_CATEGORIA_PRODUTO
            , produto.DATA_INICIO_VENDA
            , produto.NOME_PRODUTO
            , produto.NUMERO_PRODUTO
            , subcategoria_produto.NOME_SUBCATEGORIA_PRODUTO
            , categoria_produto.NOME_CATEGORIA_PRODUTO
        from produto
        join subcategoria_produto on produto.fk_subcategoria_produto = subcategoria_produto.pk_subcategoria_produto
        join categoria_produto on subcategoria_produto.fk_categoria = categoria_produto.pk_categoria_produto
    )

select *
from joneid


    