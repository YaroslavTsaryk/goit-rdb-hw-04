use mydb ;

select count(1) from order_details od
inner join orders o on od.order_id=o.id
inner join customers cu on o.customer_id=cu.id
inner join products p on od.product_id=p.id
inner join categories ca on p.category_id=ca.id
inner join employees e on o.employee_id=e.employee_id
inner join shippers sh on o.shipper_id=sh.id
inner join suppliers su on p.supplier_id=su.id;

select count(1) from employees e 
left join orders o on o.employee_id=e.employee_id
left join order_details od on od.order_id=o.id
left join products p on od.product_id=p.id
left join categories ca on p.category_id=ca.id
left join customers cu on o.customer_id=cu.id
left join shippers sh on o.shipper_id=sh.id
left join suppliers su on p.supplier_id=su.id;

select count(1) from order_details od
inner join orders o on od.order_id=o.id
inner join customers cu on o.customer_id=cu.id
inner join products p on od.product_id=p.id
inner join categories ca on p.category_id=ca.id
inner join employees e on o.employee_id=e.employee_id
inner join shippers sh on o.shipper_id=sh.id
inner join suppliers su on p.supplier_id=su.id
where e.employee_id > 3 and e.employee_id<= 10;

select ca.name, count(1), avg(od.quantity) from order_details od
inner join orders o on od.order_id=o.id
inner join customers cu on o.customer_id=cu.id
inner join products p on od.product_id=p.id
inner join categories ca on p.category_id=ca.id
inner join employees e on o.employee_id=e.employee_id
inner join shippers sh on o.shipper_id=sh.id
inner join suppliers su on p.supplier_id=su.id
where e.employee_id > 3 and e.employee_id<= 10
group by ca.name;

select ca.name, count(1), avg(od.quantity) from order_details od
inner join orders o on od.order_id=o.id
inner join customers cu on o.customer_id=cu.id
inner join products p on od.product_id=p.id
inner join categories ca on p.category_id=ca.id
inner join employees e on o.employee_id=e.employee_id
inner join shippers sh on o.shipper_id=sh.id
inner join suppliers su on p.supplier_id=su.id
where e.employee_id > 3 and e.employee_id<= 10
group by ca.name
having avg(od.quantity)>21;

select ca.name, count(1), avg(od.quantity) from order_details od
inner join orders o on od.order_id=o.id
inner join customers cu on o.customer_id=cu.id
inner join products p on od.product_id=p.id
inner join categories ca on p.category_id=ca.id
inner join employees e on o.employee_id=e.employee_id
inner join shippers sh on o.shipper_id=sh.id
inner join suppliers su on p.supplier_id=su.id
where e.employee_id > 3 and e.employee_id<= 10
group by ca.name
having avg(od.quantity)>21
order by 2 desc;

select ca.name, count(1), avg(od.quantity) from order_details od
inner join orders o on od.order_id=o.id
inner join customers cu on o.customer_id=cu.id
inner join products p on od.product_id=p.id
inner join categories ca on p.category_id=ca.id
inner join employees e on o.employee_id=e.employee_id
inner join shippers sh on o.shipper_id=sh.id
inner join suppliers su on p.supplier_id=su.id
where e.employee_id > 3 and e.employee_id<= 10
group by ca.name
having avg(od.quantity)>21
order by 2 desc
LIMIT 4 OFFSET 1;