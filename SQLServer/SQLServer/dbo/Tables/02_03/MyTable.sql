-- ���̺� ����
Create Table MyTable1
(
	[Num] Int Identity(1,1) Primary Key Not Null,
	[Name] NVarChar(25) Not Null
)
Go

Create Table MyTable2
(
	[Num] Int Identity(1,1) Primary Key Not Null,
	[Name] NVarChar(25) Not Null
)
Go

-- ������ �Է�
Declare @i Int
Set @i = 1
While @i <= 10000
Begin
	Insert Into MyTable2 Values(N'ȫ�浿')
	Set @i = @i + 1
End