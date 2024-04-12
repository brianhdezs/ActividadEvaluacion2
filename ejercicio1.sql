USE master;
GO

-- Verifica si la base de datos existe y suéltala si es necesario
IF DB_ID('TK463DW') IS NOT NULL
    DROP DATABASE TK463DW;
GO

-- Crea la nueva base de datos TK463DW
CREATE DATABASE TK463DW
ON PRIMARY
(NAME = N'TK463DW', FILENAME = N'C:\TK463\TK463DW.mdf',
SIZE = 307200KB , FILEGROWTH = 10240KB )
LOG ON
(NAME = N'TK463DW_log', FILENAME = N'C:\TK463\TK463DW_log.ldf',
SIZE = 51200KB , FILEGROWTH = 10%);
GO

-- Cambia el modelo de recuperación a Simple
ALTER DATABASE TK463DW SET RECOVERY SIMPLE WITH NO_WAIT;
GO


-- Crea la secuencia
USE TK463DW;
GO

IF OBJECT_ID('dbo.SeqCustomerDwKey','SO') IS NOT NULL
    DROP SEQUENCE dbo.SeqCustomerDwKey;
GO

CREATE SEQUENCE dbo.SeqCustomerDwKey AS INT
START WITH 1
INCREMENT BY 1;
GO
