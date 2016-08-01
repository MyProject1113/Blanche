package com.blanche.user.common.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class IPConfigUtil {
	/** IP 주소 얻기
	 * @return	<strong>String</strong>
	 */
	public static String getIP() {
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
}