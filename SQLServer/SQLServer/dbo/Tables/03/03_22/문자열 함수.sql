-- ���ڿ� ���� �Լ�

Declare @s NVarChar(20)
Set @s = N' Abc Def Fed Cba '

-- ��ü ���
Select @s

-- ���ڿ��� ����
Select Len(@s)		-- �ڿ� ���� ���� ����

-- ���� ����
Select LTrim(@s)	-- ���� ��� ����
Select RTrim(@s)	-- ����(������ ���� ����)

-- ��� �빮�ڷ� ǥ��
Select Upper(@s)

-- ��� �ҹ��ڷ� ǥ��
Select Lower(@s)

-- ���ʿ��� 6�� ���
Select Left(@s,6)

-- �����ʿ��� 6�� ���
Select Right(@s,6)

-- �Ųٷ� ���
Select Reverse(@s)

-- Ư�� ���ڿ��� ã�Ƽ� ������ ��ȯ(ġȯ)
Select Replace(@s, N'Abc', N'���ݸ�')

-- Ư�� ���ڿ� �ݺ�
Select Replicate(N'�ȳ�', 10)

-- ����(Space)�� ������ ���
Select'[' + Space(10) + ']'

-- �������� ���ڿ��� ��ȯ
Select Str(12345) + '6789'

-- ���ڿ� �˻� : ������ ���� �˻�
Select SubString(@s,6,3)

-- Ư�� ���ڿ��� ��ġ�� �˻�
Select CharIndex(N'Def',@s)		--6��° ��ġ�� �����Ѵ�.