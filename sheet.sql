CREATE DATABASE EmployeeManagementSystem;
GO
USE EmployeeManagementSystem;
CREATE table Employees
(
    EmployeeID INT PRIMARY key IDENTITY(1,1),
    name VARCHAR(100),
    Position VARCHAR(50),
    salary DECIMAL(10,2),
    hireDate DATETIME

)
CREATE TABLE EmployeeUpdate
(
    udpateID int PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT,
    oldSalary DECIMAL(10,2),
    newSalary DECIMAL(10,2),
    updateDate DATETIME
)
CREATE TABLE deleteEmployees
(
    EmployeeID INT,
    name VARCHAR(100),
    deletionDate DATETIME
)
DROP TRIGGER trg_AfterEmployeeDelete;

CREATE TRIGGER trg_AfterSalaryUpdate
ON Employees
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(Salary)
    BEGIN
        INSERT INTO EmployeeUpdate
            (EmployeeID, oldSalary, newSalary, updateDate)
        SELECT
            d.EmployeeID,
            d.salary AS oldSalary,
            i.salary AS newSalary,
            GETDATE() AS updateDate
        FROM deleted d
            INNER JOIN inserted i ON d.EmployeeID = i.EmployeeID
        WHERE d.Salary <> i.Salary;
    END
END
GO

-- Trigger بعد الحذف: تسجيل معلومات الموظف المحذوف
CREATE TRIGGER trg_AfterEmployeeDelete
ON Employees
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO deleteEmployees
        (EmployeeID, Name, deletionDate)
    SELECT
        EmployeeID,
        Name,
        GETDATE() AS DeletionDate
    FROM deleted;
END;
GO


INSERT INTO Employees ( name, position, salary, hireDate)
VALUES
( 'Ahmed Ali', 'Developer', 6000.00, '2022-01-15'),
( 'Sara Mostafa', 'Designer', 5500.00, '2021-07-20'),
( 'Mohamed Tarek', 'Manager', 8000.00, '2020-03-01');
GO

select * FROM Employees

UPDATE Employees
SET salary = 6500.00
WHERE EmployeeID = 2;
GO

DELETE from Employees WHERE EmployeeID=1;

SELECT * FROM EmployeeUpdate;
SELECT * FROM deleteEmployees