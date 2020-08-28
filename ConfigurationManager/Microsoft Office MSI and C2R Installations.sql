/* 

Author: Chris Kibble
Last Updated: 2020-08-28

Returns Office Installations across environment.

*/

select distinct v_r_system.Name0
	 , case when OFFICE_365.DisplayName0 is not null then OFFICE_365.DisplayName0 else OFFICE_MSI.DisplayName0 end as OfficeProduct
	 , case when OFFICE_365.DisplayName0 is not null then OFFICE_365.Version0 else OFFICE_MSI.Version0 end as OfficeVersion
	 , v_gs_operating_system.caption0
  from v_r_system
  left join v_gs_operating_system
    on v_r_system.resourceid = v_gs_operating_system.resourceid
  left join v_add_remove_programs OFFICE_MSI
    on v_r_system.resourceid = OFFICE_MSI.resourceid
   and OFFICE_MSI.displayname0 like 'Microsoft Office Professional Plus 20%'
   and OFFICE_MSI.InstallDate0 is not null
  left join v_add_remove_programs OFFICE_365
    on v_r_system.resourceid = OFFICE_365.resourceid
   and OFFICE_365.displayname0 like 'Microsoft Office 365 ProPlus%'
 where OFFICE_365.DisplayName0 is not null
    or OFFICE_MSI.DisplayName0 is not null