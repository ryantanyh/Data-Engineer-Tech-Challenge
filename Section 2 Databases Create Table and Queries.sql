Create table cars
(manufacturer int not null,
 model_name varchar(15) not null,
 serial_number varchar(15)not null primary key,
 weight int not null,
 price int not null);

Create table sales_transaction
(customer_name varchar(30) not null primary key,
 customer_phone varchar(15) not null,
 salesperson varchar(15)not null,
 characteristics_of_car_sold varchar(100) not null,
 serial_number_car varchar(15 not null),
 sales_date date not null);


#1. List of our customrs and their spending
select customer_name, sum(price) 
from cars a inner join sales_transaction b
on a.serial_number =b.serial_number_car
group by customer_name;

#2. Top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month
select top 3 manufacturer, count(serial_number_car)
from cars a inner join sales_transaction b
on a.serial_number = b.serial_number_car
group by manufacturer 
order by count(serial_number_car)
where MONTH(sales_date) = 2;