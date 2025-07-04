# Internship Task 8: Stored Procedures and Functions 

## Objective
To design and implement **modular and reusable SQL logic** using Stored Procedures and User-Defined Functions (UDFs), while learning how to use parameters, conditional logic, and return values in MySQL.


## Tools Used
- **MySQL Workbench** – for writing and executing SQL queries


## Key Concepts Covered
- Creating **Stored Procedures** with 'IN' and 'OUT' parameters
- Using **conditional logic** with 'IF' and 'CASE' blocks
- Creating **User-Defined Functions** that return single values
- Executing SQL queries modularly and cleanly
- Writing **reusable** and **business-relevant logic** with SQL


## Files Included

|               File                |                      Description                   |
|-----------------------------------|----------------------------------------------------|
|           'task 8.sql'            | All SQL queries, procedures, and functions         |
|       'task 8 outputs.docx'       | Screenshots of procedure and function outputs      |
|           'task 8.pdf'            | Task instructions and objectives (from internship) |
|        'Queries Performed'        | Queries Performed in SQL for the given task        |



## Stored Procedures Created

### 1. 'AddCustomer(p_name, p_email, p_city)'
Adds a new customer into the 'Customers' table.

### 2. 'UpdateCustomerCity(p_customer_id, p_new_city)'
Updates the city of an existing customer by ID.

### 3. 'UpdateTotalOrders(p_id, p_orders)'
Updates the total number of orders for a customer.

### 4. 'CountCustomersByCity(p_city, OUT p_total)'
Returns the number of customers in a given city using an OUT parameter.

### 5. 'AddUniqueCustomer(p_name, p_email, p_city)'
Adds a customer 'only if' their email doesn’t already exist - uses 'IF NOT EXISTS'

### 6. 'GetLoyaltyStatus(p_customer_id, OUT p_status)'
Assigns loyalty status (Platinum/Gold/Silver/Bronze) using a 'CASE' statement based on 'TotalOrders'.


## Functions Created

### 1. 'GetDiscountedPrice(original_price, discount_percent)'
Returns the final price after applying the discount percentage.

### 2. 'CustomerEngagementScore(order_count, active_status)'
Calculates a customer engagement score:
> 'TotalOrders × 1.5' if active, else 'TotalOrders × 1.0'


## Key Learnings & Insights
- Understood the **difference between procedures and functions**
- Learned to use **IN, OUT parameters** in procedures
- Applied real-world logic using **IF** and **CASE**
- Gained confidence in writing **reusable SQL logic**
- Built functions useful for **analytics** and **scoring**
- Used modular queries for better readability and maintainability


## Submission & Documentation
- All code is available in 'task 8.sql'
- All outputs captured in 'task 8 outputs.docx'
- Task guidelines included as 'task 8.pdf'
- Queries Performed for the task completion are available in 'Queries Performed'.


## Connect With Me
**Diya Menghani**  
[LinkedIn Profile](https://www.linkedin.com/in/diya-menghani-ab409031a/)

---

