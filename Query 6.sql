-- Question 6
select count (*)
From (select "Customer" , "Date"
	  From Public."Sales"
	  Group by "Customer" , "Date") as "salesPerDay"
