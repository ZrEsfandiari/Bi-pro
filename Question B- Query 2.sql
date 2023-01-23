-- Question B
-- As I didn't have enough time to deal with the damn ERRORs to learn about a loop in Postgresql (I used to work
-- with javaDB) I just decide to do it one by one level to fill all the NULL cells  :)))))))

alter table public."OrganizationChart"
add column "Level" integer;

update public."OrganizationChart"
set "Level" = 1
where "managerID" iS NULL

update public."OrganizationChart"
set "Level" = 2
where "managerID" in (select "ID"
					  From public."OrganizationChart"
					  where "Level" =1)

update public."OrganizationChart"
set "Level" = 3
where "managerID" in (select "ID"
					  From public."OrganizationChart"
					  where "Level" =2)

update public."OrganizationChart"
set "Level" = 4
where "managerID" in (select "ID"
					  From public."OrganizationChart"
					  where "Level" =3)

update public."OrganizationChart"
set "Level" = 5
where "managerID" in (select "ID"
					  From public."OrganizationChart"
					  where "Level" =4)

update public."OrganizationChart"
set "Level" = 6
where "managerID" in (select "ID"
					  From public."OrganizationChart"
					  where "Level" =5)
-- do $$
-- Begin
-- for cnt in 1..6 loop 
--   update public."OrganizationChart"
--   set "Level" = cnt+1
--   where "managerID" in (select "ID"
-- 	  				    From public."OrganizationChart"
-- 					    where "Level" =cnt)
--   end loop;
-- end;
-- $$;
-- why the hell it's not working :| 
