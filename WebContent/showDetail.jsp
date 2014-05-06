<%@page import="com.wxy.model.GoodsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	GoodsBean goodsBean=(GoodsBean)request.getAttribute("goodsInfo");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="css/my.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function returnHall(){
				window.open("/ShoppingMall/index.jsp","_self");
			}
			function addGoods(goodsId){
				window.open("/ShoppingMall/ShoppingClServlet?type=addGoods&goodsId="+goodsId);
			}
		</script>
	</head>
	<body  bgcolor="#CEFFD4" topmargin="0">
		<table width="80%" border="0" align="center">
		  <tr>
		    <td align="center">
				<jsp:include page="head.jsp" flush="true"></jsp:include>
			</td>
		  </tr>
		  <tr>
		    <td height="388" align="center"><table width="100%" border="0" align="center">
		      <tr align="center">
		        <td colspan="2" align="center">&nbsp;</td>
		        </tr>
		      <tr>
		        <td width="35%" rowspan="6" align="center"><img src="images/<%= goodsBean.getPhoto() %>" alt="" width="283" height="174" /></td>
		        <td height="65" align="center"><%= goodsBean.getGoodsName() %></td>
		      </tr>
		      <tr>
		        <td height="30" align="left">价格： <%= goodsBean.getGoodsPrice() %> RMB</td>
		      </tr>
		      <tr>
		        <td height="30" align="left">ISBM： <%= goodsBean.getGoodsId() %></td>
		      </tr>
		      <tr>
		        <td height="30" align="left">类型： <%= goodsBean.getType() %></td>
		      </tr>
		      <tr>
		        <td height="30" align="left">出版商： <%= goodsBean.getPublisher() %></td>
		      </tr>
		      <tr>
		        <td height="90" align="left">电影简介： <%= goodsBean.getGoodsIntro() %></td>
		      </tr>
		      <tr align="center">
		        <td height="34" colspan="2" align="left"><form id="form1" name="form1" method="post" action="">
		          <input type="submit" name="button" id="button" value="购买" onclick="addGoods(<%= goodsBean.getGoodsId() %>)" />
		          <input type="submit" name="button2" id="button2" value="返回购物大厅" onclick="returnHall()" />
		        </form></td>
		      </tr>
		      <tr align="center">
		        <td height="32" colspan="2" align="left">&nbsp;</td>
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