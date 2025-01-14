# ASD Interview Questions

## Instructions

- Fork this repository into your own GitHub account. If you don't have a GitHub account, please create one.
- Commit all your changes to your forked repository, following clean Git commit hygiene.
    - Demonstrate clean Git commit hygiene, following best practices for commit messages and organizing your commits.
    - For guidelines on clean Git commit hygiene, you can refer to [this source](https://cbea.ms/git-commit/).
- Place all your source code files in the `src` folder.
    - For each question, create a file for the solution. e.g. `p1.sql`, `p2.sql`, etc.
- The bonus challenge in each problem is optional but greatly welcomed. You can choose to tackle it if you'd like.
- Include comments in your code to explain your approach, algorithms, and any important details.
- Preferred SQL syntax is PostgreSQL, but you are allowed to use any SQL syntax (e.g. MySQL, SQL server, etc).

## Problems

### Problem 1 - Table Creation (DDL)

Write SQL statements to create the following tables. Subsequent problems that follow will need to use these tables. Provide dummy data insert script for all tables.

**Table: employees**

| Column      | Type     |
|-------------|----------|
| id          | integer  |
| name        | text     |
| position    | text     |
| department  | text     |
| salary      | numeric  |

**Table: sales**

| Column        | Type     |
|---------------|----------|
| order_id      | integer  |
| customer_id   | integer  |
| product_id    | integer  |
| quantity      | integer  |
| sale_date     | date     |

**Table: customers**

| Column        | Type     |
|---------------|----------|
| customer_id   | integer  |
| customer_name | text     |
| city          | text     |

**Table: orders**

| Column        | Type     |
|---------------|----------|
| order_id      | integer  |
| order_date    | date     |
| customer_id   | integer  |
| total_amount  | numeric  |

**Table: inventories**

| Column        | Type     |
|---------------|----------|
| product_id    | integer  |
| product_name  | text     |
| quantity      | integer  |
| price         | numeric  |

**Bonus**: Write additional SQL statements to add constraints such as primary keys and foreign keys, to the created tables.

Note:
- You are allowed to counter propose table design as you see fit when tackling the subsequent problems.
- You are allowed to create additional tables if needed for a more normalized design in the subsequent problems.

### Problem 2 - Retrieve Orders from 'New York'

With reference to tables created in Problem 1, write an SQL query to retrieve the customer names, order dates, and total amounts for all orders placed by customers from the city 'New York'.

**Bonus**: Modify the query to include the average total amount per customer for orders placed in the city 'New York'.

2. SELECT customer.customer_name AS customer_name, orders.order_date, orders.total_amount FROM customer JOIN orders ON customer.customer_id = orders.customer_id WHERE customer.city = 'New York';

### Problem 3 - Sales Analysis

With reference to tables created in Problem 1, write an SQL query to calculate the total quantity sold and the average quantity sold per order.

**Bonus**: Modify the query to include the total sales amount and average sales amount per order.

3. SELECT  orders.order_id, SUM(sales.quantity) AS total_quantity_sold, AVG(sales.quantity) AS average_quantity_per_order FROM orders orders JOIN sales sales ON orders.order_id = sales.order_id GROUP BY orders.order_id;

### Problem 4 - Update Product Price

With reference to tables created in Problem 1, write an SQL query to update the price of a specific product by specifying the `product_id`.

**Bonus**: Modify the query to update the price of all products by increasing it by 10%.

4. UPDATE inventories SET price = 2000.00 WHERE product_id = '2';
UPDATE inventories SET price = price * 1.10;

### Problem 5 - Department Statistics

With reference to tables created in Problem 1, write an SQL query to calculate the average salary for each department.

**Bonus**: Modify the query to calculate the highest salary for each department and retrieve the department name, highest salary, and the employee(s) with that salary.

5. SELECT AVG(salary) AS average_salary FROM employees;

### Problem 6 - Retrieve Employees with High Salary

With reference to tables created in Problem 1, write an SQL query to retrieve the names and positions of all employees with a salary greater than $50,000.

**Bonus**: Modify the query to retrieve the names, positions, and salaries of the top three highest-paid employees.

6. SELECT name, position FROM employees WHERE salary > 50000;

### Problem 7 - Delete Customer

With reference to the tables created in Problem 1, write an SQL statement to delete a specific customer. You can specify the customer to delete by their `customer_id`.

**Bonus**: Modify the query to delete any related records associated with the customer being deleted to maintain data integrity.

7. DELETE FROM customer WHERE customer_id = '12';

### Problem 8 - Query Performance Optimization

Consider the following SQL query:

```sql
SELECT *
FROM employees
WHERE department = 'Sales' AND salary > 50000;
```

With reference to the tables created in Problem 1, analyze the query and propose an index or indexes that can significantly improve its performance.

Explain your reasoning behind choosing the specific column(s) for the index(es) and how they would enhance the execution of the query. Consider the selectivity of the columns, the order of the conditions, and any other factors that may impact the query performance.

**Bonus**: Discuss any potential trade-offs or drawbacks of implementing the suggested index(es), such as increased storage space or impact on write operations.

8. CREATE INDEX index_department_salary ON employees (department, salary);
A composite index allows the database to quickly locate relevant rows based on the combined conditions. Without the index, the database might need to perform a full table scan to evaluate all rows. With the index, the query engine can directly navigate to the relevant rows which can reduce the search space.
