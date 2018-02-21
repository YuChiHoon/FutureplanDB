-- ÷�� ���� ������

Create Table dbo.AttachFiles
(
	Id			Int Not Null Primary Key Identity(1,1),			-- �Ϸù�ȣ
	UserId		Int Null,										-- ����� Id
	BoardId		Int Not Null,									-- �Խ��� ���̺� �Ϸù�ȣ
	ArticleId	Int Not Null,									-- �Խñ� Id(Num)
	FileName	NVarChar(255) Null,								-- ���ϸ�
	FileSize	Int Null,										-- ����ũ��
	DownCount	Int Default 0,									-- �ٿ��
	TimeStamp	DateTimeOffset(7) Default(GetDate()) Null		-- ���ε� �ð�
)
Go

-- ���ù�
-- �Է�
Insert Into AttachFiles (UserId, BoardId, ArticleId, FileName, FileSize)
Values (6, 4, 1, N'Photo3.png', 1234)
Go

-- ���
Select * From AttachFiles
Go

-- ��
Select * From AttachFiles Where BoardId = 4 And ArticleId = 1 Order By FileName Asc
Go

-- ����
Update AttachFiles
Set
	FileName = N'Photo22222.jpg',
	FileSize = 2345
Where
	BoardId = 4 And ArticleId = 1 And Id = 2
Go

-- ����
Delete AttachFiles
Where Id = 2
Go

-- �˻�
Select * From AttachFiles Where FileName Like '%to%' Order By FileName Asc
Go