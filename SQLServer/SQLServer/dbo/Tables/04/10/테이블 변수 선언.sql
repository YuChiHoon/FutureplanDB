-- ���̺� ����(Table Variable)

-- ���̺� ���� ����
-- ��ġ ����
Declare @Members Table
(
	MemberID	Int Primary Key Not Null,
	MemberName	VarChar(25) Not Null
);

insert @Members Values(1, 'ȫ�浿');
insert @Members Values(2, '��λ�');
insert @Members Values(3, '�Ѷ��');

Select MemberID, MemberName From @Members;
-- ��ġ ��

-- ���̺� ���� ����
-- ��ġ ����
Declare @Members2 Table
(
	MemberID	Int Primary Key Not Null,
	MemberName	VarChar(25) Not Null
);

insert @Members2 Values(1, 'ȫ�浿');
insert @Members2 Values(2, '��λ�');
insert @Members2 Values(3, '�Ѷ��');
Go	-- ��ġ�� �� ��Ȱ

Select MemberID, MemberName From @Members2;
-- ��ġ ��