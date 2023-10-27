-- подзапросы

-- ѕоказать заказы клиентов из ћексики
-- 1
SELECT OrderID, OrderDate, CustomerID
FROM Orders

-- 2 определитиь клиентов из ћексики
SELECT CustomerID
FROM   Customers
WHERE  Country = 'Mexico'

-- »того
SELECT OrderID, OrderDate, CustomerID
FROM Orders
WHERE CustomerID IN 
      (
		SELECT CustomerID
		FROM   Customers
		WHERE  Country = 'Mexico' -- не скал€рный, автономный
	  )

-- табличный подзапрос
SELECT CustomerID, OrderID
FROM
	(
	SELECT OrderID, OrderDate, CustomerID
	FROM Orders
	WHERE CustomerID IN 
		  (
			SELECT CustomerID
			FROM   Customers
			WHERE  Country = 'Mexico' -- не скал€рный, автономный
		  )
	) AS T1
ORDER BY CustomerID