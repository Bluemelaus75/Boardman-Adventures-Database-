/* Final Projects Procedures 

--> Stored Acc.Rev. Procedure

Use BoardmanAdventures
Go
Create Proc spAccountsRecievable
as

Select PaymentID, FirstName, LastName, Phone, CreditCompany, TotalTripCost
From CustomerPayment Join GroupParticipants
On CustomerPayment.ParticipantID = GroupParticipants.ParticipantID
Where PaymentType = 'CREDT'
Order BY TotalTripCost

Exec spAccountsRecievable;

--> Stored Procedure to pull up the Scheduled Trips based on Trip Types
Use BoardmanAdventures;
Go
Create Proc spTripCounts
	@TripType nvarchar (40) = '%'
As 
Begin
	Select GroupID, TripCode, ArrivalTime, EmployeeID
	From Groups
	Where TripCode Like @TripType;
END
GO 

Exec spTripCounts '%PM';
Exec spTripCounts '%AM';

--> Proceedure that pulls up info of customers with missing AoR Waivers based on GroupIDs
Use BoardmanAdventures;
Go
Create Proc spMissingAoRWaiverSearchByGroupID
	@GroupID nvarchar (40) = '%'
As 
Begin
	If @GroupID IS NULL 
		Select GroupID, FirstName, LastName, Age, AoRWaiver
			From GroupParticipants 
				Where AoRWaiver = 'N' 
				Order by GroupID
	Else 
		Select GroupID, FirstName, LastName, Age, AoRWaiver
			From GroupParticipants
				Where GroupID LIKE @GroupID AND AoRWaiver = 'N'
				Order By GroupID
END
GO  

Exec spMissingAoRWaiverSearchByGroupID '%'
Exec spMissingAoRWaiverSearchByGroupID 'Rohan%'

--> Procedure that returns the # of a specifc Job Types in our Employee database
Create Proc spJobCodeCount
		@JobID varchar (10) = NULL 
as 
begin
	If @JobID is NULL
		Select JobID from Employees;
	Else 
		
		
		Declare @JobCount int;

		Select @JobCount = COUNT(@JobID)
			From Employees
			Where JobID = @JobID

	Return @JobCount
end


Exec spJobCodeCount 
Exec spJobCodeCount 'R1'






Final Project User Defined Functions

--> Uses the Firstname of the customer to pull up information about the Customer
Use BoardmanAdventures;
Go
Create Function fnParticipantName
		(@FirstName varchar(15))
		Returns varchar(10)
	Begin
		Return (Select ParticipantID from GroupParticipants Where FirstName = @FirstName)
	End;


Select FirstName, LastName, Age
From GroupParticipants
Where ParticipantID = dbo.fnParticipantName('Jake');


--> Searches for ALL of a groups info by inputting the Group Name
Use BoardmanAdventures;
GO
Create function fnGroupSearch
	(@GroupName varchar(30))
	Returns table
Return
	(Select * from GroupParticipants where @GroupName = GroupParticipants.GroupID);

	Select * from dbo.fnGroupSearch('Rohan 1');
	Select * from dbo.fnGroupSearch('YL East Bay2');
	Select * from dbo.fnGroupSearch('Shannon');
	








Final Project Triggers 


--> I first created a new Table in our BoardmanDB that mirrors the format of our Employees Table
--> Then, we created a trigger that activates when data is DELETED from the Employees table 
--> The activated triggor takes the data that is deleted and moves it into the Prev.Employ.Arch Table

Use BoardmanAdventures
If ('trgEmployees_Delete') Is not Null
Drop Trigger trgEmployees_Delete
GO

Create Trigger trgEmployees_Delete 
	ON Employees 
	After Delete As
Begin
	Insert Into PreviousEmployeeArchive
	Select * From deleted;
End




Go

Use BoardmanAdventures
Delete From Employees
Where LastName = 'Corwin'



Select * From PreviousEmployeeArchive


*/
-->
