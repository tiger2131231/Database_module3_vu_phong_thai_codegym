CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

-- Bảng Customer
CREATE TABLE Customer (
    cID INT PRIMARY KEY,
    Name VARCHAR(25),
    cAge TINYINT
);

-- Bảng Order
CREATE TABLE `Order` (
    oID INT PRIMARY KEY,
    cID INT,
    oDate DATETIME,
    oTotalPrice INT,
    FOREIGN KEY (cID) REFERENCES Customer(cID)
);

-- Bảng Product
CREATE TABLE Product (
    pID INT PRIMARY KEY,
    pName VARCHAR(25),
    pPrice INT
);

-- Bảng OrderDetail
CREATE TABLE OrderDetail (
    oID INT,
    pID INT,
    odQTY INT,
    FOREIGN KEY (oID) REFERENCES `Order`(oID),
    FOREIGN KEY (pID) REFERENCES Product(pID)
);

-- Customer
INSERT INTO Customer VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

-- Order
INSERT INTO `Order` VALUES
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);

-- Product
INSERT INTO Product VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

-- OrderDetail
INSERT INTO OrderDetail VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

SELECT oID, oDate, oTotalPrice
FROM `Order`;

SELECT c.Name AS CustomerName, p.pName AS ProductName
FROM Customer c
JOIN `Order` o ON c.cID = o.cID
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID
ORDER BY c.Name;

SELECT c.Name
FROM Customer c
LEFT JOIN `Order` o ON c.cID = o.cID
WHERE o.oID IS NULL;

SELECT 
    o.oID AS OrderID,
    o.oDate AS OrderDate,
    SUM(od.odQTY * p.pPrice) AS TotalPrice
FROM `Order` o
JOIN OrderDetail od ON o.oID = od.oID
JOIN Product p ON od.pID = p.pID
GROUP BY o.oID, o.oDate;

