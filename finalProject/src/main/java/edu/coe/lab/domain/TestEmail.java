package edu.coe.lab.domain;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

public class TestEmail {
	 
  
    public static void send(String receiver, String title, String message) {  
        SimpleEmail email = new SimpleEmail();  
        email.setTLS(true);  
        email.setHostName("smtp.qq.com");  
        email.setSmtpPort(465);
        email.setSSL(Boolean.TRUE); 
        email.setAuthentication("603544395@qq.com", "longlong636389"); 
        try {  
            email.addTo(receiver);
            email.setFrom("603544395@qq.com"); 
            email.setSubject(title);   
            email.setMsg(message); 
            email.send();  
        } catch (EmailException e) {  
            e.printStackTrace();
            
        }  
    }  
}
