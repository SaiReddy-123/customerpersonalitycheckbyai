CREATE TABLE dbo.clean_marketing_customer (
    ID INT,
    Year_Birth INT,
    Age INT,
    Education VARCHAR(100),
    Marital_Status VARCHAR(100),
    Income FLOAT,
    Kidhome INT,
    Teenhome INT,
    Total_Children INT,
    Dt_Customer DATE,
    Customer_Tenure_Days INT,
    Recency INT,
    MntWines INT,
    MntFruits INT,
    MntMeatProducts INT,
    MntFishProducts INT,
    MntSweetProducts INT,
    MntGoldProds INT,
    Total_Spending INT,
    NumDealsPurchases INT,
    NumWebPurchases INT,
    NumCatalogPurchases INT,
    NumStorePurchases INT,
    Total_Purchases INT,
    NumWebVisitsMonth INT,
    AcceptedCmp1 INT,
    AcceptedCmp2 INT,
    AcceptedCmp3 INT,
    AcceptedCmp4 INT,
    AcceptedCmp5 INT,
    Total_Campaigns_Accepted INT,
    Complain INT,
    Response INT
);
GO
INSERT INTO dbo.clean_marketing_customer
SELECT
    TRY_CAST(ID AS INT) AS ID,
    TRY_CAST(Year_Birth AS INT) AS Year_Birth,
    YEAR(GETDATE()) - TRY_CAST(Year_Birth AS INT) AS Age,
    Education,
    Marital_Status,
    TRY_CAST(Income AS FLOAT) AS Income,
    TRY_CAST(Kidhome AS INT) AS Kidhome,
    TRY_CAST(Teenhome AS INT) AS Teenhome,
    TRY_CAST(Kidhome AS INT) + TRY_CAST(Teenhome AS INT) AS Total_Children,

    TRY_CONVERT(DATE, Dt_Customer, 105) AS Dt_Customer,

    DATEDIFF(
        DAY,
        TRY_CONVERT(DATE, Dt_Customer, 105),
        GETDATE()
    ) AS Customer_Tenure_Days,

    TRY_CAST(Recency AS INT) AS Recency,
    TRY_CAST(MntWines AS INT) AS MntWines,
    TRY_CAST(MntFruits AS INT) AS MntFruits,
    TRY_CAST(MntMeatProducts AS INT) AS MntMeatProducts,
    TRY_CAST(MntFishProducts AS INT) AS MntFishProducts,
    TRY_CAST(MntSweetProducts AS INT) AS MntSweetProducts,
    TRY_CAST(MntGoldProds AS INT) AS MntGoldProds,

    TRY_CAST(MntWines AS INT)
        + TRY_CAST(MntFruits AS INT)
        + TRY_CAST(MntMeatProducts AS INT)
        + TRY_CAST(MntFishProducts AS INT)
        + TRY_CAST(MntSweetProducts AS INT)
        + TRY_CAST(MntGoldProds AS INT) AS Total_Spending,

    TRY_CAST(NumDealsPurchases AS INT) AS NumDealsPurchases,
    TRY_CAST(NumWebPurchases AS INT) AS NumWebPurchases,
    TRY_CAST(NumCatalogPurchases AS INT) AS NumCatalogPurchases,
    TRY_CAST(NumStorePurchases AS INT) AS NumStorePurchases,

    TRY_CAST(NumDealsPurchases AS INT)
        + TRY_CAST(NumWebPurchases AS INT)
        + TRY_CAST(NumCatalogPurchases AS INT)
        + TRY_CAST(NumStorePurchases AS INT) AS Total_Purchases,

    TRY_CAST(NumWebVisitsMonth AS INT) AS NumWebVisitsMonth,

    TRY_CAST(AcceptedCmp1 AS INT) AS AcceptedCmp1,
    TRY_CAST(AcceptedCmp2 AS INT) AS AcceptedCmp2,
    TRY_CAST(AcceptedCmp3 AS INT) AS AcceptedCmp3,
    TRY_CAST(AcceptedCmp4 AS INT) AS AcceptedCmp4,
    TRY_CAST(AcceptedCmp5 AS INT) AS AcceptedCmp5,

    TRY_CAST(AcceptedCmp1 AS INT)
        + TRY_CAST(AcceptedCmp2 AS INT)
        + TRY_CAST(AcceptedCmp3 AS INT)
        + TRY_CAST(AcceptedCmp4 AS INT)
        + TRY_CAST(AcceptedCmp5 AS INT) AS Total_Campaigns_Accepted,

    TRY_CAST(Complain AS INT) AS Complain,
    TRY_CAST(Response AS INT) AS Response
FROM dbo.stg_marketing_campaign
WHERE TRY_CAST(ID AS INT) IS NOT NULL;
GO

SELECT TOP 10 *
FROM dbo.clean_marketing_customer;

SELECT 
    SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS missing_income,
    SUM(CASE WHEN Dt_Customer IS NULL THEN 1 ELSE 0 END) AS missing_date,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_age
FROM dbo.clean_marketing_customer;

DELETE FROM dbo.clean_marketing_customer
WHERE Age > 100 OR Age < 18;

UPDATE dbo.clean_marketing_customer
SET Income = (
    SELECT AVG(Income)
    FROM dbo.clean_marketing_customer
    WHERE Income IS NOT NULL
)
WHERE Income IS NULL;

CREATE VIEW dbo.vw_customer_clustering AS
SELECT
    ID,
    Age,
    Income,
    Total_Children,
    Recency,
    Customer_Tenure_Days,
    Total_Spending,
    Total_Purchases,
    NumDealsPurchases,
    NumWebPurchases,
    NumCatalogPurchases,
    NumStorePurchases,
    NumWebVisitsMonth,
    Total_Campaigns_Accepted,
    Complain,
    Response,
    Education,
    Marital_Status
FROM dbo.clean_marketing_customer;
GO

SELECT TOP 10 *
FROM dbo.vw_customer_clustering;