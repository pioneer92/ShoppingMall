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
		<table width="80%" border="1" align="center">
		  <tr>
		    <td height="112" colspan="2" align="center">
				<jsp:include page="head.jsp" flush="true"></jsp:include>
			</td>
		  </tr>
		  <tr>
		    <td width="25%" height="244" align="center">
				<jsp:include page="left.jsp" flush="true"></jsp:include>
			</td>
		    <td width="75%" align="center">
		    	<jsp:include page="right.jsp" flush="true"></jsp:include>
		    </td>
		  </tr>
		  <tr>
		    <td height="119" colspan="2" align="center">
				<jsp:include page="tail.jsp" flush="true"></jsp:include>
			</td>
		  </tr>
		</table>
	</body>
</html>