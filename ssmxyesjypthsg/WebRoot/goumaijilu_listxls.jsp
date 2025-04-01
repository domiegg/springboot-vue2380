<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="goumaijiluhsgb" scope="page" class="com.bean.GoumaijiluBean" /> 

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=goumaijilu.xls");
%>
<html>
  <head>
    <title>购买记录</title>
  </head>

  <body >
 <%
			String sql="select * from goumaijilu  order by id desc";

			
			%>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td align='center'>商品编号</td>
    <td align='center'>商品名称</td>
    <td align='center'>类别</td>
    <td align='center'>销量</td>
    <td align='center'>库存</td>
    <td align='center'>价格</td>
    <td align='center'>购买数量</td>
    <td align='center'>购买金额</td>
    <td align='center'>购买人</td>
    
    <td  width='80' align='center'>是否审核</td>
	
    <td width="120" align="center" bgcolor="CCFFFF">添加时间</td>
    
  </tr>
   <%		
				List pagelist3=goumaijiluhsgb.getAllGoumaijilu(14);
			if(!pagelist3.isEmpty()){
				for(int i=0;i<pagelist3.size();i++){
					List pagelist2 =(ArrayList)pagelist3.get(i);
			%>
  <tr>
    <td  align="center"><%=i+1 %></td>
    <td>${u.shangpinbianhao}</td>
    <td>${u.shangpinmingcheng}</td>
    <td>${u.leibie}</td>
    <td>${u.xiaoliang}</td>
    <td>${u.kucun}</td>
    <td>${u.jiage}</td>
    <td>${u.goumaishuliang}</td>
    <td>${u.goumaijine}</td>
    <td>${u.yonghuming}</td>
    
    <td align='center'>${u.issh} <input type="button" value="审核" onClick="javascript:location.href='sh.jsp?id=${u.id}&yuan=${u.issh}&tablename=goumaijilu'"/></td>
	
	
   
  </tr>
  	<%
  }}
   %>
   
</table>
<br>
  </body>
</html>

