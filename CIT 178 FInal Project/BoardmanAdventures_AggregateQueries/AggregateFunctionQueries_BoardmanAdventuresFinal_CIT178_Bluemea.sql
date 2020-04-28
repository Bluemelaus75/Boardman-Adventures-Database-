/* Aggregate Queries Final Lab 

Query 1
Use BoardmanAdventures;
Select COunt(DepositPayed) As DepositsPayed
From CustomerPayment
Where PaymentType = 'CREDT';



Query 2
Use BoardmanAdventures
Select GroupID, Min(Age) AS 'YoungestParticipant', MAX(Age) AS 'OldestParticipant'
From GroupParticipants
Group by GroupID
Order by GroupID;




Query 3
Use BoardmanAdventures
Select TripCode, Count(GroupID) AS '# of Trips'
From Groups
Group By TripCode
Order by TripCode;




Query 4
Use BoardmanAdventures
Select TripCode, Count(ParticipantID) As 'TotalParticipants'
From GroupParticipants
Join Groups ON Groups.GroupID = GroupParticipants.GroupID
Group BY TripCode
Order BY TripCode;




Non-functioning Query
Use BoardmanAdventures
Select TripCode, Sum(TotalTripCost) AS 'Total Revenue'
From CustomerPayment
Join Groups ON Groups.GroupID = CustomerPayment.GroupID 
Group BY TripCode
Order BY TripCode;
*/