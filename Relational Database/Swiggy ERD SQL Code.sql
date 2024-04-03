CREATE DATABASE SWIGGY;
USE SWIGGY;
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Username VARCHAR(255),
    Email VARCHAR(255),
    Phone_Number VARCHAR(20),
    Address TEXT,
    Password VARCHAR(255)
);

CREATE TABLE Restaurant (
    RestaurantID INT PRIMARY KEY,
    Name VARCHAR(255),
    Location TEXT,
    Cuisine_Type VARCHAR(255),
    Rating DECIMAL(3, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    UserID INT,
    RestaurantID INT,
    Total_Amount DECIMAL(10, 2),
    Order_Status VARCHAR(50),
    Order_Date DATETIME,
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RestaurantID) REFERENCES Restaurant(RestaurantID)
);

CREATE TABLE Delivery (
    DeliveryID INT PRIMARY KEY,
    OrderID INT,
    Delivery_ExecutiveID INT,
    Estimated_Delivery_Time DATETIME,
    Delivery_Status VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    OrderID INT,
    Amount DECIMAL(10, 2),
    Payment_Method VARCHAR(50),
    Payment_Status VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);

CREATE TABLE Item (
    ItemID INT PRIMARY KEY,
    OrderID INT,
    Name VARCHAR(255),
    Quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
);





