<%@ page contentType="text/html; charset=gb2312" language="java" errorPage="" %>
<%@ page import="java.sql.*,java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%
String qm ="1125857871"; //����QQ����
String tu = "qq.com"; //������ĺ�׺����
String tto="1024426365@qq.com"; //�����ʼ�������
String ttitle="�ÿռ��������ݿ������޸ĳɹ�֪ͨ��!������ip:";
String tcontent="���Ļ�Ա:zcdnsz ��� haokongjian ��mysql ���ݿ�,�����Ѿ����޸�Ϊ:123456 ���м�! ������ip:127.0.0.1 ,�粻�������˲���˵�����������Ѿ�й©,��������������ϵ! ! ";
Properties props=new Properties();
props.put("mail.smtp.host","smtp."+tu);//���ŵ���������������д�������ǹ�˾�����������Բ����޸ģ�
props.put("mail.smtp.auth","true");
Session s=Session.getInstance(props);
s.setDebug(true);
 
MimeMessage message=new MimeMessage(s);
 
//����Ϣ�������÷�����/�ռ���/����/����ʱ��
InternetAddress from=new InternetAddress("1125857871@"+tu); //�����115798090 ��Ϊ�����ŵ�QQ��
message.setFrom(from);
InternetAddress to=new InternetAddress(tto);
message.setRecipient(Message.RecipientType.TO,to);
message.setSubject(ttitle);
message.setSentDate(new Date());
 
 
//����Ϣ������������
BodyPart mdp=new MimeBodyPart();//�½�һ������ż����ݵ�BodyPart����
mdp.setContent(tcontent,"text/html;charset=gb2312");//��BodyPart�����������ݺ͸�ʽ/���뷽ʽ
Multipart mm=new MimeMultipart();//�½�һ��MimeMultipart�����������BodyPart��
//��(��ʵ�Ͽ��Դ�Ŷ��)
mm.addBodyPart(mdp);//��BodyPart���뵽MimeMultipart������(���Լ�����BodyPart)
message.setContent(mm);//��mm��Ϊ��Ϣ���������
 
message.saveChanges();
Transport transport=s.getTransport("smtp");
transport.connect("smtp."+tu,"1024426365",qm); //�����115798090ҲҪ�޸�Ϊ����QQ����
transport.sendMessage(message,message.getAllRecipients());
transport.close();
%>