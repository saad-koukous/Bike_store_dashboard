SELECT ord.order_id, 
concat(cus.first_name,' ',cus.last_name) as full_name,
cus.city,
cus.state,
ord.order_date,
sum(ite.quantity) as total_units,
sum(ite.quantity * ite.list_price) as revenue,
pro.product_name,
cat.category_name,
str.store_name,
concat(sta.first_name,' ',sta.last_name) as sales_res

FROM sales.orders ord
join sales.customers cus
on ord.customer_id = cus.customer_id

join sales.order_items ite
on  ord.order_id = ite.order_id

join production.products pro
on ite.product_id = pro.product_id

join production.categories cat 
on pro.category_id = cat.category_id

join sales.stores str
on ord.store_id = str.store_id

join sales.staffs sta
on ord.staff_id = sta.staff_id


group by 
ord.order_id, 
full_name,
cus.city,
cus.state,
ord.order_date,
pro.product_name,
cat.category_name,
str.store_name,
sales_res
order by 
order_id
-- left join production.categories on production.brands.brand_id=production.categories.category_id;
-- select * from production.products;