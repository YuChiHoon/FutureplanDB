-- �ּ� : ����/���� ������
--[1] ���� �ּ�
--(���� ������) �ڷ� ������ ��� ���ڿ��� �ּ�(����)���� ó���ȴ�.
--[2] ������ �ּ�
/*
�����ú�ǥ�� ��ǥ������ ���̿� �ִ� ��� SQL����
�ּ�(����)���� ó���ȴ�.
*/

Create Table Memos
(
	Num Int Identity(1,1) Primary Key Not Null,
	Name VarChar(10),
	Email VarChar(50),
	Title VarChar(200)
)
Go

-- ���� ����
--[1] ���� ����
Declare @i Int
--[2] ���� �ʱ�ȭ
Set @i = 10
--[3] ���� ����(���)
Select @i
Go
--Print @i
--Go

--[4] �������� ���� ����
Declare
	@Name VarChar(10),
	@Email VarChar(50),
	@Title VarChar(200)
--[5] ���� �ʱ�ȭ
Set @Name = ''
Set @Email = ''
Set @Title = ''
--[6] Memos ���̺� �ʵ尪�� ������ ����
Select
	@Name = Name,
	@Email = Email,
	@Title = Title
From Memos
Where Num = 1
--[7] ���� �� ���
Select @Name, @Email, @Title
Go

--[0] ��� ������
Select 3+4
Select 3-4

--[1] % ������ : ������ �����ڶ�� ��
Select 3 % 4					-- 3 ������ 4�� ���� ���. �� : 0, ������ : 3, �� �� ��������

--[2] ���ڿ� ���� ���� : '+' ������ ���
Select '�ȳ�' + '�ϼ���'		-- �ȳ��ϼ���

--[3]��
-- >, >=, <, <=
Select * From Memos Where 3 > 4		-- ������ ����
Go
Select * From Memos Where 3 = 4		-- ������ ����
Go
Select * From Memos Where 3 <> 4	-- ���� �ٸ���
Go

-- �ⱳ�� �ڵ�(?) : ������ ���� : SQL ������(��ŷ)
Select * From Memos Where 1 = 1
Go

--[0] ��
-- Or(||) : �ϳ��� ���̸�, ��
Select * From Memos Where (3 = 4) Or (3 <> 4)
Go
-- And(&&) : �Ѵ� ���϶�����, ��
Select * From Memos Where (3 = 4) And (3 <> 4)
Go

-- ���ǹ�
--[1] ���� ����
Declare @testNum Int
--[2] ���� �ʱ�ȭ
Set @testNum = 3
--[3] ���� ���
If(@testNum % 2) = 0		-- ������ 2�� �������� �� �������� 0�̸� ¦��
	Select '¦���Դϴ�.'
Else
	Select 'Ȧ���Դϴ�.'
Go

-- �ܹ��� �ƴ϶� ������ ���� Begin~End ������ ����Ѵ�.
Declare @Num Int
Set @Num = 10

If(@Num % 2) = 0		-- ������ 2�� �������� �� �������� 0�̸� ¦��
	Begin
		Select '¦���Դϴ�.'
		Select '¦���Դϴ�.'
	End
Else
	Begin
		Select 'Ȧ���Դϴ�.'
		Select 'Ȧ���Դϴ�.'
	End
Go

-- �ݺ���
--[1] �Ʒ� ������ 100�� ����(F5)
Insert Memos Values('ȫ�浿', 'h@h.com', 'ȫ�浿�Դϴ�.')
Go
--[2] �Ʒ� Insert���� 100�� ���� : While��
Declare @i Int
Set @i = 1					--[a] �ʱ��
While @i < 100				--[b] ���ǽ�
	Begin
		Insert Memos
		Values('ȫ�浿', 'h@h.com', 'ȫ�浿�Դϴ�.')
		Set @i = @i + 1		--[c] ������
	End
Go

-- 1���� 100������ ��
Declare @testNum int , @testSum int
Set @testNum = 0
Set @testSum = 0

--Select @testNum, @testSum
While 1 = 1 -- ���� ����
	Begin
		Set @testSum = @testSum + @testNum		-- 1~100 ������ �� ����
		Set @testNum = @testNum + 1				-- @Num�� 1�� ����
		If @testNum > 100						-- 100���� ũ�� While�� ����
			Break								-- 100������ ���
		Else									-- 100���� ũ�� �������� ��� ����
			Continue
	End
Print '1���� 100������ ��'
Print @testSum
Go

--[����] 1���� 100������ �� : 2550
Declare @testNum int , @testSum int
Set @testNum = 0
Set @testSum = 0

--Select @testNum, @testSum
While 1 = 1 -- ���� ����
	Begin
		If @testNum % 2 = 0
			Set @testSum = @testSum + @testNum
			
		Set @testNum = @testNum + 1	
		If @testNum > 100
			Break
		Else
			Continue
	End
Print '1���� 100������ ¦���� ��'
Print @testSum
Go