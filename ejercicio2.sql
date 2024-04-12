use AdventureWorksDW2012;

-- Crear la dimensión Clientes
CREATE TABLE dbo.Customers
(
    CustomerDwKey INT NOT NULL, -- Clave sustituta
    CustomerKey INT NOT NULL, -- Clave de cliente de AdventureWorksDW2012
    FullName NVARCHAR(150) NULL,
    EmailAddress NVARCHAR(50) NULL,
    BirthDate DATE NULL,
    MaritalStatus NCHAR(1) NULL,
    Gender NCHAR(1) NULL,
    Education NVARCHAR(40) NULL,
    Occupation NVARCHAR(100) NULL,
    City NVARCHAR(30) NULL,
    StateProvince NVARCHAR(50) NULL,
    CountryRegion NVARCHAR(50) NULL,
    Age AS
    CASE
        WHEN DATEDIFF(yy, BirthDate, CURRENT_TIMESTAMP) <= 40 THEN 'Younger'
        WHEN DATEDIFF(yy, BirthDate, CURRENT_TIMESTAMP) > 50 THEN 'Older'
        ELSE 'Middle Age'
    END,
    CurrentFlag BIT NOT NULL DEFAULT 1, -- Indicador de cliente activo
    CONSTRAINT PK_Customers PRIMARY KEY (CustomerDwKey) -- Restricción de clave principal
);

-- Crear la dimensión Productos
CREATE TABLE dbo.Products
(
    ProductDwKey INT NOT NULL, -- Clave sustituta
    ProductKey INT NOT NULL, -- Clave de producto de AdventureWorksDW2012
    ProductName NVARCHAR(255) NULL,
    ProductDescription NVARCHAR(MAX) NULL,
    ProductSubcategory NVARCHAR(50) NULL,
    ProductCategory NVARCHAR(50) NULL,
    Brand NVARCHAR(50) NULL,
    Color NVARCHAR(50) NULL,
    Size NVARCHAR(20) NULL,
    Weight DECIMAL(10,2) NULL,
    StandardCost MONEY NULL,
    ListPrice MONEY NULL,
    ProductLine NVARCHAR(50) NULL,
    ProductClass NVARCHAR(50) NULL,
    Style NVARCHAR(50) NULL,
    ModelName NVARCHAR(50) NULL,
    CONSTRAINT PK_Products PRIMARY KEY (ProductDwKey) -- Restricción de clave principal
);


-- Crear la dimensión Fechas
CREATE TABLE dbo.Dates
(
    DateKey INT NOT NULL, -- Clave de fecha
    FullDate DATE NOT NULL,
    MonthNumberName NVARCHAR(15) NULL,
    CalendarQuarter TINYINT NULL,
    CalendarYear SMALLINT NULL,
    CONSTRAINT PK_Dates PRIMARY KEY (DateKey) -- Restricción de clave principal
);


SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Dates;


