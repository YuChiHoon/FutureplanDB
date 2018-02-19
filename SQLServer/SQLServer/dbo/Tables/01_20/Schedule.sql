-- �������� ���̺� ����: Ŀ�´�Ƽ(Communities ���̺�)�� ���� ��������
Create Table dbo.Schedules
(
	[Num]			 int identity(1, 1) Primary Key Not Null,		-- �Ϸ� ��ȣ
	[CommunityName]	 NVarChar(25) Null,								-- Ŀ�´�Ƽ(�׷�) �̸� => CommunityId
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