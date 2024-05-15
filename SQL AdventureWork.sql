#Year
SELECT YEAR(OrderDateKey) AS OrderDateKey FROM fact_internet_sales;
SELECT EXTRACT(YEAR FROM OrderDateKey) AS OrderDateKey FROM fact_internet_sales;

# Month number
SELECT MONTH(OrderDateKey) AS MonthNumber FROM fact_internet_sales;


#Month Name 
SELECT MONTHNAME(OrderDateKey) AS MonthName FROM fact_internet_sales;


#Quarter
SELECT 
    CASE 
        WHEN QUARTER(OrderDateKey) = 1 THEN 'Q1'
        WHEN QUARTER(OrderDateKey) = 2 THEN 'Q2'
        WHEN QUARTER(OrderDateKey) = 3 THEN 'Q3'
        WHEN QUARTER(OrderDateKey) = 4 THEN 'Q4'
    END AS Quarter
FROM fact_internet_sales;


#Year Month
SELECT DATE_FORMAT(OrderDateKey, '%Y-%b') AS YearMonth FROM fact_internet_sales;


#Week Day Number
SELECT DAYOFWEEK(OrderDateKey) AS WeekdayNumber FROM fact_internet_sales;

#Week name
SELECT DAYNAME(OrderDateKey) AS WeekdayName FROM fact_internet_sales;


#Financial month
SELECT 
    CONCAT(
        YEAR(OrderDateKey) - IF(MONTH(OrderDateKey) < 4, 1, 0), 
        '-',
        LPAD(
            IF(MONTH(OrderDateKey) < 4, MONTH(OrderDateKey) + 9, MONTH(OrderDateKey) - 3), 
            2, 
            '0'
        )
    ) AS FinancialMonth
FROM fact_internet_sales;


#financial Quarter
SELECT 
    CONCAT(
        YEAR(OrderDateKey) - IF(MONTH(OrderDateKey) < 4, 1, 0), 
        '-Q',
        QUARTER(
            DATE_ADD(OrderDateKey, INTERVAL IF(MONTH(OrderDateKey) < 4, 9, -3) MONTH)
        )
    ) AS FinancialQuarter
FROM fact_internet_sales;


#Sales amount uning the columns(unit price,order quantity,unit discount)
SELECT 
    UnitPrice * OrderQuantity * (1 - UnitPriceDiscountPct) AS SalesAmount
FROM fact_internet_sales;




#Productioncost uning the columns(unit cost ,order quantity)
SELECT 
    UnitPrice * OrderQuantity AS ProductStandardCost
FROM fact_internet_sales;


#profit
SELECT 
    (unitprice * orderquantity * (1 - UnitPriceDiscountPct)) + (productstandardcost * orderquantity) AS Profit
FROM fact_internet_sales;





