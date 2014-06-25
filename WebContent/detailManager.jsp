<%@page import="com.wxy.model.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GoodsBean goodsBean=(GoodsBean)request.getAttribute("goodsInfo");
	String message=(String)request.getAttribute("message");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="css/my.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function returnHall(){
				if(!window.confirm("是否确认修改电影信息?")){
					return false;
				}
			}
			function addGoods(goodsId){
				if(!window.confirm("是否确认删除该电?")){
					return false;
				}
				//window.open("/ShoppingMall/ShoppingClServlet?type=addGoods&goodsId="+goodsId);
			}
			function goBack(){
				window.open("/ShoppingMall/manager.jsp");
			}
		</script>
	</head>
	<body topmargin="0">
		<table width="80%" border="0" align="center">
		  <tr>
		    <td align="center">
				<jsp:include page="head.jsp" flush="true"></jsp:include>
			</td>
		  </tr>
		  <tr>
		    <td height="388" align="center">
		    <form action="/ShoppingMall/ManagerCl" method="post">
		    <input type="hidden" name="cmd" value="updateGoods">
		    <input type="hidden" name="id" value="<%= goodsBean.getGoodsId() %>">
		    <table width="100%" border="1" align="center">
		      <tr>
		        <td width="35%" rowspan="6" align="center"><img src="images/<%= goodsBean.getPhoto() %>" alt="" width="283" height="174" /></td>
		        <td height="65" align="center">电影名称： <input type="text" name="goodsName" value="<%= goodsBean.getGoodsName() %>"></td>
		      </tr>
		      <tr>
		        <td height="30" align="left">ISBM： <%= goodsBean.getGoodsId() %></td>
		      </tr>
		      <tr>
		        <td height="30" align="left">价格： <input type="text" name="goodsPrice" value="<%= goodsBean.getGoodsPrice() %>"> RMB</td>
		      </tr>
		      <tr>
		        <td height="30" align="left">类型： <input type="text" name="type" value="<%= goodsBean.getType() %>"></td>
		      </tr>
		      <tr>
		        <td height="30" align="left">出版商： <input type="text" name="publisher" value="<%= goodsBean.getPublisher() %>"></td>
		      </tr>
		      <tr>
		        <td height="90" align="left">电影简介： <input type="text" name="goodsIntro" value="<%= goodsBean.getGoodsIntro() %>"></td>
		      </tr>
		      <tr align="center">
		        <td height="34" colspan="2" align="left">
		          <input type="submit" name="button" id="button" value="保存修改" onclick="return addGoods(<%= goodsBean.getGoodsId() %>)" />&nbsp;&nbsp;&nbsp;
		          <input type="button" name="button2" id="button2" value="删除该电影" onclick="return returnHall()" />&nbsp;&nbsp;&nbsp;
		        <input type="button" value="返回" onclick="goBack()">
		        </td>
		      </tr>
		    </table>
		    </form>
		    
		    </td>
		  </tr>
		  <tr>
		    <td align="center">
				<jsp:include page="tail.jsp" flush="true"></jsp:include>
			</td>
		  </tr>
		</table>
		<%
			if(message!=null && !message.equals("")){
				out.println("<script type='text/javascript'>window.alert('"+message+"');</script>");
			}
		%>
		
	</body>
</html>