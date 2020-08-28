/* 

Author: Chris Kibble
Last Updated: 2020-08-28

Returns all members of v_R_users recursively under a given manager.  Requires that you are inventorying the manager field.

*/

WITH cteEmployees (FullName, DistinguishedName, ManagerID, Department, CostCenter, Title, Country, Location, UserPrincipalName, EmpLevel) AS (

	/* Top Block - Find Anchor Point (Top Manager) */
	select v_r_user.Full_User_Name0
		 , v_r_user.Distinguished_Name0
	     , v_r_user.manager0
		 , v_r_user.department0
		 , v_r_user.departmentnumber0
		 , v_r_user.title0
		 , v_r_user.c0
		 , v_r_user.l0
		 , v_r_user.User_Principal_Name0
		 , 1 as EmpLevel
	  from v_r_user
	 where v_r_user.Mail0 = 'best.boss.ever@github.com'

    UNION ALL 

 select emp.Full_User_Name0
	     , emp.Distinguished_Name0
		 , emp.manager0
		 , emp.department0
		 , emp.departmentnumber0
		 , emp.title0
		 , emp.c0
		 , emp.l0	
		 , emp.User_Principal_Name0
		 , cteEmployees.EmpLevel+1 as EmpLevel
	  from v_r_user emp
      join cteEmployees
	    on emp.manager0 = cteEmployees.DistinguishedName
		
) 
select *
  from cteEmployees
 order by EmpLevel, ManagerID