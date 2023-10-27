-- ����������

-- �������� ������ �������� �� �������
-- 1
SELECT OrderID, OrderDate, CustomerID
FROM Orders

-- 2 ����������� �������� �� �������
SELECT CustomerID
FROM   Customers
WHERE  Country = 'Mexico'

-- �����
SELECT OrderID, OrderDate, CustomerID
FROM Orders
WHERE CustomerID IN 
      (
		SELECT CustomerID
		FROM   Customers
		WHERE  Country = 'Mexico' -- �� ���������, ����������
	  )

-- ��������� ���������
SELECT CustomerID, OrderID
FROM
	(
	SELECT OrderID, OrderDate, CustomerID
	FROM Orders
	WHERE CustomerID IN 
		  (
			SELECT CustomerID
			FROM   Customers
			WHERE  Country = 'Mexico' -- �� ���������, ����������
		  )
	) AS T1
ORDER BY CustomerID