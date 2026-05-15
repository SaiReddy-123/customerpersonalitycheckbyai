CREATE DATABASE Marketing_ETL_AI;
GO

USE Marketing_ETL_AI;
GO

USE Marketing_ETL_AI;
GO

CREATE TABLE dbo.stg_marketing_campaign (
    ID VARCHAR(50),
    Year_Birth VARCHAR(50),
    Education VARCHAR(100),
    Marital_Status VARCHAR(100),
    Income VARCHAR(50),
    Kidhome VARCHAR(50),
    Teenhome VARCHAR(50),
    Dt_Customer VARCHAR(50),
    Recency VARCHAR(50),
    MntWines VARCHAR(50),
    MntFruits VARCHAR(50),
    MntMeatProducts VARCHAR(50),
    MntFishProducts VARCHAR(50),
    MntSweetProducts VARCHAR(50),
    MntGoldProds VARCHAR(50),
    NumDealsPurchases VARCHAR(50),
    NumWebPurchases VARCHAR(50),
    NumCatalogPurchases VARCHAR(50),
    NumStorePurchases VARCHAR(50),
    NumWebVisitsMonth VARCHAR(50),
    AcceptedCmp3 VARCHAR(50),
    AcceptedCmp4 VARCHAR(50),
    AcceptedCmp5 VARCHAR(50),
    AcceptedCmp1 VARCHAR(50),
    AcceptedCmp2 VARCHAR(50),
    Complain VARCHAR(50),
    Z_CostContact VARCHAR(50),
    Z_Revenue VARCHAR(50),
    Response VARCHAR(50)
);
GO

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'stg_marketing_campaign';

BULK INSERT dbo.stg_marketing_campaign
FROM 'C:\Users\Sai\Downloads\marketing_campaign.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);
GO

select * from stg_marketing_campaign;
