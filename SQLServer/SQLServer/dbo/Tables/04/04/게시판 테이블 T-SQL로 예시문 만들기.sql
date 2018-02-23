-- [!] �Խ��� ���̺� ���� : Articles, Notes, Memos, (Basic+Upload+Reply)
--Drop Table [Articles]

Create Table [dbo].[Articles]
(
	[Id]			Int Not Null Primary Key Identity(1,1),		-- �Ϸù�ȣ

	Name			NVarChar(25) Not Null,						-- �̸�
	PostDate		DateTime Default GetDate() Not Null,		-- �ۼ���
	PostIp			NVarChar(15) Null,							-- �ۼ� IP
	Title			NVarChar(150) Not Null,						-- ����
	Content			NText Not Null,								-- ����
	Category		NVarChar(20) Default('Free') Null,			-- ī�װ�(Ȯ��...) => '����', '����', '�ڷ�;, '����'...

	Email			NVarChar(100) Null,							-- �̸���
	Password		NVarChar(255) Null,							-- ��й�ȣ
	ReadCount		Int Default 0,								-- ��ȸ��
	Encoding		NVarChar(10) Not Null,						-- ���ڵ�(HTML/Text/Mixed)
	Homepage		NVarChar(100) Null,							-- Ȩ������
	ModifyDate		DateTime Null,								-- ������
	ModifyIp		NVarChar(15) Null,							-- ���� IP
	FileName		NVarChar(255) Null,							-- ���ϸ�
	FileSize		Int Default	0,								-- ����ũ��
	DownCount		Int Default 0,								-- �ٿ��
	CommentCount	Int Default 0,								-- ��ۼ�

	Ref				Int Not Null,								-- ����(�θ��)
	Step			Int Default 0,								-- �亯����(����)
	RefOrder		Int Default 0,								-- �亯����
	AnswerNum		Int Default 0,								-- �亯��
	ParentNum		Int Default 0,								-- �θ�۹�ȣ

	Num				Int Null,									-- ��ȣ(Ȯ��,,,)
	UserId			Int Null,									-- (Ȯ��...) ����� ���̺� ID
	CategoryId		Int Null Default 0,							-- (Ȯ��...) ī�װ� ���̺� ID
	BoardId			Int Null Default 0,							-- (Ȯ��...) �Խ���(Boards) ���̺� ID
	AplicationId	Int Null Default 0							-- (Ȯ��...) ���� ���α׷� ID
)
Go

--[!] ���ù�

--[1] �Է�
--Insert Into Articles (Name,	PostDate, PostIp, Title, Content, Category, Encoding, Ref) 
--Values (N'ȫ�浿', GetDate(), '127.0.0.1', N'�Խ��� ���̺� �����', N'���� ������ ��...', N'����', N'Plain-Text', 1)
--Go

Declare @BoardId Int
Set @BoardId = 1

-- Ref �� ��������: ó���̸� 1�� �ʱ�ȭ
Declare @MaxRef Int
Select @MaxRef = Max(IsNull(Ref,0))				-- ���: ���� �Ǵ� �ٸ� Set �۾��� ���� Null���� ���ŵǾ����ϴ�. => IsNull() �Լ� ���
From Articles
Where BoardId = @BoardId

If @MaxRef Is Null
	Begin
		Set @MaxRef = 1		-- ���̺� ���� �� ó���� ��
	End
Else
	Begin
		Set @MaxRef = @MaxRef + 1
	End

-- Num �� ��������: ó���̸� 1�� �ʱ�ȭ
Declare @MaxNum Int
Select @MaxNum = Max(IsNull(Num,0)) 
From Articles
Where BoardId = @BoardId

If @MaxNum Is Null
	Begin
		Set @MaxNum = 1		-- ���̺� ���� �� ó���� ��
	End
Else
	Begin
		Set @MaxNum = @MaxNum + 1
	End

Insert Into Articles 
(
	Name,	PostDate, PostIp, Title, Content, Category, Encoding, Ref,Num, BoardId,
	UserId, Email, Password, Homepage, FileName, FileSize
) 
Values 
(
	N'ȫ�浿', GetDate(), N'127.0.0.1', N'�Խ��� ���̺� �����', N'���� ������ ��...', N'����', N'Plain-Text', @MaxRef, @MaxNum, @BoardId,
	0, N'Red@red.net', N'1234', N'http://www.devlec.com', N'Photo.jpg', N'1234'
)
Go

Select * From Articles Order By Ref Desc
Go