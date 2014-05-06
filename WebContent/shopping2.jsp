<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/my.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#CEFFD4" topmargin="0">
<table  width="80%" border="1" align="center">
  <tr>
    <td align="center">
		<jsp:include page="head.jsp" flush="true"></jsp:include>
	</td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0">
      <tr>
        <td align="center"></td>
      </tr>
      <tr>
        <td align="center"><table width="44%" border="0" align="center">
          <tr>
            <td width="245" height="254" rowspan="2" align="center"><img src="images/20140426131019.png" width="242" height="196" /></td>
            <td width="358" height="80" colspan="3" align="center" valign="bottom"><img src="images/20140426131222.png" width="234" height="66" /></td>
            </tr>
          <tr>
            <td height="101" colspan="3" align="center" valign="top"><form name="form3" method="post" action="/ShoppingMall/LoginCl"><table width="100%" border="0">
              <tr>
                <td width="24%" height="26" align="center">用户名：</td>
                <td colspan="2" align="left">
                  <input type="text" name="username" id="username" />
                </td>
                </tr>
              <tr>
                <td height="27" align="center">密&nbsp;&nbsp;码：</td>
                <td colspan="2" align="left"><input type="password" name="password" id="password" /></td>
                </tr>
              <tr>
                <td height="30" align="center">&nbsp;</td>
                <td width="26%" align="left">
                  <input type="checkbox" name="checkbox" id="userkeep" />
               		 记住我
                </td>
                <td width="50%" align="left">忘记密码？</td>
              </tr>
              <tr>
                <td width="24%" align="center">&nbsp;</td>
                <td align="left">
                  <input type="submit" name="button" id="button" value="登陆" />
                </td>
                <td align="left"><input type="button" name="button2" id="button2" value="注册" /></td>
              </tr>
            </table></form></td>
          </tr>
          <tr>
            <td height="89" colspan="4" align="center"><img src="images/20140426130505.png" width="607" height="87" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="right"><img src="images/next.png" width="80" height="29" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center">
		<jsp:include page="tail.jsp" flush="true"></jsp:include>
	</td>
  </tr>
</table>
</body>
</html>