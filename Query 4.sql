-- Question 4
select distinct "Customer" , 
       SUM("Quantity" * "UnitPrice") as "Total Price",
	   Count("OrderID") as "bills num" ,
	   SUM("Quantity") as "Item num"
From "Sales"
Where "Customer" in (select "Customer" 
					 From "Sales" as s
					 Group BY "OrderID","Customer" 
					 Having SUM("Quantity" * "UnitPrice") >1500
					 )
Group by "Customer"
Order by "Customer"










