--[1] ���� ����
Declare @num Int;

--[2] ���� �ʱ�ȭ
Set @num = 1234;

--[3] If���� ����� ���� �Ǵ� : �ܹ�
If @num % 2 = 0
	Select '¦���Դϴ�.'
Else
	Select 'Ȧ���Դϴ�.'
;

--[4] �ܹ��� �ƴ϶� ������ ��쿡�� Begin~End ������ ����Ѵ�. {}��Ȱ
Declare @su Int
Set @su = 1234
If @su % 2 = 0
	Begin					--{
		Select '¦��'
		Select '¦��'
	End						--}
Else
	Begin
		Select 'Ȧ��'
		Select 'Ȧ��'
	End
;