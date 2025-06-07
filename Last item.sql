CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

create table UserOrders (
order_id SERIAL PRIMARY KEY,
stock INT,
price DECIMAL (10,2)
)

create table OrderTransactions (
trans_id serial primary key,
order_id int,
CustomerID INT,
amount decimal (10,2),
foreign key(order_id) References userorders(order_id),
foreign key(CustomerID) references customers(CustomerID)
)

INSERT INTO Customers1 VALUES
(1, 'Alice Johnson', 'alice@example.com', '123-456-7890', '123 Main St'),
(2, 'Bob Smith', 'bob@example.com', '987-654-3210', '456 Oak Ave'),
(3, 'Charlie Lee', 'charlie@example.com', '555-123-4567', '789 Pine Rd');

insert into UserOrders (stock, price)
values (1, 3000),(20, 4000)

select * from OrderTransactions
select * from userorders


-- QUESTION
BEGIN;
SELECT stock FROM userorders WHERE order_id = 1 FOR UPDATE;
UPDATE userorders SET stock = stock - 1 WHERE order_id = 1 AND stock >= 1;
INSERT INTO OrderTransactions (order_id, CustomerID, amount)
VALUES (1, 1, 3000);
COMMIT;

BEGIN;
SELECT stock FROM userorders WHERE order_id = 1 FOR UPDATE;
UPDATE userorders SET stock = stock - 1 WHERE order_id = 1 AND stock >= 1;
INSERT INTO OrderTransactions (order_id, CustomerID, amount)
VALUES (1, 2, 3000);
COMMIT;

BEGIN;
SELECT stock FROM userorders WHERE order_id = 1 FOR UPDATE;
UPDATE userorders SET stock = stock - 1 WHERE order_id = 1 AND stock >= 1;
INSERT INTO OrderTransactions (order_id, CustomerID, amount)
VALUES (1, 3, 3000);
COMMIT;





