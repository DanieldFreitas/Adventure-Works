with 
    endereco as (
        select * 
        from {{ ref('sgt_erp_address') }}
    )

    , provincia as (
        select * 
        from {{ ref('sgt_erp_stateprovince') }}
    )

    , territorio as (
        select *
        from {{ ref('sgt_erp_salesterritory') }}
    )

    , joneid as (
        select 
         endereco.PK_ENDERECO
        , provincia.PK_PROVINCIA
        , territorio.PK_TERRITORIO
        , endereco.NOME_ENDERECO
        , endereco.CIDADE
        , endereco.CODIGO_POSTAL

        , provincia.CODIGO_PROVINCIA
        , provincia.CODIGO_REGIAO
        , provincia.NOME_ESTADO
  
        , territorio.NOME_TERRITORIO
        , territorio.CODIGO_PAIS
        , territorio.VENDA_ACUMULADA
        , territorio.VENDA_ULTIMO_ANO
        from endereco
        join provincia on endereco.fk_provincia = provincia.pk_provincia
        left join territorio on provincia.fk_territorio = territorio.pk_territorio
    )

select * 
from joneid

