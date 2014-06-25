package com.wxy.mail;

public class Mail {
	public static void main(String[] args){
        //这个类主要是设置邮件
	  MailSenderInfo mailInfo = new MailSenderInfo(); 
	  mailInfo.setMailServerHost("smtp.qq.com"); 
	  mailInfo.setMailServerPort("25"); 
	  mailInfo.setValidate(true); 
	  mailInfo.setUserName("1024426365"); 
	  mailInfo.setPassword("woyaoaini1314");//您的邮箱密码 
	  mailInfo.setFromAddress("1024426365@qq.com"); 
	  mailInfo.setToAddress("1024426365@qq.com"); 
	  mailInfo.setSubject("设置邮箱标题"); 
	  mailInfo.setContent("设置邮箱内容"); 
        //这个类主要来发送邮件
	  SimpleMailSender sms = new SimpleMailSender();
         sms.sendTextMail(mailInfo);//发送文体格式 
        // sms.sendHtmlMail(mailInfo);//发送html格式
	}


}
