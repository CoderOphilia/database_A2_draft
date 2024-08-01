CREATE DATABASE CSIS2300A2;
USE CSIS2300A2;

-- Drop dependent tables first if needed
IF OBJECT_ID('OrderDetails', 'U') IS NOT NULL DROP TABLE OrderDetails;
IF OBJECT_ID('ProductSuppliers', 'U') IS NOT NULL DROP TABLE ProductSuppliers;
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Products', 'U') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID('Suppliers', 'U') IS NOT NULL DROP TABLE Suppliers;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;

-- Q1.1: Create Customers table
CREATE TABLE Customers(
CustomerID INT NOT NULL, 
FIrstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL, 
Email VARCHAR(100) NOT NULL, 
Phone VARCHAR(15) NOT NULL, 
Address VARCHAR(100) NOT NULL, 
City VARCHAR(50) NOT NULL, 
Country VARCHAR(50) NOT NULL, 
SalesRepID INT NOT NULL
);



-- Q1.2: Create Orders table
CREATE TABLE Orders(
OrderID INT NOT NULL, 
CustomerID INT NOT NULL, 
OrderDate DATE NOT NULL, 
Status VARCHAR(50) NOT NULL, 
ShippingDate DATE NULL, 
TotalAmount DECIMAL(10,2) NOT NULL, 
SalesRepID INT NOT NULL);



-- Q1.3: Create Products table
CREATE TABLE Products(
ProductID INT NOT NULL, 
ProductName VARCHAR(50) NOT NULL, 
Category VARCHAR(50) NOT NULL , 
StockQuantity INT NOT NULL, 
Price DECIMAL(10,2) NOT NULL);


-- Q1.4: Create OrderDetails table
CREATE TABLE OrderDetails(
OrderDetailID INT NOT NULL, 
OrderID INT NOT NULL, 
ProductID INT NOT NULL, 
Quantity INT NOT NULL, 
UnitPrice DECIMAL(10,2) NOT NULL);



-- Q1.5: Create Suppliers table
CREATE TABLE Suppliers(
SupplierID INT NOT NULL, 
SupplierName VARCHAR(100) NOT NULL, 
ContactName VARCHAR(50) NOT NULL, 
ContactEmail VARCHAR(100) NOT NULL UNIQUE, 
Phone VARCHAR(15) NOT NULL, 
Country VARCHAR(50) NOT NULL);

-- Q1.6: Create ProductSuppliers table
CREATE TABLE ProductSuppliers(
ProductSupplierID INT NOT NULL, 
ProductID INT NOT NULL, 
SupplierID INT NOT NULL, 
SupplyDate DATE NOT NULL);


-- Insert sample data into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, Country, SalesRepID) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '123-456-7890', '123 Maple St', 'Springfield', 'USA', 2),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '234-567-8901', '456 Oak St', 'Greenville', 'USA', 1),
(3, 'Carol', 'Williams', 'carol.williams@example.com', '345-678-9012', '789 Pine St', 'Riverdale', 'Canada', 3),
(4, 'David', 'Brown', 'david.brown@example.com', '456-789-0123', '101 Elm St', 'Lakeside', 'Canada', 2),
(5, 'Eve', 'Jones', 'eve.jones@example.com', '567-890-1234', '202 Birch St', 'Hilltown', 'USA', 1),
(6, 'Frank', 'Miller', 'frank.miller@example.com', '678-901-2345', '303 Cedar St', 'Mapleton', 'Canada', 3),
(7, 'Grace', 'Davis', 'grace.davis@example.com', '789-012-3456', '404 Walnut St', 'Oakwood', 'USA', 2),
(8, 'Henry', 'Martinez', 'henry.martinez@example.com', '890-123-4567', '505 Willow St', 'Pineville', 'USA', 1),
(9, 'Ivy', 'Garcia', 'ivy.garcia@example.com', '901-234-5678', '606 Cherry St', 'Brookside', 'Canada', 3),
(10, 'Jack', 'Wilson', 'jack.wilson@example.com', '012-345-6789', '707 Poplar St', 'Fairview', 'USA', 2);



-- Insert sample data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, Status, ShippingDate, TotalAmount, SalesRepID) VALUES
(1, 3, '2024-06-01', 'Shipped', '2024-06-05', 150.00, 1),
(2, 5, '2024-06-02', 'Pending', NULL, 200.00, 2),
(3, 7, '2024-06-03', 'Delivered', '2024-06-07', 250.00, 3),
(4, 2, '2024-06-04', 'Cancelled', NULL, 100.00, 2),
(5, 10, '2024-06-05', 'Shipped', '2024-06-10', 300.00, 1),
(6, 4, '2024-06-06', 'Shipped', '2024-06-12', 400.00, 3),
(7, 9, '2024-06-07', 'Pending', NULL, 350.00, 1),
(8, 6, '2024-06-08', 'Delivered', '2024-06-13', 450.00, 2),
(9, 1, '2024-06-09', 'Shipped', '2024-06-14', 500.00, 3),
(10, 8, '2024-06-10', 'Cancelled', NULL, 550.00, 1);


-- Insert sample data into Products
INSERT INTO Products (ProductID, ProductName, Category, StockQuantity, Price) VALUES
(1, 'Tablet', 'Electronics', 100, 299.99),
(2, 'Keyboard', 'Accessories', 300, 29.99),
(3, 'Chair', 'Furniture', 70, 99.99),
(4, 'Desk', 'Furniture', 40, 399.99),
(5, 'Monitor', 'Electronics', 80, 199.99),
(6, 'Headphones', 'Electronics', 200, 89.99),
(7, 'Smartphone', 'Electronics', 150, 499.99),
(8, 'Printer', 'Office Supplies', 60, 149.99),
(9, 'Mouse', 'Accessories', 250, 19.99),
(10, 'Laptop', 'Electronics', 50, 999.99);


-- Insert sample data into OrderDetails
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 10, 1, 999.99),
(2, 2, 6, 4, 199.99),
(3, 3, 4, 2, 29.99),
(4, 4, 9, 3, 19.99),
(5, 5, 5, 4, 199.99),
(6, 6, 7, 1, 499.99),
(7, 7, 8, 2, 149.99),
(8, 8, 3, 1, 99.99),
(9, 9, 10, 1, 999.99),
(10, 10, 2, 3, 29.99);


-- Insert sample data into Suppliers
INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, ContactEmail, Phone, Country) VALUES
(1, 'Tech Supplies Inc.', 'John Doe', 'john.doe@techsupplies.com', '123-456-7890', 'USA'),
(2, 'Office World', 'Jane Smith', 'jane.smith@officeworld.com', '234-567-8901', 'USA'),
(3, 'ElectroGoods Ltd.', 'Robert Johnson', 'robert.johnson@electrogoods.com', '345-678-9012', 'Canada'),
(4, 'Furniture Co.', 'Emily Davis', 'emily.davis@furnitureco.com', '456-789-0123', 'Canada'),
(5, 'Stationery Hub', 'Michael Brown', 'michael.brown@stationeryhub.com', '567-890-1234', 'USA'),
(6, 'Gadgets & More', 'Linda White', 'linda.white@gadgets.com', '678-901-2345', 'USA'),
(7, 'Techie Supplies', 'David Wilson', 'david.wilson@techiesupplies.com', '789-012-3456', 'Canada'),
(8, 'Modern Office', 'Susan Lee', 'susan.lee@modernoffice.com', '890-123-4567', 'USA'),
(9, 'Quick Electronics', 'Daniel Harris', 'daniel.harris@quickelectronics.com', '901-234-5678', 'Canada'),
(10, 'The Furniture Store', 'Jessica Martinez', 'jessica.martinez@furniturestore.com', '012-345-6789', 'USA');


-- Insert sample data into ProductSuppliers
INSERT INTO ProductSuppliers (ProductSupplierID, ProductID, SupplierID, SupplyDate) VALUES
(1, 1, 5, '2024-05-01'),
(2, 2, 1, '2024-05-02'),
(3, 3, 4, '2024-05-03'),
(4, 4, 2, '2024-05-04'),
(5, 5, 3, '2024-05-05'),
(6, 6, 6, '2024-05-06'),
(7, 7, 7, '2024-05-07'),
(8, 8, 8, '2024-05-08'),
(9, 9, 9, '2024-05-09'),
(10, 10, 10, '2024-05-10'),
(11, 1, 3, '2024-05-11'),
(12, 2, 7, '2024-05-12'),
(13, 3, 8, '2024-05-13'),
(14, 4, 5, '2024-05-14'),
(15, 5, 6, '2024-05-15');


--- Adding PRIMARY KEY Constraint to CustomerID column in Customer table
ALTER TABLE Customers
ADD CONSTRAINT PK_Customer_CustomerID PRIMARY KEY(CustomerID);

--- Adding PRIMARY KEY Constraint to OrderID column in Orders table
ALTER TABLE Orders
ADD CONSTRAINT PK_Orders_OrderID PRIMARY KEY(OrderID);

--- Adding PRIMARY KEY Constraint to ProductID column in Products table
ALTER TABLE Products
ADD CONSTRAINT PK_Products_ProductID PRIMARY KEY(ProductID);

--- Adding PRIMARY KEY Constraint to OrderDetailID column in OrderDetail table
ALTER TABLE OrderDetails
ADD CONSTRAINT PK_OrderDetails_OrderDetailID PRIMARY KEY(OrderDetailID);

--- Adding PRIMARY KEY Constraint to SupplierID column in Suppliers table
ALTER TABLE Suppliers
ADD CONSTRAINT PK_Suppliers_SupplierID PRIMARY KEY(SupplierID);

--- Adding PRIMARY KEY Constraint to ProductSupplierID column in ProductSupplier table
ALTER TABLE ProductSuppliers
ADD CONSTRAINT PK_ProductSuppliers_ProductSupplierID PRIMARY KEY(ProductSupplierID);

---Adding FOREIGN KEY Constarint for CustomerID in Orders Table
ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_CustomerID
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID);

---Adding FOREIGN KEY Constarint for OrderID in OrderDetails Table
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_OrderID
FOREIGN KEY(OrderID) REFERENCES Orders(OrderID);

---Adding FOREIGN KEY Constarint for ProductID in OrderDetails Table
ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_ProductID
FOREIGN KEY(ProductID) REFERENCES Products(ProductID);

---Adding FOREIGN KEY Constarint for ProductID in ProductSuppliers Table
ALTER TABLE ProductSuppliers
ADD CONSTRAINT FK_ProductSuppliers_ProductID
FOREIGN KEY(ProductID) REFERENCES Products(ProductID);

---Adding FOREIGN KEY Constarint for SupplierID in ProductSuppliers Table
ALTER TABLE ProductSuppliers
ADD CONSTRAINT FK_ProductSuppliers_SupplierID
FOREIGN KEY(SupplierID) REFERENCES Suppliers(SupplierID);

SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM  OrderDetails;
SELECT * FROM Suppliers;
SELECT * FROM ProductSuppliers;

-- SQLs

-- Q2. Retrieve all orders and their customer information.
--- USING INNER JOIN to get the columns needed from both the tables, matching the ID
SELECT o.OrderID, o.CustomerID , o.OrderDate, o.Status, o.ShippingDate, o.TotalAmount, c.City, o.SalesRepID,
c.CustomerID, c.FIrstName, c.Country ,c.LastName,c.SalesRepID,c.Email,c.Phone,c.Address,c.Country
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID; ---foreign key


-- Q3. List all products that have been ordered at least once.
SELECT DISTINCT p.ProductID , p.ProductName ---products like laptop is repeating, so used DISTINCT
FROM Products p
JOIN OrderDetails o
ON p.ProductID = o.ProductID
ORDER BY p.ProductID ASC; ---arranging the products in ascending order based on the ID


-- Q4. Find orders where the order amount is greater than all orders placed by customer with CustomerID 2.
SELECT o.OrderID, o.CustomerID, o.TotalAmount
FROM Orders o
WHERE o.TotalAmount> ( ----USING nested condition to get the maximum taotal amount of customerID 2
SELECT max(c2.TotalAmount)
FROM Orders c2
WHERE c2.CustomerID = 2
);


-- Q5. Find customers whose total order amount is greater than the average order amount of all customers.
SELECT c.CustomerID, c.FIrstName, c.LastName
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FIrstName, c.LastName ----Should use GROUP BY to make sure that the SQL computes the sum of orders of each customer before applying HAVING clauses
HAVING SUM(o.TotalAmount) > (  ---Should not use WHERE while using SUM and AVG, use HAVING instead
SELECT AVG(o2.TotalAmount)
FROM Orders o2
);


-- Q6. List the names of suppliers who supply products in the "Electronics" category.
SELECT DISTINCT s.SupplierName
FROM Suppliers s
JOIN ProductSuppliers ps
ON s.SupplierID = ps.SupplierID
JOIN Products p
ON ps.ProductID = p.ProductID
WHERE p.Category = 'Electronics';







