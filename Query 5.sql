-- Question 5
select tota."TotalPrice", tota."ProfitPrice", (("ProfitPrice"*100)/ "TotalPrice") as "TotalProfitRaito"
from (select SUM("UnitPrice" * "Quantity") as "TotalPrice",
             SUM(("UnitPrice" * "ProfitRaito" * "Quantity")/100) as "ProfitPrice"
      From (select S."SalesID", S."Product", S."Quantity", S."UnitPrice" ,
	        CASE WHEN sp."ProfitRaito" is NULL THEN 10 ELSE "ProfitRaito" END AS "ProfitRaito" 
	        from "Sales" as S 
	        left join "SaleProfit" as sp
	        on S."Product" = sp."Product") as j
      ) as tota
	  