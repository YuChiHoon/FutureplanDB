-- �α�(Log) ����
-- �α�(Logs) ���̺� ����
Create Table Logs
(
	[Id] Int Identity(1,1) Primary Key Not Null,		-- �Ϸ� ��ȣ

	[Application] NVarChar(50) Not Null,				-- ���� ���α׷�: �Խ��� ����, ��ǰ ����
	[Logger] NVarChar(255) Null,						-- ����� ����(�α��� ��� ���̵�)
	[LogEvent] NVarChar(Max) Null,						-- �α� �̺�Ʈ(�̺�Ʈ ID �Ǵ� ����� ���� �̺�Ʈ �̸�)

	[Message] NVarChar(Max) Null,						-- �α� �޽���
	[MessageTempate] NVarChar(Max) Null,				-- �α� �޽����� ���� ���ø� 

	[Level] NVarChar(128),								-- �α� ����(����, ����, ���)
	[TimeStamp] DateTimeOffset(7) Not Null,				-- �α� �߻� �ð�(LogCreationDate)
	[Exception] NVarChar(Max) Null,						-- ���� �޽���

	[Properties] Xml Null,								-- ��Ÿ ���� �Ӽ����� XML ����

	[Callsite] NVarChar(Max) Null,						-- ȣ�� ����Ʈ
)
Go