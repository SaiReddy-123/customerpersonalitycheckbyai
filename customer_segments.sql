SELECT 
    Segment_Name,
    COUNT(*) AS Customers,
    AVG(Income) AS Avg_Income,
    AVG(Total_Spending) AS Avg_Spending
FROM dbo.customer_segments
GROUP BY Segment_Name;