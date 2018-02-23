-- ÷�� ���� ������
Create Table dbo.AttachFiles
(
	Id			Int Not Null Primary key Identity(1,1),			-- �Ϸù�ȣ
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
Insert Into AttachFiles
	(UserId, BoardId, ArticleId, FileName, FileSize)
Values
	(6, 4, 1, N'Photo.png',1234)
Go

-- ���
Select * From AttachFiles
Go

-- T-SQL ������ ����Ͽ� 200���� ���� ������ �����ϱ�
-- Declare		: ���� ����
-- Set			: ������ ���� �״�
-- Begin, End	: �ϳ��� ���๮�� ���۰� ���� ���� {}

Declare @i Int																		-- ���� ����
Set @i = 1																			-- �ʱ��
While @i <= 200																		-- ���ǽ�
	Begin																			-- {
		Insert Into AttachFiles	(UserId, BoardId, ArticleId, FileName, FileSize)	-- ���๮
		Values	(@i, @i, @i, N'Photo.png',1234)
		Set @i = @i + 1																-- ������
	End																				-- }
Go