package com.blanche.usermanage.email;

import java.io.IOException;
import java.util.Random;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.apache.log4j.Logger;



public class email {
	private static Logger logger = Logger.getLogger(email.class);
	
	public static int result;

	
	public static void main(String[] args){
		email emailExample = new email();
		emailExample.sendEmail();
	}
	
	public static void sendEmail(){
		long beginTime = System.currentTimeMillis();
		
		Random random = new Random();
		result = random.nextInt(10000)+1000;
		 
		if(result>10000){
		    result = result - 1000;
		}
		
		SimpleEmail simpleEmail = new SimpleEmail();
		//smtp 서버 연결 설정
		simpleEmail.setHostName("smtp.gmail.com");
		simpleEmail.setSmtpPort(587);
		simpleEmail.setAuthentication("prh4099@gmail.com", "vpqmflwm1");
		String rt = "Failure";
		
		try{			
			simpleEmail.setSSL(true);
			//받는사람 설정
			simpleEmail.addTo("prh0730@nate.com","박래혁","utf-8");
			//보내는 사람 설정
			simpleEmail.setFrom("prh4099@gmail.com","박래혁","utf-8");
			//제목설정 
			simpleEmail.setSubject("인증번호");
			//본문 설정
			simpleEmail.setMsg(result + "");
			rt = simpleEmail.send();
			
		}catch(EmailException e){
			logger.warn("Error",e);
		}
		finally{
			long execTime = System.currentTimeMillis() - beginTime;
			logger.info("exec time: "+execTime+"ms");
			logger.info("RT msg : "+rt);
		}
	}

}
