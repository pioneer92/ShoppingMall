<%@page import="com.wxy.model.GoodsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wxy.model.GoodsBeanBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	int pageSize=9; 
	int pageNow=1;
	String pageNowString=request.getParameter("pageNow");
	String search=request.getParameter("search");
	String type=request.getParameter("type");
	String cmd="fenye";
	if(pageNowString!=null && !pageNowString.equals("")){
		pageNow=Integer.parseInt(pageNowString);
	}
	GoodsBeanBO goodsBeanBO=new GoodsBeanBO();
	ArrayList<GoodsBean> arrayList;
	int pageCount;
	if(search!=null && !search.equals("")){	
		arrayList=goodsBeanBO.search(pageSize, pageNow, search);
		pageCount=goodsBeanBO.getSearchPageCount(pageSize, search);
		cmd="search";
	} else if(type!=null && !type.equals("")){
		arrayList=goodsBeanBO.getType(pageSize, pageNow, type);
		pageCount=goodsBeanBO.getTypePageCount(pageSize, type);
		cmd="showtype";
	} else {
		arrayList=goodsBeanBO.getGoodsByPage(pageSize, pageNow);
		pageCount=goodsBeanBO.getPageCount(pageSize);
	}
	search=(search==null || search.equals(""))?"":search;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/my.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0">
<table width="100%" border="0" bgcolor="#F5F5F5">
	<tr align="center">
		<td width="10">&nbsp;</td>
		<td width="10" class="navi"><a href="/ShoppingMall/manager.jsp">首页</a></td>
		<td width="10">&nbsp;</td>
		<td width="10" class="navi"><a
			href="/ShoppingMall/manager.jsp?cmd=showtype&pageNow=1&type=大陆动画">大陆动画</a></td>
		<td width="10">&nbsp;</td>
		<td width="10" class="navi"><a
			href="/ShoppingMall/manager.jsp?cmd=showtype&pageNow=1&type=大陆电影">大陆电影</a></td>
		<td width="10">&nbsp;</td>
		<td width="10" class="navi"><a
			href="/ShoppingMall/manager.jsp?cmd=showtype&pageNow=1&type=日本电影">日本电影</a></td>
		<td width="10">&nbsp;</td>
		<td width="10" class="navi"><a
			href="/ShoppingMall/manager.jsp?cmd=showtype&pageNow=1&type=美国大片">美国大片</a></td>
		<td width="10">&nbsp;</td>
		<td width="10" class="navi"><a
			href="/ShoppingMall/manager.jsp?cmd=showtype&pageNow=1&type=迪斯尼动画">迪斯尼动画</a></td>
		<td width="10">&nbsp;</td>
		<td width="10" class="navi"><a
			href="/ShoppingMall/manager.jsp?cmd=showtype&pageNow=1&type=香港电影">香港电影</a></td>
		<td width="10">&nbsp;</td>
	</tr>
</table>
<table width="80%" border="0" align="center" class="abc">
	<tr>
		<td colspan="3" align="center"><form
				action="/ShoppingMall/manager.jsp?cmd=search&pageNow=1" method="post">
				<table width="100%" border="0" align="center">
					<tr>
						<td align="center">站内搜索</td>
					</tr>
					<tr>
						<td align="center"><input type="text" name="search"
							value="<%=search%>" /></td>
					</tr>
					<tr>
						<td align="center"><input type="submit" value="搜索"></td>
					</tr>
				</table>
			</form></td>
	</tr>
	<tr>
		<td colspan="3" align="center" bgcolor="#F5F5F5">&nbsp;</td>
	</tr>
	<%
		int time=0;
		  	for(int i=0;i<3;i++){
	%><tr>
		<%
			for(int j=0;j<3 && time<arrayList.size();j++){
				  	  		GoodsBean goodsBean=(GoodsBean)arrayList.get(time++);
		%>
		<td width="33%" align="center"><table width="100%" border="0"
				class="abc">
				<tr>
					<td width="52%" rowspan="3"><img
						src="images/<%=goodsBean.getPhoto()%>" width="178" height="112" /></td>
					<td width="48%" height="39">&nbsp;</td>
				</tr>
				<tr>
					<td height="36"><a
						href="/ShoppingMall/ManagerCl?cmd=managerDetail&id=<%=goodsBean.getGoodsId()%>"><%=goodsBean.getGoodsName()%></a></td>
				</tr>
				<tr>
					<td height="33%">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">&nbsp;</td>
				</tr>
			</table></td>
		<%
			}
		%>
	</tr>
	<%
		if(i!=(3-i)){
	%>
	<tr>
		<td colspan="3" align="center" bgcolor="#F5F5F5">&nbsp;</td>
	</tr>
	<%
		}
		  	}
	%>
	<tr>
		<td colspan="3" align="center">
			<%
				for(int i=1;i<=pageCount;i++){
									if(cmd.equals("fenye")){
			%> <a href="/ShoppingMall/manager.jsp?cmd=<%=cmd%>&pageNow=<%=i%>">&nbsp;【<%=i%>】
		</a> <%
 	} else if(cmd.equals("search")){
   		String t="/ShoppingMall/manager.jsp?cmd=search&pageNow="+i+"&search="+search;
 %> <a href=<%=t%>>&nbsp;【<%=i%>】
		</a> <%
 	} else if(cmd.equals("showtype")){
    		String t="/ShoppingMall/manager.jsp?cmd=showtype&pageNow="+i+"&type="+type;
 %> <a href=<%=t%>>&nbsp;【<%=i%>】
		</a> <%
 	}
    	
     	}
 %>
		</td>
	</tr>
</table>
</body>
</html>





