view: inventory_items {
  sql_table_name: dbo.inventory_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }
  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }
  dimension: sold_at {
    type: string
    sql: ${TABLE}.sold_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id, products.id, products.item_name]
  }
}
