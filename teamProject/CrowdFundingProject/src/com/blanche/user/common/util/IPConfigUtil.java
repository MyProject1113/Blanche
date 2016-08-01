package com.blanche.user.common.util;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;

public class IPConfigUtil {
	/** IP 주소 얻기
	* @return	<strong>String</strong>
	*/
	public static String getIP() {
		String IP = null;
		try {
			for (Enumeration en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements();) {
				NetworkInterface intf = ( NetworkInterface ) en.nextElement();
				for (Enumeration enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
					InetAddress inetAddress = ( InetAddress ) enumIpAddr.nextElement();
					if (!inetAddress.isLoopbackAddress()) {
						if (inetAddress instanceof Inet4Address) {
							return inetAddress.getHostAddress().toString();
						}
						break;
					}
				}
			}
		} catch (Exception e) {
			IP = null;
			e.printStackTrace();
		} finally {
			if (IP == null || IP.equals("")) {
				IP = "unknown";
			}
		}
		return IP;
	}
	
	/*
	public static String getIP() {
		// 톰캣에서 따로 설정하지 않으면 IPv4 주소가 아닌 IPv6 주소를 얻음.
		String IP = null;
		try {
			ServletRequestAttributes sra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes(); 
			HttpServletRequest hsr = sra.getRequest();
			IP = hsr.getHeader("X-FORWARDED-FOR");
			if (IP == null || IP.length() == 0) {
				IP = hsr.getHeader("WL-Proxy-Client-IP");
     		}
			if (IP == null || IP.length() == 0) {
				IP = hsr.getRemoteAddr();
			}
		} catch (Exception e) {
			IP = null;
			e.printStackTrace();
		} finally {
			if (IP == null || IP.equals("")) {
				IP = "unknown";
			}
		}
		return IP;
	}
	*/
}