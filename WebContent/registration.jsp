<%@page import="com.sun.java.swing.plaf.windows.resources.windows_zh_CN"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows_de"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="css/my.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	var isemail = /^\w+([-\.]\w+)*@\w+([\.-]\w+)*\.\w{2,4}$/;
	var hasspace = /\s/;
	var isphone = /1[3-8]+\d{9}/;
	var iszipcode= /^[1-9][0-9]{5}$/;
	var flag=0;
	
	function cheakuserName(){
		var userName = document.getElementById("userName").value;
		if(userName.length==0 || hasspace.test(userName)){
			document.getElementById("a1").innerHTML="请输入正确的用户名";
			flag|=1;
			return false;
		}
		document.getElementById("a1").innerHTML="";
		flag&=-2;
	}
	
	function cheakrealName(){
		var realName = document.getElementById("realName").value;
		if(realName.length==0 || hasspace.test(realName)){
			document.getElementById("a2").innerHTML="请输入正确的真实姓名";
			flag|=2;
			return false;
		}
		document.getElementById("a2").innerHTML="";
		flag&=-3;
	}
	
	function cheakpassword(){
		var password = document.getElementById("password").value;
		if(password.length==0 || hasspace.test(password)){
			document.getElementById("a3").innerHTML="请输入正确的密码";
			flag|=4;
			return false;
		}
		document.getElementById("a3").innerHTML="";
		flag&=-5;
	}
	
	function cheakpasswordConfirm(){
		var password = document.getElementById("password").value;
		var passwordConfirm = document.getElementById("passwordConfirm").value;
		if(password!=passwordConfirm){
			document.getElementById("a4").innerHTML="两次密码输入不相同";
			flag|=8;
			return false;
		}
		document.getElementById("a4").innerHTML="";
		flag&=-9;
	}
	
	function cheakphone(){
		var phone = document.getElementById("phone").value;
		if(phone.length==0 || !isphone.test(phone)){
			document.getElementById("a5").innerHTML="请输入正确的电话号码";
			flag|=16;
			return false;
		}
		document.getElementById("a5").innerHTML="";
		flag&=-17;
	}
	
	function cheakaddress(){
		var address = document.getElementById("address").value;
		if(address.length==0 || hasspace.test(address)){
			document.getElementById("a6").innerHTML="请输入正确的地址";
			flag|=32;
			return false;
		}
		document.getElementById("a6").innerHTML="";
		flag&=-33;
	}
	
	function cheakzipcode(){
		var zipcode = document.getElementById("zipcode").value;
		if(zipcode.length==0 || !iszipcode.test(zipcode)){
			document.getElementById("a7").innerHTML="请输入正确的邮政编码";
			flag|=64;
			return false;
		}
		document.getElementById("a7").innerHTML="";
		flag&=-65;
	}
	
	function cheakemail(){
		var email = document.getElementById("email").value;
		if(email.length==0 || !isemail.test(email)){
			document.getElementById("a8").innerHTML="请输入正确的电子邮箱";
			flag|=128;
			return false;
		}
		document.getElementById("a8").innerHTML="";
		flag&=127;
	}
	
	function checksubmit() {
		if(flag>0) {
			return false;
		}
	}
</script>
</head>
<body topmargin="0">
	<table width="80%" border="1" align="center">
		<tr>
			<td height="112" align="center"><jsp:include page="head.jsp"
					flush="true"></jsp:include></td>
		</tr>
		<tr>
			<td height="244" align="center"><form id="form1" name="form1"
					method="post" action="/ShoppingMall/RegistrationCl" >
					<table width="600" border="0">					
						<%
							String info = (String) request.getAttribute("info");
							String userName = (String) request.getAttribute("userName");
							String realName = (String) request.getAttribute("realName");
							String password = (String) request.getAttribute("password");
							String passwordConfirm = (String) request.getAttribute("passwordConfirm");
							String phone = (String) request.getAttribute("phone");
							String address = (String) request.getAttribute("address");
							String zipcode = (String) request.getAttribute("zipcode");
							String email = (String) request.getAttribute("email");
						%>
						<tr>
							<td width="45%" align="right"><span class="abc">用&nbsp;户&nbsp;名：</span></td>
							<td width="55%" align="left"><span class="abc"> <input onblur="cheakuserName()"
									type="text" name="userName" id="userName" value="<%=userName==null?"":userName %>" />
									<font color="red"><b id="a1"></b></font>
							</span></td>
						</tr>
						<tr>
							<td align="right"><span class="abc">真实姓名：</span></td>
							<td align="left"><span class="abc"> <input onkeyup="aa()" onblur="cheakrealName()"
									type="text" name="realName" id="realName" value="<%=realName==null?"":realName %>" />
									<font color="red"><b id="a2"></b></font>
							</span></td>
						</tr>
						<tr>
							<td align="right"><span class="abc">密&nbsp;&nbsp;&nbsp;&nbsp;码：</span></td>
							<td align="left"><span class="abc"> <input onblur="cheakpassword()"
									type="password" name="password" id="password" value="<%=password==null?"":password %>" />
									<font color="red"><b id="a3"></b></font>
							</span></td>
						</tr>
						<tr>
							<td align="right"><span class="abc">确认密码：</span></td>
							<td align="left"><span class="abc"> <input onblur="cheakpasswordConfirm()"
									type="password" name="passwordConfirm" id="passwordConfirm" value="<%=passwordConfirm==null?"":passwordConfirm %>" />
									<font color="red"><b id="a4"></b></font>
							</span></td>
						</tr>
						<tr>
							<td align="right"><span class="abc">电话号码：</span></td>
							<td align="left"><span class="abc"> <input onblur="cheakphone()"
									type="text" name="phone" id="phone" value="<%=phone==null?"":phone %>" />
									<font color="red"><b id="a5"></b></font>
							</span></td>
						</tr>
						<tr>
							<td align="right"><span class="abc">详细地址：</span></td>
							<td align="left"><span class="abc"> <input onblur="cheakaddress()"
									type="text" name="address" id="address" value="<%=address==null?"":address %>" />
									<font color="red"><b id="a6"></b></font>
							</span></td>
						</tr>
						<tr>
							<td align="right"><span class="abc">邮政编码：</span></td>
							<td align="left"><span class="abc"> <input onblur="cheakzipcode()"
									type="text" name="zipcode" id="zipcode" value="<%=zipcode==null?"":zipcode %>" />
									<font color="red"><b id="a7"></b></font>
							</span></td>
						</tr>
						<tr>
							<td align="right"><span class="abc">电子邮件：</span></td>
							<td align="left"><span class="abc"> <input onblur="cheakemail()"
									type="text" name="email" id="email" value="<%=email==null?"":email %>" />
									<font color="red"><b id="a8"></b></font>
							</span></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><span class="abc"> <input
									type="submit" value="同意协议并注册" onclick="return checksubmit()" />
							</span></td>
						</tr>
					</table>
				</form></td>
		</tr>
		<tr>
			<td height="119" align="center"><jsp:include page="tail.jsp"
					flush="true"></jsp:include></td>
		</tr>
		<%
			if (info != null) {
				out.println("<script type='text/javascript'>window.alert('"+info+"');</script>");
			}
		%>
	</table>
</body>
</html>