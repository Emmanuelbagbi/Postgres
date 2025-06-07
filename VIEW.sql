CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    Stock INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Customers VALUES
(1, 'Alice Johnson', 'alice@example.com', '123-456-7890', '123 Main St'),
(2, 'Bob Smith', 'bob@example.com', '987-654-3210', '456 Oak Ave'),
(3, 'Charlie Lee', 'charlie@example.com', '555-123-4567', '789 Pine Rd');

INSERT INTO Products VALUES
(1, 'Laptop', 800.00, 10),
(2, 'Smartphone', 600.00, 15),
(3, 'Tablet', 300.00, 20),
(4, 'Headphones', 50.00, 50),
(5, 'Mouse', 20.00, 100);

INSERT INTO Orders VALUES
(1, 1, '2024-11-01', 1400.00),
(2, 2, '2024-11-02', 600.00),
(3, 3, '2024-11-03', 350.00),
(4, 1, '2024-11-05', 500.00),
(5, 2, '2024-11-06', 400.00);


INSERT INTO OrderItems VALUES
(1, 1, 1, 1, 800.00),
(2, 1, 2, 1, 600.00),
(3, 2, 3, 1, 300.00),
(4, 3, 4, 5, 250.00),
(5, 4, 5, 10, 200.00),
(6, 5, 1, 1, 800.00),
(7, 5, 3, 1, 300.00),
(8, 1, 5, 2, 40.00),
(9, 2, 4, 2, 100.00),
(10, 3, 2, 1, 600.00);

select * from CustomerOrderSummary

CREATE view CustomerOrderSummary As
select C.customerID, C.Fullname,O.orderID,O.totalAmount
from customers C 
JOIN Orders O ON C.CustomerID = O.CustomerID

--CREATE A VIEW NAME CUSTOMER ORDER SUMMARY

--CREATE A VIEW NAMED PRODUCTS 
--CREATE VIEW HIGH VALUE  ORDERS THAT SHOWS THE ORDERID,CUSTOMERID,ORDERDATE AND TOTAL AMOUNT FOR ORDERS WITH A TOTAL VALUE GREATER THAN 500

Create view OrderItemTotalViews as 
select o.OrderID, p.productName, O.Quantity,(O.quantity * p.price) as total_quantity
from OrderItems O join
Products p on o.ProductID = p.ProductID

--CREATE A VIEW FOR ORDER ITEM THE ORDER NAME SHOW

--STOCK PROCEDURE
select * from Customers