/* Final Project Views - Boardman Adventures 


Create View GroupPayment AS
	Select GroupID, PaymentType, TotalTripCost
	From CustomerPayment
	
Create View YoungLifeGuests AS
	Select * from GroupParticipants
	Where LEFT(GroupID, 2) = 'YL'
	
Create View EmployeeSchedule AS
	Select * from Employees
	
Create View EmployeeSchedule AS
Select FirstName, LastName, JobID, GroupID AS GroupName, ArrivalTime As GuestArrival
From Employees
LEFT JOIN Groups
on Groups.EmployeeID = Employees.EmployeeID

Update UpdateEmployees
Set Address = '111 Milky Way Lane'
Where FirstName = 'Thomas' and LastName = 'Corwin'

Update UpdateEmployees
Set LastName = 'Schwartz', Address = '732 Forth Port'
Where FirstName = 'Mckenzie' and JobID = 'A2'

Select * from NewEmployee
*/