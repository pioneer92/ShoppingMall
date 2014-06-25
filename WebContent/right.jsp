<%@page import="com.wxy.model.GoodsBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.wxy.model.GoodsBeanBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	int pageSize=6; 
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
%>
<table width="100%" border="1" align="center" class="abc">
	<tr>
		<td colspan="3" align="center"><img
			src="images/20140327204841.png" alt="" width="173" height="63" /></td>
	</tr>
	<tr>
		<td colspan="3" align="center" bgcolor="#F5F5F5">&nbsp;</td>
	</tr>
	<%
		int time=0;
		  	for(int i=0;i<2;i++){
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
						href="/ShoppingMall/ShowGoodsClServlet?cmd=showDetail&id=<%=goodsBean.getGoodsId()%>"><%=goodsBean.getGoodsName()%></a></td>
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
		if(i!=(2-i)){
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
			%> <a href="/ShoppingMall/index.jsp?cmd=<%=cmd%>&pageNow=<%=i%>">&nbsp;【<%=i%>】
		</a> <%
 	} else if(cmd.equals("search")){
 		String t="/ShoppingMall/index.jsp?cmd=search&pageNow="+i+"&search="+search;
 %> <a
			href=<%=t%>>&nbsp;【<%=i%>】
		</a> <%
 	} else if(cmd.equals("showtype")){
  		String t="/ShoppingMall/index.jsp?cmd=showtype&pageNow="+i+"&type="+type;
 %> <a href=<%=t%>>&nbsp;【<%=i%>】
		</a> <%
 	}
  	
   	}
 %>
		</td>
	</tr>
</table>