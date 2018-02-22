-- OFFSET-FETCH ����

--[0] ������ ���̺� ����
Create Table dbo.Memos
(
	Num			 Int Identity(1,1) Not Null Primary Key,	-- ��ȣ
	[Name]		 NVarChar(25) Not Null,						-- �̸�
	Email		 NVarChar(50) Null,							-- �̸���
	Title		 NVarChar(150) Null,						-- ���ٸ޸�(����)
	PostDate	 DateTime Null Default(GetDate())			-- �ۼ���
)
Go

--[0] Memos���̺� 1000���� ���ڵ� ���
Declare @i Int
Set @i = 1
While @i <= 200
Begin
	Insert Memos(Name, Email, Title) Values(N'��λ�', 'hong@hong.com', N'��ϴ�')
	Insert Memos(Name, Email, Title) Values(N'�Ѷ��', 'hong@hong.com', N'���ֵ�')
	Insert Memos(Name, Email, Title) Values(N'������', 'hong@hong.com', N'������')
	Insert Memos(Name, Email, Title) Values(N'����', 'hong@hong.com', N'����')
	Insert Memos(Name, Email, Title) Values(N'ȫ�浿', 'hong@hong.com', N'ȫ���')
	Set @i = @i + 1
End
Go

--[1] ��ü ���ڵ� ��ȸ
Select Count(*) From Memos;
Select * From Memos Order By Num Desc;

--[2] OFFSET-FETCH ���͸� ����� ����¡ ó��: SQL 2012���� ����
Select *
From Memos
Order By Num Desc
OffSet 5 Rows Fetch Next 3 Rows Only; -- 5�� �� Skip �� 3�� �� Take

Select *
From Memos
Order By Num Desc
OffSet 10 Rows Fetch Next 10 Rows Only; -- 10�� �� Skip �� 10�� �� Take


-- �ܼ��� �϶����� Rows ��ſ� Row ����ص� ��
Select *
From Memos
Order By Num Desc
--OffSet 1 Rows Fetch Next 1 Rows Only; -- 1�� �� Skip �� 1�� �� Take
OffSet 1 Row Fetch Next 1 Row Only; -- 1�� �� Skip �� 1�� �� Take

-- ����¡ ó�� [���� ���ν���] �Ǵ� [�Լ�]�� Ȯ���ؼ� ���
Select *
From Memos
Order By Num Desc
OffSet (2 -1) * 10 Rows Fetch Next 10 Rows Only;