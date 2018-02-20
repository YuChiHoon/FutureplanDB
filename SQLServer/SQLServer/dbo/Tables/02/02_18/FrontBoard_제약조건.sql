-- [0] tempdb ���
Use tempdb
Go

-- [1] �ǽ��� ���̺� ���� : ���� ��������(����) �Խ���
-- �۹�ȣ, ����, ��ũ, Ÿ��, �ۼ���
Create Table dbo.FrontBoard
(
	ItemID int 
		Identity(1,1)					-- [1] �ڵ����� : 1���� 1������
		Primary Key						-- [2] �ΰ����� : Not Null(�ݵ�� �Է�)
		Not Null,						-- [3] �⺻Ű(����) : ���ڵ� ���� �ʵ�
	Title NVarChar(150)
		Not Null
		Unique,							-- [4] ����Ű : ���̺��� ������ ��
	Url NVarChar(255) 
		Null,
	Target NVarChar(10) 
		Null 
		Check							-- [5] üũ���� : �־��� �����͸� �Է� ���
		(Target In('_top','_blank','_parent','_self')),
	CreatedDate Datetime 
		Default(GetDate())				-- [6] �⺻�� : ���ڵ� ������ �⺻�� �ο�
)
Go

-- [2] �ڵ����� �׽�Ʈ
Insert FrontBoard Values('����1', 'http://www.hawaso.com/', '_blank', GetDate())
Go
Insert FrontBoard Values('����2', 'http://www.dotnetkorea.com/', '_blank', GetDate())
Go

Select * From FrontBoard
Go

-- [3] �ΰ� üũ
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('����3', 'http://www.live.com/', '_blank', GetDate())
Go
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('http://www.live.com/','_blank',GetDate())
Go -- ���� �߻�

-- [4] ����Ű ���� ����
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('����1', 'http://www.microsoft.com/', '_blank', GetDate())
Go --���� �߻�


-- [5] üũ ���� ����
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('����4', Null, Null, GetDate())
Go -- ����
Insert FrontBoard(Title, Url, Target, CreatedDate)
Values('����5', Null, 'test', GetDate())
Go -- ���� �߻�

-- [1] Taget �ʵ忡 ������ ������ �� ���� ���� �Է��غ���.
Insert FrontBoard Values('test','test','test',GETDATE())	 -- ������.
-- [2] Taget �ʵ忡 Check �������ǿ��� ������ ���� �Է��Ѵ�.
Insert FrontBoard Values('test','test','_blank',GETDATE())	 -- �Էµ�.


-- [6] �⺻ ���� ����
Insert FrontBoard(Title)
Values('����5')
Go

Select * From FrontBoard
Go

-- �� �⺻���� ���
Create Table DefaultTest(PostDate DateTime Default(GetDate()))
Go
Insert DefaultTest Default Values
Go