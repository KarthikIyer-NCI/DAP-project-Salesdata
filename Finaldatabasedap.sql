use DAP;
DESC orders;
alter table orders drop O_CLERK;
commit;
alter table orders drop O_SHIP_PRIORITY;
alter table orders drop O_COMMENT;
commit;

alter table part drop COMMENT;
commit;

alter table partsupp drop PS_COMMENT;
alter table customer drop C_COMMENT;
commit;

    
create table finaldatabasedap as -- (part_key varchar(20), cust_key varchar(20), order_id varchar(20));
select p.PARTKEY as part_key, c.CUSTKEY  as cust_key, o.id as order_id, o.O_ORDER_PRIORITY as order_priority, o.O_ORDERDATE as order_date, 
o.O_ORDERSTATUS as order_status, o.O_TOTALPRICE as order_price, p.NAME as product_name, p.MFGR as manufacturer, p.BRAND as brand,
p.TYPE as product_type, p.SIZE as product_quantity, p.CONTAINER as container, p.RETAILPRICE as retail_price, ps.PS_SUPPLYCOST as supply_cost, 
ps.PS_AVAILQTY as available_quantity, c.C_NAME as customer_name, c.C_ADDRESS as customer_address, c.C_NATIONKEY as customer_nationkey,
c.C_PHONE as customer_phone, c.C_ACCTBAL as customer_balance, c.C_MKTSEGMENT as customer_market_segment

from part p
    join partsupp ps  on  p.PARTKEY = ps.PS_PARTKEY
    join orders o on o.PARTKEY = p.PARTKEY
    join customer c on c.CUSTKEY = o.O_CUSTKEY;
use DAP;
select * from finaldatabasedap;
show tables;
drop table finaldatabase;
show tables;



