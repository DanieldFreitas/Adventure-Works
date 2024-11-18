with 
    fonte_person as(
        select *
        from {{ source('erp_adventure-works', 'PERSON') }}
    )

    , renomeacao as (
        select
        cast (BUSINESSENTITYID as int) as pk_pessoa
        , FIRSTNAME || ' ' || MIDDLENAME || ' ' || LASTNAME as pessoa_full_name
        , cast (EMAILPROMOTION as int) as email_promocional
        from fonte_person
    )

select * 
from renomeacao 