-- �����Լ� ����

Create Table [�����̺�]
(
	����ȣ	Int Identity(1,1) Primary Key,
	�̸�		NVarChar(10),
	����Ʈ		Int
)
Go

Insert Into �����̺� Values(N'ȫ�浿', 10);
Insert Into �����̺� Values(N'��λ�', 20);
Insert Into �����̺� Values(N'�Ӳ���', 30);

Select * From �����̺�;

-- �հ�(Sum), ���(Avg), ī��Ʈ(Count), �ִ밪(Max), �ּҰ�(Min)
Select Sum([����Ʈ]) As [����Ʈ�հ�] From �����̺�;
Select Avg([����Ʈ]) As [����Ʈ���] From �����̺�;
Select Count([����Ʈ]) As [�Ǽ�] From �����̺�;
Select Count(*) As [��ü���ڵ��] From �����̺�;
Select Max([����Ʈ]) As [����Ʈ�ִ�] From �����̺�;
Select Min([����Ʈ]) As [����Ʈ�ּҰ�] From �����̺�;

Select Sum([����Ʈ]) As [����Ʈ�հ�]
From �����̺�
Where �̸� Like N'%��%' Or ����Ʈ Between 10 And 30;