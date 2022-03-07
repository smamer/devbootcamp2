SELECT* FROM Users
JOIN Role ON Users.RoleID = Role.RoleID
WHERE Role.RoleID = 1

SELECT* FROM Users
JOIN Role ON Users.RoleID = Role.RoleID
JOIN Taverns ON Users.TavernID = Taverns.TavernID
WHERE Role.RoleID = 1

SELECT* FROM Guests
LEFT JOIN GuestClass ON Guests.GuestID = GuestClass.GuestID
ORDER BY Names ASC

SELECT TOP(10) Price FROM Sales
JOIN Services ON Sales.ServiceID = Services.ServiceID

SELECT* FROM Guests
JOIN GuestClass ON Guests.GuestID = GuestClass.GuestID
GROUP BY Guests.GuestID HAVING COUNT(GuestClass.GuestID)>1

SELECT* FROM Guests
JOIN GuestClass ON Guests.GuestID = GuestClass.GuestID
GROUP BY GuestClass.GuestID HAVING COUNT(GuestClass.GuestID)>1
WHERE GuestClass.Level >5

SELECT TOP(1) ClassLevel FROM GuestClass
JOIN Guests ON GuestClass.GuestID = Guest.GuestID
GROUP BY GuestID


SELECT* FROM Guests
JOIN RoomStays ON Guests.GuestID = RoomStays.GuestID
WHERE RoomStays.Date BETWEEN '2022-02-01' AND '2022-03-01'