/* 

Author: Chris Kibble
Last Updated: 2020-08-28

Returns all MAC Address(es) for given hostname, attempting to drop the most common junk.

*/

select v_r_system.name0
	 , v_GS_NETWORK_ADAPTER.MACAddress0
	 , v_GS_NETWORK_ADAPTER.ProductName0
  from v_R_System
  left join v_GS_NETWORK_ADAPTER
    on v_r_system.ResourceID = v_GS_NETWORK_ADAPTER.ResourceID
 where v_r_system.Name0 = 'HOST001'
   and v_GS_NETWORK_ADAPTER.macaddress0 is not null
   and v_GS_NETWORK_ADAPTER.productname0 != 'Microsoft Virtual WiFi Miniport Adapter'
   and v_GS_NETWORK_ADAPTER.productname0 != 'RAS Async Adapter'
   and v_GS_NETWORK_ADAPTER.ProductName0 != 'Microsoft Network Adapter Multiplexor Driver'
   and v_GS_NETWORK_ADAPTER.ProductName0 != 'Microsoft KM-TEST Loopback Adapter'   and ProductName0 not like 'VMWare%'
   and v_GS_NETWORK_ADAPTER.ProductName0 not like 'Bluetooth%'
   and v_GS_NETWORK_ADAPTER.productname0 not like '%VirtualBox%'
   and v_GS_NETWORK_ADAPTER.productname0 not like 'Cisco AnyConnect%'
   and v_GS_NETWORK_ADAPTER.productname0 not like 'WAN Miniport%'
   and v_GS_NETWORK_ADAPTER.productname0 not like 'Microsoft Wi-Fi Direct%'
