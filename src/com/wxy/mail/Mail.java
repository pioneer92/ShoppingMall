package com.wxy.mail;

public class Mail {
	public static void main(String[] args){
        //�������Ҫ�������ʼ�
	  MailSenderInfo mailInfo = new MailSenderInfo(); 
	  mailInfo.setMailServerHost("smtp.qq.com"); 
	  mailInfo.setMailServerPort("25"); 
	  mailInfo.setValidate(true); 
	  mailInfo.setUserName("1024426365"); 
	  mailInfo.setPassword("woyaoaini1314");//������������ 
	  mailInfo.setFromAddress("1024426365@qq.com"); 
	  mailInfo.setToAddress("1024426365@qq.com"); 
	  mailInfo.setSubject("�����������"); 
	  mailInfo.setContent("������������"); 
        //�������Ҫ�������ʼ�
	  SimpleMailSender sms = new SimpleMailSender();
         sms.sendTextMail(mailInfo);//���������ʽ 
        // sms.sendHtmlMail(mailInfo);//����html��ʽ
	}


}
