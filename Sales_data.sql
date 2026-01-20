CREATE VIEW vw_Sales_Store_Analysis AS
SELECT 
    *,  -- This keeps every single column exactly as it came from Python
    DATENAME(dw, Order_Date) AS Order_Day,   -- Added for the video's Day Trend chart
    DATENAME(mm, Order_Date) AS Order_Month, -- Added for the video's Month Trend chart
    MONTH(Order_Date) AS Month_Number        -- Added to ensure months sort correctly (Jan-Dec)
FROM Superstore_Cleaned_Final;

-----------------------------------------------------------------
--KPI's
--1. Total Revenue (Total Sales)
SELECT CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Revenue
FROM Superstore_Cleaned_Final;

--------------------------------------------
--2. Average Order Value (AOV)
SELECT CAST(SUM(Sales) / COUNT(DISTINCT Order_ID) AS DECIMAL(10,2)) AS Avg_Order_Value 
FROM Superstore_Cleaned_Final;

--3. Total Orders
SELECT COUNT(DISTINCT Order_ID) AS Total_Orders 
FROM Superstore_Cleaned_Final;

---Final Check
SELECT TOP 5 
    Order_Date, 
    DATENAME(dw, Order_Date) AS Day_Name,
    DATENAME(mm, Order_Date) AS Month_Name
FROM Superstore_Cleaned_Final;



