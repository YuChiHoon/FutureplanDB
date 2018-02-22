--[!] ���� ������ ���� ���̺� ����
Create Table People
(
	Num		Int Primary Key,
	Name	NVarChar(20)
)
Go

Create Table Computer
(
	Num		Int Primary Key,
	Model	NVarChar(20)
)
Go

--[2] ������ �Է�
Insert Into People(Num, Name) Values(1, N'ȫ�浿');
Insert Into People(Num, Name) Values(2, N'��λ�');
Insert Into People(Num, Name) Values(3, N'�Ӳ���');
Insert Into People(Num, Name) Values(4, N'�Ѷ��');
Insert Into People(Num, Name) Values(5, N'������');

Insert Into Computer(Num, Model) Values(3, N'SurfaceBook');
Insert Into Computer(Num, Model) Values(4, N'RuggedBook');

--[3] ��ȸ
--[3][1] Inner Join : �����̺��� ������

--[3][1][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Join Computer On People.Num = Computer.Num;

--[3][1][2] T-SQL
Select People.Num, People.Name, Computer.Model
From People, Computer
Where People.Num = Computer.Num;

--[3][2] Left Outer Join/ Left Join : ���� ���̺��� ��� ������ ����
--[3][2][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Left Outer Join Computer On People.Num = Computer.Num;

--[3][3] Right Outer Join/ Right Join : ������ ���̺��� ��� ������ ����
--[3][3][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Right Outer Join Computer On People.Num = Computer.Num;

--[3][4] Full Outer Join : ��ü ����
--[3][4][1] ANSI SQL
Select People.Num, People.Name, Computer.Model
From People Full Outer Join Computer On People.Num = Computer.Num;