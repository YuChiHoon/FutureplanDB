-- ȸ��(Users) ���� ���̺�
Create Table dbo.Users
(
	[Id]			 Int Identity(1, 1) Primary Key Not Null,		-- �Ϸù�ȣ
	[Username]		 NVarChar(30) Not Null,							-- ���̵�
	[Password]		 NVarChar(50) Null,								-- ��ȣ
	[Name]			 NVarChar(50) Null,								-- �̸�
	[Email]			 NVarChar(100) Null,							-- �̸���
	[Description]	 NVarChar(255) Null,							-- ����(�Ұ�)
	[CreationDate]	 DateTimeOffset(7) Default(GetDate()),			-- ������
	[LastLoginDate]	 DateTimeOffset(7) Default(GetDate()),			-- ������ �α��� ����
	[LastLoginIp]	 NVarChar(16) Null,								-- IP �ּ�
	[VisitedCount]	 Int Default(0),								-- �湮 Ƚ��
	[Blocked]		 Bit Default(0),								-- ���� ���
	[PhoneNumber]	 NVarChar(30) Null,								-- ��ȭ��ȣ 
	[Address]		 NVarChar(500) Null,							-- �ּ�
	[Gender]		 NVarChar(10) Null,								-- ����
	[BirthDate]		 NVarChar(20) Null,								-- �������
	[Country]		 NVarChar(50) Null,								-- ����

	[NickName]		 NVarChar(50) Null,								-- �г���
	[UserIcon]		 NVarChar(100) Null,							-- ����� ������

	[IsSleep]		 Bit Default(0),								-- �޸� ����� ����
	[SleepDate]		 DateTimeOffset(7) Default(GetDate())			-- �޸� ��ȯ ����
)
Go