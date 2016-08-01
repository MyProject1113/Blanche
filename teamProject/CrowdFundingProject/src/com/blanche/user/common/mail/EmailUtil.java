package com.blanche.user.common.mail;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.EmailConstants;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.log4j.Logger;

import com.blanche.user.accredit.vo.UserAccreditVO;

public class EmailUtil {
	private static Logger logger = Logger.getLogger(EmailUtil.class);
	
	public static boolean sendAccredit(UserAccreditVO param, HttpServletRequest request) {
		HtmlEmail htmlEmail = new HtmlEmail();
		
		// smtp 서버 연결 설정
		htmlEmail.setCharset(EmailConstants.UTF_8);
		htmlEmail.setHostName("smtp.gmail.com");
		htmlEmail.setSmtpPort(587);
		htmlEmail.setAuthentication("prh4099@gmail.com", "vpqmflwm1");
		boolean result = false;
		
		try {
			String requestURL = request.getRequestURL().toString();
			String requestURI = request.getRequestURI();
			String ServerURL = requestURL.substring(0, requestURL.indexOf(requestURI));
			
			// smtp SSL, TLS 설정
			htmlEmail.setSSL(true);
			htmlEmail.setTLS(true);
			
			// 받는사람 설정
			htmlEmail.addTo(param.getUserEmail(), param.getUserName(), "utf-8");
			
			// 보내는 사람 설정
			htmlEmail.setFrom("admin@blanche.com", "운영자", "utf-8");
			
			// 제목 설정 
			htmlEmail.setSubject("Blanche 가입 인증번호");
			
			// 본문 설정
			
			StringBuffer sb = new StringBuffer();
			sb.append("<p>아래의 주소로 접속하시면 인증이 완료됩니다.</p>");
			sb.append("<a href=\"");
			sb.append(ServerURL);
			sb.append("/user/accredit.do?us_index=");
			sb.append(param.getUs_index());
			sb.append("&usacd_code=");
			sb.append(param.getUsacd_code());
			sb.append("&usacd_type=");
			sb.append(param.getUsacd_type());
			sb.append("\">");
			sb.append(ServerURL);
			sb.append("/user/accredit.do?us_index=");
			sb.append(param.getUs_index());
			sb.append("&usacd_code=");
			sb.append(param.getUsacd_code());
			sb.append("&usacd_type=");
			sb.append(param.getUsacd_type());
			sb.append("</a>");
			htmlEmail.setHtmlMsg(sb.toString());
			
			String rtMsg = htmlEmail.send();
			logger.info(rtMsg);
			
			result = true;
		} catch(EmailException e){
			logger.warn("Error", e);
			
			result = false;
		}
		return result;
	}
}