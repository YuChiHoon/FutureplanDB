-- Create/Alter/Drop/Insert/Select/Update/Delete�� ����

--[1] ���̺� ����
Create Table dbo.Sample
(
	Num Int Identity(1,1) Primary Key,
	Name NVarChar(25),
	Age Int Default 21
)
Go

--[2] ���̺� ���� ����  --��ü Ž����� �ϴ°� �� ����
--Alter Table dbo.Sample
--(
--
--)
--Go

--[3] ���̺� ���� ����
--Drop Table dbo.Sample
--Go

--[4] ������ �Է�
Insert Into Sample(Name, Age) Values(N'ȫ�浿', 21)
Insert Into Sample(Name, Age) Values(N'ȫ�浿', Default)
Insert Sample(Name, Age) Values(N'ȫ�浿', 21)
Insert Sample Select Top 3 Name, Age From Sample		-- ���� 3�� �����ؼ� �߰�
Select * Into NewSample From Sample						-- Sample���̺��� NewSample ���̺� ���� �� ���� ����
Select * From NewSample
insert Sample Output Inserted.* Values(N'ȫ�浿',21)	-- �߰� ���ÿ� ���â�� ���
Go

--[5] ������ ���
Select * From Sample
Select Num, Name, Age From Sample
Select * From Sample Where Num > 10
Select * From Sample Where Name Like N'%ȫ%'
Select * From Sample Where Num In (2,4,6)
Select * From Sample Where (Num % 2 = 0)
Select Avg(Age) From Sample
Go

--[6] ������ ����
Begin Tran								-- ���
	Update Sample
	Set Name = N'��λ�', Age = 100
	Where Num = 1
--RollBack Tran							-- �ǵɸ���
Commit Tran								-- ��� ����
Go

--[7] ������ ����
Delete Sample
Where Name Like N'%��%'
Go