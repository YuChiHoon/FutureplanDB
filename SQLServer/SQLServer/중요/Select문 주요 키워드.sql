-- ���̺� ����
Create Table dbo.Customers
(
	Num			 Int Identity(1,1) Primary Key,		-- �Ϸ� ��ȣ
	Name		NVarChar(25) Not Null,				-- �̸�
	Age			TinyInt Null,						-- ����
	Address		NVarChar(100)						-- �ּ�
)
Go

-- ���� ������ �Է�
Insert Customers Values(N'ȫ�浿', 21, N'����')
Insert Customers Values(N'��λ�', 31, N'����')
Insert Customers Values(N'�Ѷ��', 41, N'�λ�')
Insert Customers Values(N'������', 21, N'�λ�')
Insert Customers Values(N'���ǻ�', 31, N'����')

-- Select�� �ֿ� ��� Ȯ��
-- ��ü �� ����Ʈ
Select * From Customers

--[1] �ߺ�����(Distinct) : ������ ��� ������ �ߺ����� ����Ͻÿ�.
Select Distinct Address From Customers

--[2] Group By : �����Լ� �׷�ȭ : ���� ���� ���� ������ ���
Select Address, Avg(Age) From Customers
Group By Address -- �׷�ȭ

--[3] ������ �ִ� �����Լ� �׷�ȭ : ���� ���� ���� ���̰� 40�̻��� ���� ������ ���
Select Address, Avg(Age) From Customers
Where Age >= 40
Group By Address

-- Group By All : �� ������ �� ���ǿ� ���� �ʾƵ� ���� ����Ʈ
Select Address, Avg(Age) From Customers
Where Age >= 40
Group By All Address

--[4] Having : �����Լ��� ���� ���� ó��
-- ���� ���� ���� ������ ����� 30 �̻��� �����͸� ���
Select Address, Avg(Age) As ������� From Customers
Group By Address
Having Avg(Age) >= 30

--[5] RollUp : �Ұ� : ������ ���̸� ��� �� ���� �Ұ�(�߰��հ�)
Select Address, Sum(Age) As ������ From Customers
Group By Address With RollUp

--[6] Cube : �Ұ� : ������ ���̸� ��� �� ���� �Ұ�(�߰��հ�)
Select Address, Sum(Age) As ������ From Customers
Group By Address With Cube

--[7] Grouping() �Լ� : RollUp/Cube ���� �׷�ȭ �� �׸����� ǥ��(��:1,�ƴϿ�:0)
Select Address, Sum(Age) As ������, GROUPING(Address) As �׷�ȭ����
From Customers
Group By Address With Cube

--[8] Compute : ��� ����� ���� ����
Select Address, Age
From Customers
Compute Sum(Age),Avg(Age) -- ���� ���� �ڵ� ��� RollUp ����Ͻÿ�.

--[9] Compute : ��� ����� ���� ���迡 ���� ����
Select Address, Age
From Customers
Order By Address
Compute Sum(Age),Avg(Age) by Address -- ���� ���� �ڵ� ��� RollUp ����Ͻÿ�.

--[10] Case : ���� ��ü
Select Name, Age, 
	Address = Case Address When N'����' Then N'Seoul'
						   When N'�λ�' Then N'Busan'
						   Else N'�ٸ�����'
						   End
From Customers