WITH 
    ordens AS (
        SELECT *
        FROM {{ ref('stg_erp_salesorderheader') }}
    ),
    
    pedido_item AS (
        SELECT *
        FROM {{ ref('stg_erp_salesorderdetail') }}
    ),

    joneid AS (
        SELECT 
            pedido_item.pk_pedido_item,
             pedido_item.FK_PRODUTO,
             ordens.FK_CLIENTE,
             ordens.FK_VENDEDOR,
             ordens.FK_TERRITORIO,
             ordens.FK_FATURA,       
             ordens.FK_ENVIO,
             ordens.FK_CARTAO,
             ordens.DATA_PEDIDO,
             ordens.DATA_VENCIMENTO_PEDIDO,
             ordens.DATA_ENVIO_PEDIDO,
             pedido_item.OFERTA_ESPECIAL,
             pedido_item.PRECO_UNITARIO,
             ordens.NUMERO_CONTA,
             ordens.CODGIO_CARTAO,
             ordens.TAXA_MOEDA,
             ordens.SUB_TOTAL,
             ordens.IMPOSTO,
             ordens.VALOR_FRETE,
             ordens.TOTAL_PEDIDO
        FROM pedido_item
        JOIN ordens ON ordens.pk_pedido = pedido_item.FK_PEDIDO
    )

    , metricas AS (
        SELECT *  
            , (TOTAL_PEDIDO - VALOR_FRETE) / PRECO_UNITARIO AS QUANTIDADE
            , QUANTIDADE * preco_unitario as valor_bruto
            , VALOR_FRETE / (count(*) over(PARTITION by TOTAL_PEDIDO)) as frete_rateado
        FROM joneid
    ) 

    , final_select as (
        select 
             FK_PRODUTO,
             FK_CLIENTE,
             FK_VENDEDOR,
             FK_TERRITORIO,
             FK_FATURA,
             FK_ENVIO,
             FK_CARTAO,
             DATA_PEDIDO,
             DATA_VENCIMENTO_PEDIDO,
             DATA_ENVIO_PEDIDO      ,
             OFERTA_ESPECIAL,
             PRECO_UNITARIO,
             NUMERO_CONTA,
             CODGIO_CARTAO,
             TAXA_MOEDA,
             SUB_TOTAL,
             IMPOSTO,
             TOTAL_PEDIDO,
             QUANTIDADE,
             VALOR_BRUTO,
             FRETE_RATEADO
        from metricas 
    )
   
SELECT *
FROM metricas
