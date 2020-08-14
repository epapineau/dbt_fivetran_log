with trigger_table as (

    {{ union_source_tables('trigger_table') }}

),

fields as (

    select 
    {% if target.type == 'bigquery' %} 
        table as trigger_table, 
    {% else %} 
        "TABLE" as trigger_table,
    {% endif %}
        transformation_id,
        destination_database
    
    from trigger_table

    where destination_database is not null
)


select * from fields