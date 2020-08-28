/* 

Author: Chris Kibble
Last Updated: 2020-08-28

Returns count of systems by inventoried resolution.  You may want to restrict this to clients Operating Systems if that's your primary focus.

*/

select cast(v_GS_VIDEO_CONTROLLER.CurrentHorizontalResolution0 as varchar) + 'x' + cast(v_GS_VIDEO_CONTROLLER.CurrentVerticalResolution0 as varchar) as ResolutionFinal
     , count(*)
  from v_r_system
  join v_GS_VIDEO_CONTROLLER
    on v_R_System.resourceid = v_GS_VIDEO_CONTROLLER.ResourceID
 where v_GS_VIDEO_CONTROLLER.CurrentHorizontalResolution0 is not null
   and v_GS_VIDEO_CONTROLLER.CurrentVerticalResolution0 is not null
 group by cast(v_GS_VIDEO_CONTROLLER.CurrentHorizontalResolution0 as varchar) + 'x' + cast(v_GS_VIDEO_CONTROLLER.CurrentVerticalResolution0 as varchar)
 order by count(*) desc;