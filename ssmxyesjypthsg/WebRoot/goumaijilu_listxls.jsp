<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="sn" scope="page" class="com.bean.SystemBean" />
<jsp:useBean id="goumaijiluhsgb" scope="page" class="com.bean.GoumaijiluBean" /> 

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=goumaijilu.xls");
%>
<html>
  <head>
    <title>�����¼</title>
  </head>

  <body >
 <%
			String sql="select * from goumaijilu  order by id desc";

			
			%>
<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td align='center'>��Ʒ���</td>
    <td align='center'>��Ʒ����</td>
    <td align='center'>���</td>
    <td align='center'>����</td>
    <td align='center'>���</td>
    <td align='center'>�۸�</td>
    <td align='center'>��������</td>
    <td align='center'>������</td>
    <td align='center'>������</td>
    
    <td  width='80' align='center'>�Ƿ����</td>
	
    <td width="120" align="center" bgcolor="CCFFFF">���ʱ��</td>
    
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
    
    <td align='center'>${u.issh} <input type="button" value="���" onClick="javascript:location.href='sh.jsp?id=${u.id}&yuan=${u.issh}&tablename=goumaijilu'"/></td>
	
	
   
  </tr>
  	<%
  }}
   %>
   
</table>
<br>
  </body>
</html>

