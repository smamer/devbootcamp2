use Taverns

SELECT* FROM Guests WHERE Guests.Birthday BEFORE '2000-01-01'

SELECT* FROM RoomStays WHERE RoomStays.Rate > 100

SELECT DISTINCT Names FROM Guests

SELECT* FROM Guests ORDER BY Names ASC

SELECT TOP(10) Price FROM Sales

SELECT RoleID as ID, RoleName as Name from Role
UNION ALL
SELECT StatusID as ID, Status as Name from ServiceStatus
UNION ALL 
SELECT SupplyID as ID, ServiceID as Name from ServiceSupplies
UNION ALL 
SELECT ID, Status as Name from RoomStatus
UNION ALL
SELECT ID, Status as Name from GuestStatus
UNION ALL
SELECT ID, ClassType as Name from Class

SELECT* (CASE WHEN ClassLevel BETWEEN 1 AND 10 THEN 'lvl1-10' 
WHEN ClassLevel BETWEEN 10 AND 20 THEN 'lvl10-20' 
WHEN ClassLevel BETWEEN 20 AND 30 THEN 'lvl20-30'
WHEN ClassLevel BETWEEN 30 AND 40 THEN 'lvl30-40') as LevelGrouping FROM GuestClass