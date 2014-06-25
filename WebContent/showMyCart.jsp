<%@page import="com.wxy.model.MyCartBO"%>
<%@page import="com.wxy.model.GoodsBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<GoodsBean> arrayList=(ArrayList<GoodsBean>)request.getAttribute("myCartInfo");
	MyCartBO myCartBO=(MyCartBO) request.getSession().getAttribute("myCartBO");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link href="css/my.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			function delAllGoods(){
				window.open("/ShoppingMall/ShoppingClServlet?type=delAllGoods");
			}
		</script>
	</head>
	<body topmargin="0">
		<table width="80%" border="1" align="center">
		  <tr>
		    <td align="center" class="abc">
				<jsp:include page="head.jsp" flush="true"></jsp:include>
			</td>
		  </tr>
		  <tr>
		    <td align="center">
		    <form action="/ShoppingMall/ShoppingClServlet?type=updateGoods" method="post">
		    <table width="100%" border="1" class="abc">
		      <tr class="abc">
		        <td colspan="4">&nbsp;</td>
		        </tr>
		      <tr>
		        <td width="25%" align="center" class="abc">编号</td>
		        <td width="25%" align="center">名称</td>
		        <td width="25%" align="center">单价</td>
		        <td width="25%" align="center">数量</td>
		      </tr>		
		      <%
		      	GoodsBean goodsBean=null;
		      	for(int i=0;i<arrayList.size();i++){
		      		goodsBean=arrayList.get(i);
		      		%>     
				      <tr>
				        <td align="center" class="abc"><%=goodsBean.getGoodsId() %></td>
				        <td align="center"><%=goodsBean.getGoodsName() %></td>
				        <td align="center"><%=goodsBean.getGoodsPrice() %> RMB</td>
				        <td align="center"><table width="100%" border="1">
				          <tr class="abc">
				            <td width="33%" align="center"><input type="hidden" name="goodsId" value="<%=goodsBean.getGoodsId() %>"/><input name="newNum" type="text" value="<%=myCartBO.getGoodsNumById(goodsBean.getGoodsId()+"") %>" id="textfield" size="10" /></td>
				            <td width="33%" align="center"><a href="/ShoppingMall/ShoppingClServlet?type=delGoods&goodsId=<%=goodsBean.getGoodsId() %>">删除</a></td>
				            <td width="33%" align="center"><a href="/ShoppingMall/ShowGoodsClServlet?cmd=showDetail&id=<%=goodsBean.getGoodsId() %>">查看</a></td>
				          </tr>
				        </table></td>
				      </tr>
		      		<%
		      	}
		      %> 
		      <tr>
		        <td align="center" class="abc">&nbsp;</td>
		        <td align="center"><input type="submit" name="button" onclick="delAllGoods()" id="button" value="删除全部电影" /></td>
		        <td align="center"><input type="submit" name="button2" id="button2" value="修 改 数 量" /></td>
		        <td align="center">&nbsp;</td>
		      </tr>
		      <tr class="abc">
		        <td colspan="4" align="center">&nbsp;</td>
		        </tr>
		      <tr class="abc">
		        <td colspan="4" align="center"><table width="100%" border="1">
		          <tr class="abc">
		            <td width="50%">您共购买了 <%=myCartBO.getAllPrice() %> RMB的电影，点击<a href="index.jsp">此处</a>继续购物。</td>
		            <td width="50%" align="right"><a href="/ShoppingMall/ShoppingCl2"><img border="0" src="images/next.png" width="80" height="29" onclick="" /></a></td>
		          </tr>
		        </table></td>
		        </tr>
		    </table>
		    </form>
		    </td>
		  </tr>
		  <tr>
		    <td align="center" class="abc">
				<jsp:include page="tail.jsp" flush="true"></jsp:include>
			</td>
		  </tr>
		</table>
	</body>
</html>