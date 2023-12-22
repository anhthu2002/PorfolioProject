/*
Sales 2019 in United States

Skills used:  Aggregate Functions, Converting Data Types, String Mnipulation, Datetime Extraction

*/

SELECT * FROM Sales2019

------------------------------------PRODUCT-----------------------------------------------------------
-----Co bao nhieu san pham duoc ban ra-
select Product, sum(cast([Quantity Ordered] as int)) as SoLuongBanRa
from Sales2019
group by product
order by 2 desc

-----San pham nao mang ve doanh thu cao nhat
select Product, SUM(CAST([Quantity Ordered] AS INT) * CAST([Price Each] AS FLOAT)) AS Doanhthu
from Sales2019
group by Product
order by 2 desc 



--------------------------------------DOANH THU----------------------------------------
-------Tong doanh thu nam 2019
SELECT  SUM(CAST([Quantity Ordered] as int) * CAST([Price Each] as float)) AS Doanhthu
FROM Sales2019


-------Tong doanh thu theo thang 
SELECT
    MONTH(CAST([Order Date] AS DATETIME)) AS Thang,
    SUM(CAST([Quantity Ordered] AS INT) * CAST([Price Each] AS FLOAT)) AS Doanhthu
FROM 
    Sales2019
GROUP BY 
    MONTH(CAST([Order Date] AS DATETIME))
Order by Thang


------------------------------------------------DATE TIME ----------------------------------------------------------
-------Thang ban duoc nhieu san pham nhat 
select Month(cast([Order Date] as datetime)) as Thang,
		Sum(cast([Quantity Ordered] as int)) as SLBan
from Sales2019
group by Month(cast([Order Date] as datetime))
order by 2 desc

-------Thoi gian dat hang nhieu nhat
select 
    datepart(hour, cast([Order Date] as datetime)) AS Gio,
    count(*) AS SoLanDatHang
from 
    Sales2019
group by
    datepart(hour, cast([Order Date] as datetime))
order by
    SoLanDatHang DESC


-----------------------------------------KHU VUC---------------------------------------------
--Xem tinh hinh mua hang cua khu vuc Los Angeles
select Product, Sum(cast([Quantity Ordered] as int)) SLBan
from Sales2019
where [Purchase Address] like '%Los Angeles%'
group by Product
order by 2 desc

--Khu vuc mua hang nhieu nhat
SELECT
    SUBSTRING([Purchase Address], CHARINDEX(',', [Purchase Address]) + 2, CHARINDEX(',', [Purchase Address], 
	CHARINDEX(',', [Purchase Address]) + 1) - CHARINDEX(',', [Purchase Address]) - 2) AS KhuVuc,
    COUNT(*) AS SoLuongDatHang
FROM Sales2019
GROUP BY SUBSTRING([Purchase Address], CHARINDEX(',', [Purchase Address]) + 2, CHARINDEX(',', [Purchase Address], 
		CHARINDEX(',', [Purchase Address]) + 1) - CHARINDEX(',', [Purchase Address]) - 2)
ORDER BY 
    SoLuongDatHang DESC



select * from Sales2019 
--Phan nhom 
select Product,count(Product) over (partition by(Product)) as SP
from Sales2019
group by Product


