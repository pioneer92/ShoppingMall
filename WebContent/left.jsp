<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	String search=request.getParameter("search");
	search=(search==null || search.equals(""))?"":search;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table width="100%" border="0" align="center" class="abc">
  <tr>
    <td align="center"><form action="/ShoppingMall/index.jsp?cmd=search&pageNow=1" method="post">
    <table width="100%" border="0" align="center">
    <tr>
        <td align="center">站内搜索</td>
      </tr>
      <tr>
        <td align="center"><input type="text" name="search" value="<%=search %>" /></td>
      </tr>
      <tr>
        <td align="center"><input type="submit" value="搜索"></td>
      </tr>
    </table></form></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#F5F5F5">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><table width="100%" border="0" align="center" class="abc">
      <tr>
        <td colspan="3" align="center"><img src="images/20140327204841.png" alt="" width="173" height="63" /></td>
        </tr>
      <tr class="navi">
        <td width="10%" align="center">排行</td>
        <td width="20%" align="center">电影名称</td>
        <td width="20%" align="center">点击次数</td>
      </tr>
      <tr>
        <td width="10%" align="center">1</td>
        <td width="20%" align="center"><a href="left.html">笑傲江湖</a></td>
        <td width="20%" align="center">96328</td>
      </tr>
      <tr>
        <td width="10%" align="center">2</td>
        <td width="20%" align="center"><a href="left.html">天龙八部</a></td>
        <td width="20%" align="center">94320</td>
      </tr>
      <tr>
        <td width="10%" align="center">3</td>
        <td width="20%" align="center"><a href="left.html">。。。</a></td>
        <td width="20%" align="center">。。。</td>
      </tr>
      <tr>
        <td width="10%" align="center">4</td>
        <td width="20%" align="center"><a href="left.html">。。。</a></td>
        <td width="20%" align="center">。。。</td>
      </tr>
      <tr>
        <td width="10%" align="center">5</td>
        <td width="20%" align="center"><a href="left.html">。。。</a></td>
        <td width="20%" align="center">。。。</td>
      </tr>
      <tr>
        <td width="10%" align="center">6</td>
        <td width="20%" align="center"><a href="left.html">。。。</a></td>
        <td width="20%" align="center">。。。</td>
      </tr>
      <tr>
        <td width="10%" align="center">7</td>
        <td width="20%" align="center"><a href="left.html">。。。</a></td>
        <td width="20%" align="center">。。。</td>
      </tr>
    </table></td>
  </tr>
</table>