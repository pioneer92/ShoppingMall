<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/my.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0">
	<table width="80%" border="1" align="center">
		<tr>
			<td height="112" colspan="2" align="center"><jsp:include
					page="head.jsp" flush="true"></jsp:include></td>
		</tr>
		<tr>
			<td width="25%" height="244" align="center">
			<h1>注册成功</h1>
				<form name=loading>
					<p align=center>
						<font color="#0066ff" size="2">正在跳转，请稍等</font><font
							color="#0066ff" size="2" face="Arial">...</font> <input type=text
							name=chart size=36
							style="font-family: Arial; font-weight: bolder; color: #0066ff; background-color: #fef4d9; padding: 0px; border-style: none;">

						<input type=text name=percent size=5
							style="color: #0066ff; text-align: center; border-width: medium; border-style: none;">
						<script>
							var bar = -2;
							var line = "||";
							var amount = "||";
							count();
							function count() {
								bar = bar + 3;
								amount = amount + line;
								document.loading.chart.value = amount;
								document.loading.percent.value = bar + "%";
								if (bar < 100) {
									setTimeout("count()", 100);
								} else {
									window.location = "index.jsp";
								}
							}
						</script>
					</p>
				</form>
				<p align="center">
					如果您的浏览器不支持跳转,<a style="text-decoration: none"
						href="index.jsp"><font color="#FF0000">请点这里</font></a>.
				</p>
			</td>
		</tr>
		<tr>
			<td height="119" colspan="2" align="center"><jsp:include
					page="tail.jsp" flush="true"></jsp:include></td>
		</tr>
	</table>
</body>
</html>