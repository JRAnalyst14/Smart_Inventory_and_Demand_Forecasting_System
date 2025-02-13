-- Create the database
CREATE DATABASE IF NOT EXISTS SmartInventoryDB;
USE SmartInventoryDB;

-- Table: Products
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price > 0),
    current_stock INT NOT NULL CHECK (current_stock >= 0),
    reorder_level INT NOT NULL CHECK (reorder_level >= 0)
);

-- Table: Suppliers
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_number VARCHAR(15),
    email VARCHAR(100)
);

-- Table: Sales
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity_sold INT NOT NULL CHECK (quantity_sold > 0),
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price > 0),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Table: PurchaseOrders
CREATE TABLE PurchaseOrders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    supplier_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity_ordered INT NOT NULL CHECK (quantity_ordered > 0),
    expected_delivery_date DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

-- Table: DemandForecast
CREATE TABLE DemandForecast (
    forecast_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    forecast_date DATE NOT NULL,
    predicted_demand INT NOT NULL CHECK (predicted_demand >= 0),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Products (product_name, category, unit_price, current_stock, reorder_level) VALUES
('Laptop', 'Electronics', 1200.00, 50, 10),
('Smartphone', 'Electronics', 800.00, 100, 20),
('T-Shirt', 'Clothing', 20.00, 200, 50),
('Coffee', 'Grocery', 5.00, 300, 100),
('Headphones', 'Electronics', 100.00, 75, 15),
('Tablet', 'Electronics', 600.00, 60, 12),
('Jeans', 'Clothing', 40.00, 150, 40),
('Milk', 'Grocery', 3.00, 400, 120),
('Keyboard', 'Electronics', 50.00, 80, 20),
('Sneakers', 'Clothing', 60.00, 120, 30),
('Tea', 'Grocery', 4.00, 250, 80),
('Monitor', 'Electronics', 300.00, 30, 5),
('Jacket', 'Clothing', 70.00, 90, 25),
('Bread', 'Grocery', 2.00, 500, 150),
('Mouse', 'Electronics', 25.00, 200, 50),
('Dress', 'Clothing', 50.00, 100, 30),
('Rice', 'Grocery', 10.00, 600, 200),
('Printer', 'Electronics', 200.00, 40, 8),
('Socks', 'Clothing', 10.00, 300, 100),
('Sugar', 'Grocery', 3.00, 400, 120);

INSERT INTO Suppliers (supplier_name, contact_number, email) VALUES
('TechSupplies Inc.', '123-456-7890', 'tech@example.com'),
('FashionWorld Ltd.', '987-654-3210', 'fashion@example.com'),
('GroceryMart LLC', '555-555-5555', 'grocery@example.com'),
('ElectroGadgets', '111-222-3333', 'electro@example.com'),
('ClothingHub', '444-444-4444', 'clothing@example.com'),
('FreshFoods', '777-777-7777', 'fresh@example.com'),
('GlobalTech', '888-888-8888', 'global@example.com'),
('UrbanWear', '999-999-9999', 'urban@example.com'),
('OrganicGoods', '666-666-6666', 'organic@example.com'),
('HomeEssentials', '222-333-4444', 'home@example.com');

INSERT INTO Sales (product_id, sale_date, quantity_sold, total_price) VALUES
(1, '2023-10-01', 5, 6000.00),
(2, '2023-10-02', 10, 8000.00),
(3, '2023-10-03', 20, 400.00),
(4, '2023-10-04', 50, 250.00),
(5, '2023-10-05', 15, 1500.00),
(6, '2023-10-06', 8, 4800.00),
(7, '2023-10-07', 25, 1000.00),
(8, '2023-10-08', 100, 300.00),
(9, '2023-10-09', 12, 600.00),
(10, '2023-10-10', 18, 1080.00),
(11, '2023-10-11', 30, 120.00),
(12, '2023-10-12', 5, 1500.00),
(13, '2023-10-13', 10, 700.00),
(14, '2023-10-14', 200, 400.00),
(15, '2023-10-15', 50, 1250.00),
(16, '2023-10-16', 15, 750.00),
(17, '2023-10-17', 100, 1000.00),
(18, '2023-10-18', 6, 1200.00),
(19, '2023-10-19', 40, 400.00),
(20, '2023-10-20', 60, 180.00),
(1, '2023-10-21', 3, 3600.00),
(2, '2023-10-22', 7, 5600.00),
(3, '2023-10-23', 15, 300.00),
(4, '2023-10-24', 40, 200.00),
(5, '2023-10-25', 10, 1000.00),
(6, '2023-10-26', 5, 3000.00),
(7, '2023-10-27', 20, 800.00),
(8, '2023-10-28', 80, 240.00),
(9, '2023-10-29', 10, 500.00),
(10, '2023-10-30', 15, 900.00),
(11, '2023-10-31', 25, 100.00),
(12, '2023-11-01', 4, 1200.00),
(13, '2023-11-02', 8, 560.00),
(14, '2023-11-03', 150, 300.00),
(15, '2023-11-04', 30, 750.00),
(16, '2023-11-05', 10, 500.00),
(17, '2023-11-06', 80, 800.00),
(18, '2023-11-07', 5, 1000.00),
(19, '2023-11-08', 30, 300.00),
(20, '2023-11-09', 50, 150.00),
(1, '2023-11-10', 6, 7200.00),
(2, '2023-11-11', 12, 9600.00),
(3, '2023-11-12', 25, 500.00),
(4, '2023-11-13', 60, 300.00),
(5, '2023-11-14', 20, 2000.00),
(6, '2023-11-15', 10, 6000.00),
(7, '2023-11-16', 30, 1200.00),
(8, '2023-11-17', 120, 360.00),
(9, '2023-11-18', 15, 750.00),
(10, '2023-11-19', 20, 1200.00),
(11, '2023-11-20', 40, 160.00),
(12, '2023-11-21', 6, 1800.00),
(13, '2023-11-22', 12, 840.00),
(14, '2023-11-23', 250, 500.00),
(15, '2023-11-24', 40, 1000.00),
(16, '2023-11-25', 20, 1000.00),
(17, '2023-11-26', 100, 1000.00),
(18, '2023-11-27', 8, 1600.00),
(19, '2023-11-28', 50, 500.00),
(20, '2023-11-29', 70, 210.00),
(1, '2023-11-30', 4, 4800.00),
(2, '2023-12-01', 8, 6400.00),
(3, '2023-12-02', 18, 360.00),
(4, '2023-12-03', 70, 350.00),
(5, '2023-12-04', 25, 2500.00);

INSERT INTO PurchaseOrders (product_id, supplier_id, order_date, quantity_ordered, expected_delivery_date) VALUES
(1, 1, '2023-10-06', 20, '2023-10-13'),
(2, 1, '2023-10-07', 30, '2023-10-14'),
(3, 2, '2023-10-08', 100, '2023-10-15'),
(4, 3, '2023-10-09', 200, '2023-10-16'),
(5, 1, '2023-10-10', 25, '2023-10-17'),
(6, 4, '2023-10-11', 15, '2023-10-18'),
(7, 5, '2023-10-12', 50, '2023-10-19'),
(8, 3, '2023-10-13', 150, '2023-10-20'),
(9, 1, '2023-10-14', 20, '2023-10-21'),
(10, 5, '2023-10-15', 30, '2023-10-22'),
(11, 6, '2023-10-16', 40, '2023-10-23'),
(12, 4, '2023-10-17', 10, '2023-10-24'),
(13, 5, '2023-10-18', 20, '2023-10-25'),
(14, 3, '2023-10-19', 100, '2023-10-26'),
(15, 1, '2023-10-20', 30, '2023-10-27'),
(16, 5, '2023-10-21', 25, '2023-10-28'),
(17, 6, '2023-10-22', 150, '2023-10-29'),
(18, 4, '2023-10-23', 10, '2023-10-30'),
(19, 5, '2023-10-24', 30, '2023-10-31'),
(20, 3, '2023-10-25', 80, '2023-11-01'),
(1, 1, '2023-10-26', 15, '2023-11-02'),
(2, 1, '2023-10-27', 25, '2023-11-03'),
(3, 2, '2023-10-28', 120, '2023-11-04'),
(4, 3, '2023-10-29', 250, '2023-11-05'),
(5, 1, '2023-10-30', 20, '2023-11-06'),
(6, 4, '2023-10-31', 10, '2023-11-07'),
(7, 5, '2023-11-01', 40, '2023-11-08'),
(8, 3, '2023-11-02', 200, '2023-11-09'),
(9, 1, '2023-11-03', 15, '2023-11-10'),
(10, 5, '2023-11-04', 35, '2023-11-11'),
(11, 6, '2023-11-05', 50, '2023-11-12'),
(12, 4, '2023-11-06', 12, '2023-11-13'),
(13, 5, '2023-11-07', 25, '2023-11-14'),
(14, 3, '2023-11-08', 150, '2023-11-15'),
(15, 1, '2023-11-09', 40, '2023-11-16'),
(16, 5, '2023-11-10', 30, '2023-11-17'),
(17, 6, '2023-11-11', 200, '2023-11-18'),
(18, 4, '2023-11-12', 15, '2023-11-19'),
(19, 5, '2023-11-13', 50, '2023-11-20'),
(20, 3, '2023-11-14', 100, '2023-11-21'),
(1, 1, '2023-11-15', 10, '2023-11-22'),
(2, 1, '2023-11-16', 20, '2023-11-23'),
(3, 2, '2023-11-17', 150, '2023-11-24'),
(4, 3, '2023-11-18', 300, '2023-11-25'),
(5, 1, '2023-11-19', 25, '2023-11-26'),
(6, 4, '2023-11-20', 12, '2023-11-27'),
(7, 5, '2023-11-21', 30, '2023-11-28'),
(8, 3, '2023-11-22', 180, '2023-11-29'),
(9, 1, '2023-11-23', 20, '2023-11-30'),
(10, 5, '2023-11-24', 40, '2023-12-01');

INSERT INTO DemandForecast (product_id, forecast_date, predicted_demand) VALUES
(1, '2023-11-01', 25),
(2, '2023-11-01', 50),
(3, '2023-11-01', 150),
(4, '2023-11-01', 200),
(5, '2023-11-01', 30),
(6, '2023-11-01', 20),
(7, '2023-11-01', 80),
(8, '2023-11-01', 300),
(9, '2023-11-01', 40),
(10, '2023-11-01', 60),
(11, '2023-11-01', 100),
(12, '2023-11-01', 15),
(13, '2023-11-01', 25),
(14, '2023-11-01', 400),
(15, '2023-11-01', 50),
(16, '2023-11-01', 30),
(17, '2023-11-01', 200),
(18, '2023-11-01', 10),
(19, '2023-11-01', 80),
(20, '2023-11-01', 120),
(1, '2023-12-01', 30),
(2, '2023-12-01', 60),
(3, '2023-12-01', 180),
(4, '2023-12-01', 250),
(5, '2023-12-01', 40),
(6, '2023-12-01', 25),
(7, '2023-12-01', 100),
(8, '2023-12-01', 350),
(9, '2023-12-01', 50),
(10, '2023-12-01', 70),
(11, '2023-12-01', 120),
(12, '2023-12-01', 20),
(13, '2023-12-01', 30),
(14, '2023-12-01', 450),
(15, '2023-12-01', 60),
(16, '2023-12-01', 40),
(17, '2023-12-01', 250),
(18, '2023-12-01', 15),
(19, '2023-12-01', 90),
(20, '2023-12-01', 150);

-- Query 1: Calculate total revenue for a specific period (e.g., October 2023)
SELECT SUM(total_price) AS total_revenue
FROM Sales
WHERE sale_date BETWEEN '2023-10-01' AND '2023-10-31';

-- Query 2: Identify products below reorder level
SELECT product_id, product_name, current_stock, reorder_level
FROM Products
WHERE current_stock > reorder_level;

-- Query 3: Find top 5 best-selling products by category
SELECT p.category, p.product_name, SUM(s.quantity_sold) AS total_sold
FROM Products p
INNER JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.category, p.product_name
ORDER BY total_sold DESC
LIMIT 5;

-- Query 4: Calculate average monthly sales for each product
SELECT p.product_name, AVG(s.quantity_sold) AS avg_monthly_sales
FROM Products p
JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_name;

-- Query 5: Find products that have never been sold (using subquery)
SELECT product_id, product_name
FROM Products
WHERE product_id NOT IN (SELECT product_id FROM Sales);

-- Query 6: Predict future demand for each product (based on historical sales)
SELECT p.product_name, df.predicted_demand
FROM Products p
JOIN DemandForecast df ON p.product_id = df.product_id
WHERE df.forecast_date = '2023-11-01';

-- Transaction: Update stock levels after a sale
START TRANSACTION;

-- Insert a new sale
INSERT INTO Sales (product_id, sale_date, quantity_sold, total_price) VALUES
(1, '2023-10-10', 3, 3600.00);

-- Update stock level
UPDATE Products
SET current_stock = current_stock - 3
WHERE product_id = 1;

COMMIT;

-- Create users
CREATE USER 'inventory_manager'@'localhost' IDENTIFIED BY 'manager123';
CREATE USER 'analyst'@'localhost' IDENTIFIED BY 'analyst123';

-- Grant permissions to inventory_manager
GRANT ALL PRIVILEGES ON SmartInventoryDB.* TO 'inventory_manager'@'localhost';

-- Grant read-only permissions to analyst
GRANT SELECT ON SmartInventoryDB.* TO 'analyst'@'localhost';

-- Flush privileges
FLUSH PRIVILEGES;