-- ��¥ ���� �Լ�

-- ��ü �ð�
Select GetDate()

-- �⵵
Select Year(GetDate())

-- ��
Select Month(GetDate())

-- ��
Select Day(GetDate())

-- 2018�� ũ�������� ��ĥ ���Ҵ���?
Select DateDiff(dd, GetDate(), '2018-12-25')

-- ������ ����¥�� ��ĥ ��ƿԴ���?
Select DateDiff(dd, '1991-10-15', GetDate())