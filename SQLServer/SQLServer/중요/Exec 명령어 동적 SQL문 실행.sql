-- Exec ��ɾ� : ���� SQL�� ����

--[1] ���� ����
Declare @query As NVarChar(255)

--[2] ������ �� �ʱ�ȭ(SQL��)
-- Print '�ȳ��ϼ���. �ݰ����ϴ�.';
Set @query = 'Print ''�ȳ��ϼ���. �ݰ����ϴ�.'' ';

--[3] ������ ����ִ� ���� SQL�� ����
--Execute(@query);
Exec(@query);		-- ���� ǥ��