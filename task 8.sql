create database task8;
use task8;
create table Customers (
    CustomerID int auto_increment primary key,
    CustomerName varchar(100),
    Email varchar(100),
    City varchar(50),
    TotalOrders int default 0,
    IsActive boolean default true );

# procedure 1
delimiter $$
create procedure AddCustomer(
	in p_name varchar(100),
    in p_email varchar(20),
    in p_city varchar(15)
)
begin
	insert into Customers (CustomerName, Email, City)
    values (p_name, p_email, p_city);
end $$
delimiter ;

#query 1
call AddCustomer('Diya Menghani', 'diya@mail.com', 'Delhi');
call AddCustomer('Ananya Sharma', 'ananya@mail.com', 'Jaipur');
call AddCustomer('Rohit Verma', 'rohit@mail.com', 'Mumbai');

select * from Customers;

#----------------------------------------------------------------------------------------------------

# procedure 2
delimiter $$
create procedure UpdateCustomerCity(
    in p_customer_id int,
    in p_new_city varchar(50)
)
begin
    update Customers
    set City = p_new_city
    where CustomerID = p_customer_id;
end $$
delimiter ;

#query 2
call UpdateCustomerCity(2, "Goa");

select * from Customers;

#---------------------------------------------------------------------------------------------------------------

# procedure 3
delimiter $$
create procedure UpdateTotalOrders(
		in p_id int,
        in p_orders int
)
begin
	update Customers
    set TotalOrders = p_orders
    where CustomerId = p_id;
end $$
delimiter ; 

#query 3 
call UpdateTotalOrders(1, "50");
call UpdateTotalOrders(2, "120");
call UpdateTotalOrders(3, "250");

select * from Customers;

#-------------------------------------------------------------------------------------------------------------

# procedure 4
delimiter $$
create procedure CountCustomersByCity(
    in p_city varchar(50),
    out p_total int
)
begin
    select count(*) into p_total
    from Customers
    where City = p_city;
end $$
delimiter ;

#query 4
call CountCustomersByCity ("Delhi", @count);
select @count;

#-------------------------------------------------------------------------------------------------------------------

# procedure 5
delimiter $$
create procedure AddUniqueCustomer(
    in p_name varchar(100),
    in p_email varchar(100),
    in p_city varchar(50)
)
begin
    if not exists (select 1 from Customers where Email = p_email) then
        insert into Customers (CustomerName, Email, City)
        values (p_name, p_email, p_city);
	else 
		select 'Customer with this email already exists' as Message;
    end if;
 end $$
delimiter ;

#query 5
call AddUniqueCustomer('Diya Menghani', 'diya@mail.com', 'Delhi');
call AddUniqueCustomer('Ishan Menghani', 'ishan@mail.com', 'Pushkar');

select * from Customers;

#-----------------------------------------------------------------------------------------------------------------

# procedure 6
delimiter $$
create procedure GetLoyaltyStatus(
    in p_customer_id int,
    out p_status varchar(20)
)
begin
    declare order_count int;
    select TotalOrders into order_count
    from Customers
    where CustomerID = p_customer_id;
    case
        when order_count >= 200 then set p_status = 'Platinum';
        when order_count >= 100 then set p_status = 'Gold';
        when order_count >= 50 then set p_status = 'Silver';
        else set p_status = 'Bronze';
    end case;
end $$
delimiter ;
 
#query 6
call GetLoyaltyStatus(1, @status);
select @status;

call GetLoyaltyStatus(4, @status);
select @status;

#-----------------------------------------------------------------------------------------------------------

# function 1
delimiter $$
create function GetDiscountedPrice(
    original_price decimal(10,2),
    discount_percent decimal(5,2)
)
returns decimal(10,2)
deterministic
begin
    return original_price - (original_price * discount_percent / 100);
end $$
delimiter ;

#query 7
select GetDiscountedPrice(1000, 20); 

#query 8
select CustomerName, TotalOrders, GetDiscountedPrice(500, TotalOrders) as OfferPrice
from Customers;

#-----------------------------------------------------------------------------------------------------------------

# function 2
delimiter $$
create function CustomerEngagementScore(
	order_count int,
    active_status boolean
)
returns decimal(10,2)
deterministic 
begin
	return order_count * if(active_status, 1.5, 1.0);
end $$
delimiter ;

#query 9
select CustomerName, TotalOrders, IsActive, CustomerEngagementScore(TotalOrders, IsActive) as Engagement
from Customers order by Engagement desc;

#------------------------------------------------------------------------------------------------------------
