--Ejercicio 1
--Proveedores y Categorías
--Escenario: Compras necesita un reporte de todos los proveedores clasificados por su tipo de categoría.
--    Tablas: Purchasing.Suppliers y Purchasing.SupplierCategories.
--    Join: INNER JOIN por SupplierCategoryID.

SELECT 
    s.SupplierID,
    s.SupplierName,
    sc.SupplierCategoryName
FROM Purchasing.Suppliers AS s
INNER JOIN Purchasing.SupplierCategories AS sc
    ON s.SupplierCategoryID = sc.SupplierCategoryID;
GO

--Ejercicio 2
--Pedidos y Vendedores
--Escenario: Se requiere saber qué empleado fue el responsable de generar cada pedido de venta.
--    Tablas: Sales.Orders y Application.People.
--    Join: INNER JOIN relacionando SalespersonPersonID con PersonID.

SELECT
    o.OrderID,
    o.OrderDate,
    p.FullName AS Vendedor
FROM Sales.Orders AS o
INNER JOIN Application.People AS p
    ON o.SalespersonPersonID = p.PersonID;
GO

---Ejercicio 3
--Productos y sus Unidades de Medida
--Escenario: Para el reporte de inventario, se necesita saber cómo se empaqueta cada producto (por ejemplo: "Each", "Box", "Pair").
--    Tablas: Warehouse.StockItems y Application.DeliveryMethods.
--    Join: INNER JOIN por UnitPackageID

SELECT
    si.StockItemID,
    si.StockItemName,
    pt.PackageTypeName
FROM Warehouse.StockItems AS si
INNER JOIN Warehouse.PackageTypes AS pt
    ON si.UnitPackageID = pt.PackageTypeID;
GO

--Ejercicio 4
--El Reporte Geográfico de Ventas
--Escenario: El departamento de estrategia quiere saber no solo la ciudad, sino también a qué Estado/Provincia pertenecen los clientes que han realizado pedidos.
--    Tablas: 1.  Sales.Orders (El hecho: el pedido).
--    2.  Sales.Customers (El cliente que hizo el pedido).
--    3.  Application.Cities (La ciudad del cliente).
--    4.  Application.StateProvinces (El estado al que pertenece la ciudad).
--    El Reto: Conectar el pedido con la ubicación geográfica completa del cliente.

SELECT
    o.OrderID,
    c.CustomerName,
    ci.CityName,
    sp.StateProvinceName
FROM Sales.Orders AS o
INNER JOIN Sales.Customers AS c
    ON o.CustomerID = c.CustomerID
INNER JOIN Application.Cities AS ci
    ON c.DeliveryCityID = ci.CityID
INNER JOIN Application.StateProvinces AS sp
    ON ci.StateProvinceID = sp.StateProvinceID;
GO