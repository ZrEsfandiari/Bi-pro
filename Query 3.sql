-- Question 3
Select "Product", SUM("Quantity") as "Total num",
       SUM(("UnitPrice"*"Quantity")) as "Total Price"
From Public."Sales"
Group by "Product"
Order by "Product"