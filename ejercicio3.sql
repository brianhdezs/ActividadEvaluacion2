CREATE TABLE dbo.InternetSales
(
    InternetSalesKey INT NOT NULL IDENTITY(1,1), -- Clave sustituta con propiedad IDENTITY
    CustomerDwKey INT NOT NULL, -- Clave externa para la dimensión Clientes
    ProductKey INT NOT NULL, -- Clave externa para la dimensión Productos
    DateKey INT NOT NULL, -- Clave externa para la dimensión Fechas
    OrderQuantity SMALLINT NOT NULL DEFAULT 0,
    SalesAmount MONEY NOT NULL DEFAULT 0,
    UnitPrice MONEY NOT NULL DEFAULT 0,
    DiscountAmount FLOAT NOT NULL DEFAULT 0,
    CONSTRAINT PK_InternetSales PRIMARY KEY (InternetSalesKey) -- Restricción de clave principal
);

ALTER TABLE dbo.InternetSales ADD CONSTRAINT
FK_InternetSales_Customers FOREIGN KEY(CustomerDwKey)
REFERENCES dbo.Customers (CustomerDwKey);

ALTER TABLE dbo.InternetSales ADD CONSTRAINT
FK_InternetSales_Products FOREIGN KEY(ProductKey)
REFERENCES dbo.Products (ProductKey);

ALTER TABLE dbo.InternetSales ADD CONSTRAINT
FK_InternetSales_Dates FOREIGN KEY(DateKey)
REFERENCES dbo.Dates (DateKey);

ALTER TABLE dbo.InternetSales DROP CONSTRAINT FK_InternetSales_Customers;

ALTER TABLE dbo.InternetSales ADD CONSTRAINT
FK_InternetSales_Customers_New FOREIGN KEY(CustomerDwKey)
REFERENCES dbo.Customers (CustomerDwKey);

USE AdventureWorksDW2012;
GO
ALTER AUTHORIZATION ON DATABASE::AdventureWorksDW2012 TO sa;
