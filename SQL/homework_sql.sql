--Query 1: หารายชื่อลูกค้า ชื่อเมืองและประเทศ จาก invoices ที่เกิดขึ้นภายในเดือนมีนาคม ปี2009
SELECT 
  inv.InvoiceDate,
  cust.CustomerId,
  cust.FirstName||' '||cust.LastName AS customer_fullname,
  inv.BillingCity,
  inv.BillingState,
  inv.BillingCountry
FROM invoices AS inv
JOIN customers AS cust
ON inv.CustomerId = cust.CustomerId
WHERE invoicedate BETWEEN '2009-03-01 00:00:00' AND '2009-03-31 23:59:59';


--Query 2: หา invoice ที่ซื้อเพลงของ Eric Clapton โดยใช้ Where เชื่อมโยง Tables
SELECT 
  inv.InvoiceId,
  inv.InvoiceDate,
  invit.TrackId,
  trk.Name AS song_name,
  art.Name AS artist_name
FROM invoices AS inv, 
  invoice_items AS invit, 
  tracks AS trk, 
  albums AS alb, 
  artists AS art
WHERE inv.InvoiceId = invit.InvoiceId
  AND invit.TrackId = trk.TrackId
  AND trk.AlbumId = alb.AlbumId
  AND art.ArtistId = alb.ArtistId
  AND art.Name LIKE 'Eric Clapton';


--Query 3: หารายชื่อลูกค้าที่มียอดซื้อมากที่สุด 5 อันดับแรกในปี 2012
SELECT 
  cust.CustomerId, 
  cust.FirstName||' '||cust.LastName AS customer_fullname,
  cust.Country,
  SUM(inv.Total) AS sum_total,
  STRFTIME('%Y',inv.InvoiceDate) AS year
FROM invoices AS inv
JOIN customers AS cust
ON inv.CustomerId = cust.CustomerId
WHERE year = '2012'
GROUP BY customer_fullname
ORDER BY sum_total DESC
LIMIT 5;


--Query 4: หาชื่อ composer ที่แต่งเพลงเยอะที่สุด 10 อันดับแรก
SELECT 
  Composer,
  COUNT(DISTINCT Name) AS song_num
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer
ORDER BY song_num DESC
Limit 10;


--Query 5:  รายชื่อลูกค้า ที่พนักงานชื่อ Jane Peacock ดูแล เรียงตามชื่อประเทศ
SELECT
  DISTINCT cust.FirstName||' '||cust.LastName AS customer_fullname,
  cust.CustomerId,
  cust.Country,
  cust.SupportRepId,
  emp.FirstName||' '||emp.LastName AS supportrep_fullname
FROM customers AS cust, employees AS emp
WHERE cust.SupportRepId = emp.EmployeeId
  AND supportrep_fullname IN ('Jane Peacock')
ORDER BY cust.Country;
