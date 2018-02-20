Create Table Categories
(
	CategoryID			--[!] ī�װ� �Ϸù�ȣ
		int				--[0] ������ ����
		Identity(1,1)	--[1] �ڵ�������: 1���� 1�� ����
		Primary Key,	--[2] �⺻Ű(������ �ĺ���(Identifier)): ���ڵ� �����ϴ� ������ ��
						--    �⺻Ű�� Not Null����, Unique�� ����
	CategoryName		--[!] ī�װ� �̸�
		NVarChar(25)	
		Not Null		--[3] �ΰ����� : Not Null : �ݵ�� �� �Է�, Null(�� ���)
)
Go

Create Table dbo.FrontBoards
(
	ItemID									-- [!] �Ϸù�ȣ
		Int Identity(1,1) Primary Key,
	Title
		NVarChar(150) Not Null
		Unique,								-- [4] ����Ű���� :  ���̺��� ������ ��(�ߺ��Ұ�)
	Url
		NVarChar(255)
		Null,								-- [5] �� ���� : NULL :  ���� �Է����� �ʾƵ� ����
	[Target] 
		NVarChar(10) 
		Null 
		Check								-- [6] üũ���� : �־��� �����͸� �Է� ���
		(Target In('_top','_blank','_parent','_self')),
	CreatedDate
		DateTime
		Default(GetDate()),					-- [7] �⺻�� ���� : ���ڵ� ������ �⺻�� �ο�
	CategoryID
		Int
		References Categories(CategoryID)	--[8] �ܷ�Ű : �ٸ� ���̺��� �⺻Ű�� ������ ��
)
Go


--[2] ���� ������ �Է� : �ڵ������� üũ
Insert Into Categories Values('����');
Insert Categories Values('����');

Select * From Categories order By CategoryID Asc

Insert Into FrontBoards
Values('����ڸ���', 'http://www.dotnetkorea.com', '_blank', Default, 1);
Insert Into FrontBoards(Title, Url, Target, CategoryID)
Values('���־��ī����', 'http://www.VisualAcademy.com', '_self', 2);

Select * From FrontBoards

--[3] �ΰ� üũ
Insert Into FrontBoards(Url) Values('http://'); -- ���� Not Null�� ��� �� ����

--[4] ����Ű �������� Ȯ��
Insert Into FrontBoards
Values('����ڸ���', 'http://www.dotnetkorea.com', '_blank', Default, 1); -- ���� ����ڸ��� �ߺ�

--[5] üũ��������
Insert Into FrontBoards
Values('�ڹ�ķ�۽�', 'http://', '_main', Default, 1); -- ���� üũ�� _main����

--[6] �ܷ�Ű(Foreign Key)
Insert Into FrontBoards
Values('�ڹ�ķ�۽�', 'http://', '_blank', Default, 3); -- ���� �ܷ�Ű 1,2�� ����