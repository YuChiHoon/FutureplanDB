-- �μ��� ����� ��� ����

--[1] �μ� ���̺�
Create Table �μ�
(
	[�μ���ȣ]	 Int Identity(1,1) Primary Key Not Null,
	[�μ���]	 NVarChar(50) Not Null,
)
Go

--[2] ��� ���̺�
Create Table ���
(
	[�����ȣ]	 Int Identity(1,1) Primary Key Not Null,
	[����]	 NVarChar(50) Not Null,
	[�μ���ȣ]	 Int -- �μ�.�μ���ȣ
)
Go

-- [3] ��� ����
Create Table ���
(
	[����ȣ]	 Int Identity(1,1) Primary Key Not Null,
	[����]	 NVarChar(50) Not Null,
	[�����ȣ]	 Int -- ���.�����ȣ
)
Go

-- ���� ������ �Է�
Insert Into �μ� Values(N'�μ�1');
Insert Into �μ� Values(N'�μ�2');
Insert Into �μ� Values(N'�μ�3');
Select * From �μ�;

Insert Into ��� Values(N'ȫ�浿', 1);
Insert Into ��� Values(N'��λ�', 2);
Insert Into ��� Values(N'�Ӳ���', 3);
Select * From ���;

Select d.�μ���ȣ, d.�μ���, e.�����ȣ, e.���� 
From �μ� d Inner Join ��� e 
On d.�μ���ȣ = e.�μ���ȣ;

-- ȫ�浿�� (��ǻ��, ����) ���
Insert Into ��� Values(N'��ǻ��', 1);
Insert Into ��� Values(N'����', 1);

-- ��λ��� (�Ƿ�) ���
Insert Into ��� Values(N'�Ƿ�', 2);

-- �Ӳ����� (å) ���
Insert Into ��� Values(N'å', 3);

-- �μ��� ����� ���
-- 1�ܰ�
Select * From �μ�;
-- 2�ܰ�
Select * From ��� Where �μ���ȣ = 1;
-- 3�ܰ�
Select * From ��� Where �����ȣ = 1;
