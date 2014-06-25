<%@page import="com.wxy.model.UserBeanBO"%>
<%@page import="com.wxy.model.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserBean userBean=(UserBean)session.getAttribute("userBean");
	if(session.getAttribute("userBean")==null){
		Cookie cookies[] = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equals("username")) {
					UserBeanBO userBeanBO =new UserBeanBO();	
					userBean=userBeanBO.getUserBean(cookie.getValue());
					session.setAttribute("userBean", userBean);
				}
			}
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
	function logout(){
		if(window.confirm("您确定要退出吗?")){
			return true;
		} else {
			return false;
		}
	}
</script>
<table width="100%" border="0" class="abc">
  <tr>
    <td width="22%" align="center"><img src="images/logo.jpg" width="179" height="100" /></td>
    <td width="62%" align="center"><img src="images/psb.gif" width="400" height="100" /></td>
    <td width="16%"><p><a href="">【我的账号】</a></p>
    <p><a href="/ShoppingMall/ShoppingClServlet?type=showMyCart">【我的购物车】</a></p>
    <%
		if(session.getAttribute("userBean")!=null){
			%>
				<p class="abc"><a href="/ShoppingMall/LogoutCl" onclick="return logout()">【安全退出】</a></p>
			<%
		}
	%></td>
  </tr>
  <tr>
    <td colspan="3"><table width="100%" border="0"  bgcolor="#F5F5F5">
      <tr align="center">
        <td width="10">&nbsp;</td>
        <td width="10" class="navi"><a href="/ShoppingMall/index.jsp">首页</a></td>
        <td width="10">&nbsp;</td>
        <td width="10" class="navi"><a href="/ShoppingMall/index.jsp?cmd=showtype&pageNow=1&type=大陆动画">大陆动画</a></td>
        <td width="10">&nbsp;</td>
        <td width="10" class="navi"><a href="/ShoppingMall/index.jsp?cmd=showtype&pageNow=1&type=大陆电影">大陆电影</a></td>
        <td width="10">&nbsp;</td>
        <td width="10" class="navi"><a href="/ShoppingMall/index.jsp?cmd=showtype&pageNow=1&type=日本电影">日本电影</a></td>
        <td width="10">&nbsp;</td>
        <td width="10" class="navi"><a href="/ShoppingMall/index.jsp?cmd=showtype&pageNow=1&type=美国大片">美国大片</a></td>
        <td width="10">&nbsp;</td>
        <td width="10" class="navi"><a href="/ShoppingMall/index.jsp?cmd=showtype&pageNow=1&type=迪斯尼动画">迪斯尼动画</a></td>
        <td width="10">&nbsp;</td>
        <td width="10" class="navi"><a href="/ShoppingMall/index.jsp?cmd=showtype&pageNow=1&type=香港电影">香港电影</a></td>
        <td width="10">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>