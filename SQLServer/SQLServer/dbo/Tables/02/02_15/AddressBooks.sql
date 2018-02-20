-- SQL ����

-- DDL: ������ ���� ���
-- [1] ���̺� ����
Create Table AddressBooks
(
	Id		Int Identity(1,1) Primary Key,
	Name	NVarChar(25) Not Null,
	Phone	NVarChar(15) Null
)
Go

-- [2] ���̺� ���� ����
-- Alter Table AddressBooks ...

-- [3] ���̺� ���� ����
Drop Table AddressBooks
Go

-- DML: ������ ���� ���
-- [1] Insert��: �Է�
Insert Into AddressBooks(Name, Phone) Values('ȫ�浿', '114');
Insert Into AddressBooks(Name, Phone) Values('��λ�', '119');

-- [2] Select��: ���/��ȸ
Select * From AddressBooks;
Select * From AddressBooks Where Name = '��λ�';

-- [3] Update��: ����/����
Update AddressBooks Set Phone = '120' Where Name = '��λ�';

-- [4] Delete��: ����
Delete AddressBooks Where Id = 2;