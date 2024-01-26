CREATE TRIGGER trgShippersOperations
ON Shippers
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @OperationType NVARCHAR(50);

    IF EXISTS (SELECT 1 FROM inserted)
    BEGIN
        IF EXISTS (SELECT 1 FROM deleted)
        BEGIN
            SET @OperationType = 'Güncelleme İşlemi Yapıldı';
        END
        ELSE
        BEGIN
            SET @OperationType = 'Kayıt Ekleme İşlemi Yapıldı';
        END
    END
    ELSE
    BEGIN
        SET @OperationType = 'Silme İşlemi Yapıldı';
    END

    PRINT @OperationType;
END;


INSERT INTO Shippers (ShipperID, CompanyName, Phone)
VALUES (4, 'New Shipper', '123-456-7890');


UPDATE Shippers SET CompanyName = 'Updated Shipper' WHERE ShipperID = 4;


DELETE FROM Shippers WHERE ShipperID = 4;


