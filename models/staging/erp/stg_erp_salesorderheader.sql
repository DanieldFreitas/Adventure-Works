with 
    fonte_venda as (
        select *
        from {{ source('erp_adventure-works', 'SALESORDERHEADER') }}
    )

    , renomeacao as (
        select 
         cast(SALESORDERID as int) as pk_pedido
        , cast(CUSTOMERID as int) as fk_cliente
        , cast(SALESPERSONID as int) as fk_vendedor
        , cast(TERRITORYID as int) as fk_territorio
        , cast(BILLTOADDRESSID as int) as fk_fatura
        , cast(SHIPTOADDRESSID as int) as fk_envio
        , cast(CREDITCARDID as int) as fk_cartao
        , cast(ORDERDATE as date) as data_pedido
        , cast(DUEDATE as date) as data_vencimento_pedido
        , cast(SHIPDATE as date) as data_envio_pedido
        , cast(ACCOUNTNUMBER as varchar) as numero_conta          
        , cast(CREDITCARDAPPROVALCODE as varchar) as codgio_cartao
        , cast(CURRENCYRATEID as int) as taxa_moeda
        , cast(SUBTOTAL as numeric(18,2)) as sub_total
        , cast(TAXAMT as numeric(18,2)) as imposto
        , cast(FREIGHT as numeric(18,2)) as valor_frete
        , cast(TOTALDUE as numeric(18,2)) as total_pedido
        from fonte_venda
    )

select *
from renomeacao
