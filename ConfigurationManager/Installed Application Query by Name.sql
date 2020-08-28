/* 

Author: Chris Kibble
Last Updated: 2020-08-28

Returns all systems with Operating System that have a specific application in their Add/Remove Programs Hardware Inventory.

*/

select v_r_system.Name0
     , v_GS_OPERATING_SYSTEM.Caption0
     , v_Add_Remove_Programs.Publisher0
	 , v_Add_Remove_Programs.DisplayName0
	 , v_Add_Remove_Programs.Version0
	 , v_Add_Remove_Programs.InstallDate0
  from v_R_System
  join v_Add_Remove_Programs
    on v_R_System.ResourceID = v_Add_Remove_Programs.ResourceID
  left join v_GS_OPERATING_SYSTEM
    on v_r_system.ResourceID = v_GS_OPERATING_SYSTEM.ResourceID
 where v_Add_Remove_Programs.DisplayName0 = 'Teams Machine-Wide Installer'
