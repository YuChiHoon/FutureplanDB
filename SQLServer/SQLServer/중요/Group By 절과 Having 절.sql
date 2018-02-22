-- Group By ���� Having ��
-- Group By : Ư�� �÷�(�ʵ�)�� �׷�ȭ(����)
-- Having : Group By�� ���� �׸� ���� ���� ó��

-- ���̺� ���� �� ������ �Է�
Create Table dbo.Orders
(
	[��ǰ��]	NVarChar(10),
	[�ǸŰ���]	Int
)
Go

-- ���� ������ �Է�
Insert Orders Values(N'RADIO',5)
Insert Orders Values(N'TV',3)
Insert Orders Values(N'AUDIO',1)
Insert Orders Values(N'DVD',7)
Insert Orders Values(N'RADIO',3)
Insert Orders Values(N'DVD',8)
Insert Orders Values(N'TV',10)

--[1] �����Լ� ��� �˻�
Select * From Orders;

Select Count([�ǸŰ���]) As [���Ǹ�Ƚ��] From Orders;
Select Sum([�ǸŰ���]) As [���ǸŰ���] From Orders;
Select Avg([�ǸŰ���]) As [���Ǹ����] From Orders;
Select Max([�ǸŰ���]) As [�ִ��ǸŰ���] From Orders;
Select Min([�ǸŰ���]) As [�ּ��ǸŰ���] From Orders;

--[2] �Ʒ� ������ ������Ѻ��� ������ ���� ������ ��Ÿ����.
--Orders.��ǰ�� ���� ���� �Լ��� ���� Grouo By ���� �����Ƿ� Select ��Ͽ��� ��� �� �� ����.
Select [��ǰ��], Avg([�ǸŰ���]) As [���Ǹ����] From Orders;

--[3] ���� ���� �����Լ��� ���Ǿ����� �ʰ� �׷�ȭ �Ǿ� ��½�ų �ʵ�� �ݵ�� Group By���� ����ؾ��Ѵ�.
Select [��ǰ��], Avg([�ǸŰ���]) As [���Ǹ����]
From Orders
Group By [��ǰ��]; -- ���� ���� : ��ǰ��, �����Լ� : ���Ǹ����

--[4] ���� �׷캰 �� �Ǹ������ 5�̻��ΰ͸� ����ϰ��� �� ������ Having���� ������ �߰��ؾ��Ѵ�.
Select [��ǰ��], Sum([�ǸŰ���]) As [���Ǹ��հ�], Avg([�ǸŰ���]) As [���Ǹ����]
From Orders
Group By [��ǰ��]
Having Avg([�ǸŰ���]) >= 5 -- �ǸŰ����� ����� 5�̻��ΰ͸� �˻�
Order By [��ǰ��] Asc;

--[5] ���� : �ֹ��� ��ǰ �Ǹŷ��� 5�̻��̰�,
--�׷캰 �� �Ǹ� ����� 7�̻��ΰ͸� [��ǰ��]���� �������� �����Ͻÿ�.
Select [��ǰ��], Sum([�ǸŰ���]) As [�Ǹ��հ�]
From Orders
Where [�ǸŰ���] >=5			-- ���� �ʵ忡 ���� ���� ���� ó��
Group By [��ǰ��]				-- ���� ����
Having Sum([�ǸŰ���]) >= 7		-- �����Լ��� ���� ���� ó��
Order By [��ǰ��] Asc;