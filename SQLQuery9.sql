IF OBJECT_ID (N'dbo.UserRoles',N'IF') IS NOT NULL
	DROP FUNCTION UserRoles;
GO
CREATE FUNCTION dbo.UserRoles(@userID int)
RETURNS TABLE
AS
RETURN
(
	SELECT* FROM Users
	JOIN Role ON Users.RoleID = Role.RoleID
);

IF OBJECT_ID (N'dbo.GuestClasses',N'IF') IS NOT NULL
	DROP FUNCTION GuestClasses;
GO
CREATE FUNCTION dbo.GuestClasses(@ClassID int)
RETURNS TABLE
AS
RETURN
(
	SELECT* FROM Class
	UNION ALL
	SELECT Class WHERE Class = (COUNT(GuestID)
	FROM GuestClass
	WHERE Class HAVING GuestID) FROM GuestClass

);

IF OBJECT_ID (N'dbo.Guests',N'IF') IS NOT NULL
	DROP FUNCTION Guests;
GO
CREATE FUNCTION dbo.Guests(@GuestID int)
RETURNS TABLE
AS
RETURN
(
	(SELECT* FROM Guests
	(JOIN GuestClass ON Guests.GuestID = GuestClass.GuestID))
	UNION ALL
	SELECT* ((CASE WHEN ClassLevel BETWEEN 1 AND 5 THEN 'Beginner' 
	WHEN ClassLevel BETWEEN 5 AND 10 THEN 'Intermediate' 
	WHEN ClassLevel >10 THEN 'Expert') AS LevelGrouping) FROM GuestClass
	ORDER BY Names ASC
);

IF OBJECT_ID (N'dbo.LevelGrouping',N'FN') IS NOT NULL
	DROP FUNCTION LevelGrouping;
GO
CREATE FUNCTION dbo.LevelGrouping(@ClassLevel int)
RETURNS INT
AS
BEGIN
	RETURN (SELECT (CASE WHEN ClassLevel BETWEEN 1 AND 5 THEN 'Beginner' 
	WHEN ClassLevel BETWEEN 5 AND 10 THEN 'Intermediate' 
	WHEN ClassLevel >10 THEN 'Expert'))
);

IF OBJECT_ID (N'dbo.OpenRooms',N'IF') IS NOT NULL
	DROP FUNCTION OpenRooms;
GO
CREATE FUNCTION dbo.OpenRooms(@Date DateTime)
RETURNS TABLE
AS
RETURN
(
	SELECT* FROM RoomStays WHERE Date IS NULL
	UNION ALL
	SELECT* FROM Rooms
);

IF OBJECT_ID (N'dbo.OpenRooms',N'IF') IS NOT NULL
	DROP FUNCTION OpenRooms;
GO
CREATE FUNCTION dbo.OpenRooms(@Rate Money)
RETURNS TABLE
AS
RETURN
(
	SELECT* FROM RoomStays
	UNION ALL
	SELECT* FROM Rooms
);

CREATE PROCEDURE CheaperRoom
AS
@Rate Money
RETURNS TABLE
AS
RETURN
(
	SELECT* FROM RoomStays
	UNION ALL
	SELECT* FROM Rooms
);
GO;
EXEC CheaperRoom;