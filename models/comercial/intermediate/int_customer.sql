with
    customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )

    , person as (
        select * 
        from {{ ref('stg_erp_person') }}
    )

    ,joneid as (
        select 
        customer.PK_CLIENTE
        , customer.FK_LOJA
        , customer.FK_TERRITORIO
        , customer.DATA_MODIFICADA
        , person.PESSOA_FULL_NAME
        , person.EMAIL_PROMOCIONAL
        from customer
        left join person on person.pk_pessoa = customer.FK_PESSOA
    )

select *
from joneid
