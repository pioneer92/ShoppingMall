<%@page import="com.wxy.model.MyCartBO"%>
<%@page import="com.wxy.model.GoodsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wxy.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserBean userBean=(UserBean)session.getAttribute("userBean");
	ArrayList<GoodsBean> arrayList=(ArrayList<GoodsBean>)request.getAttribute("myCartInfo");
	MyCartBO myCartBO=(MyCartBO)session.getAttribute("myCartBO");
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
	    <td align="center"><table width="100%" border="0" class="abc">
	      <tr>
	        <td align="center">图片</td>
	      </tr>
	      <tr>
	        <td align="center"><table width="70%" border="0" class="abc">
	          <tr>
	            <td colspan="2" align="center">个人信息</td>
	            </tr>
	          <tr>
	            <td width="45%" align="right">用 户 名：</td>
	            <td width="55%" align="left"><input type="text" name="textfield" id="textfield" value="<%=userBean.getUserName() %>" /></td>
	          </tr>
	          <tr>
	            <td align="right">真实姓名：</td>
	            <td align="left"><input type="text" name="textfield2" id="textfield2" value="<%=userBean.getRealName() %>" /></td>
	          </tr>
	          <tr>
	            <td align="right">收货地址：</td>
	            <td align="left"><input type="text" name="textfield3" id="textfield3" value="<%=userBean.getAddress() %>" /></td>
	          </tr>
	          <tr>
	            <td align="right">联系电话：</td>
	            <td align="left"><input type="text" name="textfield4" id="textfield4" value="<%=userBean.getPhone() %>" /></td>
	          </tr>
	          <tr>
	            <td align="right">电子邮件：</td>
	            <td align="left"><input type="text" name="textfield5" id="textfield5" value="<%=userBean.getEmail() %>" /></td>
	          </tr>
	          <tr>
	            <td align="right">邮编地址：</td>
	            <td align="left"><input type="text" name="textfield6" id="textfield6" value="<%=userBean.getZipcode() %>" /></td>
	          </tr>
	          <tr>
	            <td align="right"><form id="form1" name="form1" method="post" action="">
	              <input type="submit" name="button" id="button" value="提交订单" /> 
	            </form></td>
	            <td align="left"> <input type="submit" name="button2" id="button2" value="修改个人信息" /></td>
	          </tr>
	        </table></td>
	      </tr>
	      <tr>
	        <td align="center"><table width="70%" border="1" class="abc">
	          <tr class="abc">
	            <td colspan="4" align="center">我的购物车</td>
	            </tr>
	          <tr>
	            <td width="25%" align="center">编号</td>
	            <td width="25%" align="center">商品名称</td>
	            <td width="25%" align="center">单价</td>
	            <td width="25%" align="center">数量</td>
	          </tr>
	          <%
	          	for(int i=0;i<arrayList.size();i++){
	          		GoodsBean goodsBean=arrayList.get(i);
	          		%>
			          <tr>
			            <td align="center"><%=goodsBean.getGoodsId() %></td>
			            <td align="center"><%=goodsBean.getGoodsName() %></td>
			            <td align="center"><%=goodsBean.getGoodsPrice() %></td>
			            <td align="center"><%=myCartBO.getGoodsNumById(goodsBean.getGoodsId()+"") %></td>
			          </tr>
	          		<%
	          	}
	          %>
	          <tr>
	            <td colspan="4" align="left">您共购买了<%=myCartBO.getAllPrice() %> RMB的电影</td>
	            </tr>
	          <tr>
	            <td colspan="4" align="center"><input type="submit" name="button3" id="button3" value="返回购物车" /></td>
	            </tr>
	        </table></td>
	      </tr>
	      <tr>
	        <td align="right"><a href="/showMyCart.jsp"><img src="images/20140427132500.png" /></a> <a href="/ShoppingMall/OrderClServlet"><img src="images/next.png" /></a></td>
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