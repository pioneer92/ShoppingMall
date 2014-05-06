<%@page import="com.wxy.model.OrderInfoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	OrderInfoBean orderInfoBean=(OrderInfoBean)request.getAttribute("orderInfoBean");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/my.css" rel="stylesheet" type="text/css" />
</head>
<body bgcolor="#CEFFD4" topmargin="0">
	<table width="80%" border="0" align="center" class="abc">
	  <tr>
	    <td align="center">
			<jsp:include page="head.jsp" flush="true"></jsp:include>
		</td>
	  </tr>
	  <tr>
	    <td align="center"><table width="100%" border="1" align="center" class="abc">
	      <tr>
	        <td colspan="9" align="center">图片</td>
	        </tr>
	      <tr>
	        <td colspan="9" align="center">订单详细信息</td>
	        </tr>
	      <tr>
	        <td align="center">订单号</td>
	        <td align="center">收货人</td>
	        <td align="center">收货地址</td>
	        <td align="center">邮编</td>
	        <td align="center">电话</td>
	        <td align="center">总价</td>
	        <td align="center">用户名</td>
	        <td align="center">电子邮件</td>
	        <td align="center">&nbsp;</td>
	      </tr>
	      <tr>
	        <td align="center"><%=orderInfoBean.getOrdersid() %></td>
	        <td align="center"><%=orderInfoBean.getRealName() %></td>
	        <td align="center"><%=orderInfoBean.getAddress() %></td>
	        <td align="center"><%=orderInfoBean.getZipcode() %></td>
	        <td align="center"><%=orderInfoBean.getPhone() %></td>
	        <td align="center"><%=orderInfoBean.getTotalprice() %>RMB</td>
	        <td align="center"><%=orderInfoBean.getUserName() %></td>
	        <td align="center"><%=orderInfoBean.getEmail() %></td>
	        <td align="center"><a href="showDetail.jsp">查看详情</a></td>
	      </tr>
	      <tr>
	        <td colspan="9" align="center">&nbsp;</td>
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