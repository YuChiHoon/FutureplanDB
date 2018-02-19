-- �������� ���̺� ����: Ŀ�´�Ƽ(Communities ���̺�)�� ���� ��������
Create Table dbo.Schedules
(
	[Num]			 int identity(1, 1) Primary Key Not Null,		-- �Ϸ� ��ȣ
	[Community]		 NVarChar(25) Null,								-- Ŀ�´�Ƽ(�׷�) �̸� => CommunityId
	[SYear]			 SmallInt Not Null,								-- ��
	[SMonth]		 SmallInt Not Null,								-- ��
	[SDay]			 SmallInt Not Null,								-- ��
	[SHour]			 SmallInt Null,									-- ��
	[SMinute]		 SmallInt Null,									-- ��

	[Title]			 NVarChar(150) Not Null,						-- ���� ����
	[Content]		 NVarChar(Max) Null,							-- ���� ����
	[Created]		 DateTimeOffset(7) Default(GetDate()),			-- ���� �����
	[Icon]			 NVarChar(20) Null,								-- ������
	[Ref]			 Int Null,										-- �ܺ� ���� ������
)
Go

-- [!] ���ù�
-- ���� �Է�
Insert Into Schedules (Community, SYear, SMonth, SDay, SHour, SMinute, Title, Content, Created, Icon, Ref)
Values (N'SQL', 2018, 1, 20, 12, 30, N'SQL�� ����', N'Insert, Select, Update, Delete ����', Default, '', NULL)

-- ���� ���
Select * From Schedules;

Select * From Schedules Where Community = N'SQL' And SYear = 2018 And SMonth = 1 And SDay = 20;

-- ���� ��
Select * From Schedules Where Num = 1 And Community = N'SQL';

-- ���� ����
Update Schedules
Set
	Community = N'C#', 
	SYear = 2019, 
	SMonth = 1, 
	SDay = 25, 
	SHour = 10, 
	SMinute = 30, 
	Title = N'C# ����', 
	Content = N'Visual Studio�� ����� C# ����'
Where Num = 1;

-- ���� ����
Delete Schedules Where Num = 1;