<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<TITLE>购买记录查询</TITLE>
	<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>
	</head>
	<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
			<tr valign="top">
				<td>
					<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
						<tr align="left" bgcolor="#F2FDFF">
							<td colspan="17" background="images/table_header.gif">购买记录列表</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr valign="top">
			  <td bgcolor="#FFFFFF">
			  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#aec3de">
						
					<tr align="right" bgcolor="#ebf0f7">
					  <td colspan="21">
					  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" >
						<tr align="left" >
							<td colspan="17">
								<form action="goumaijiluList2.do" name="myform" method="post">
									查询   商品编号：<input name="shangpinbianhao" type="text" id="shangpinbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  商品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" style='border:solid 1px #000000; color:#666666' size="12" />  类别：<input name="leibie" type="text" id="leibie" style='border:solid 1px #000000; color:#666666' size="12" />  发布人：<input name="faburen" type="text" id="faburen" style='border:solid 1px #000000; color:#666666' size="12" />  购买人：<input name="yonghuming" type="text" id="yonghuming" style='border:solid 1px #000000; color:#666666' size="12" />
									<input type="submit" value="查询" />
								</form>								</td>
						</tr></table>
					  </td>
			    </tr>
					
						<tr align="center">
						<td style="padding-left:0px; padding-right:0px;"><table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#ebf0f7">
                          <tr>
                            <td align="center" bgcolor="#ebf0f7" width="30px">序号</td>
                            <td align='center'>商品编号</td>
    <td align='center'>商品名称</td>
    <td align='center'>类别</td>
    <td align='center'>销量</td>
    <td align='center'>库存</td>
    <td align='center'>价格</td>
    <td align='center'>购买数量</td>
    <td align='center'>购买金额</td>
    <td align='center'>购买人</td>
    
    <td  width='80' align='center'>是否下单</td>
                            <td align="center" bgcolor="#ebf0f7" width="150px"> 添加时间 </td>
                            <td align="center" bgcolor="#ebf0f7" width="150px"> 操作 </td>
                          </tr>
                          <%
					int i=0;
				%>
                          <c:forEach items="${list }" var="u">
                            <%
					i++;
				%>
                            <tr align="center" bgcolor="#FFFFFF">
                              <td align="center"><%=i%></td>
                             <td>${u.shangpinbianhao}</td>
    <td>${u.shangpinmingcheng}</td>
    <td>${u.leibie}</td>
    <td>${u.xiaoliang}</td>
    <td>${u.kucun}</td>
    <td>${u.jiage}</td>
    <td>${u.goumaishuliang}</td>
    <td>${u.goumaijine}</td>
    <td>${u.yonghuming}</td>
	
   <td align='center'>${u.issh} </td>
    
                              <td align="center"> ${u.addtime } </td>
                              <td align="center"><a href="doUpdateGoumaijilu.do?id=${u.id }">编辑</a>  <a href="deleteGoumaijilu.do?id=${u.id }"
										onclick="{if(confirm('确定要删除吗?')){return true;}return false;}">删除</a> <a href="goumaijiluDetail.do?id=${u.id }">详细</a></td>
                            </tr>
                          </c:forEach>
                        </table></td>
						</tr>
				</table>
					
					
			  </td>
	  </tr>
	</table>
		
		 <p>&nbsp;    </p>
		 <p>
		   <%
			String sql="select * from goumaijilu where yonghuming='"+(String)request.getSession().getAttribute("username")+"' and issh='否'  ";
				
if(request.getParameter("shangpinbianhao")=="" ||request.getParameter("shangpinbianhao")==null ){}else{String nshangpinbianhao=new String(request.getParameter("shangpinbianhao").getBytes("8859_1"));if(nshangpinbianhao.contains("?")){nshangpinbianhao=request.getParameter("shangpinbianhao");}sql=sql+" and shangpinbianhao like '%"+nshangpinbianhao+"%'";}
if(request.getParameter("shangpinmingcheng")=="" ||request.getParameter("shangpinmingcheng")==null ){}else{String nshangpinmingcheng=new String(request.getParameter("shangpinmingcheng").getBytes("8859_1"));if(nshangpinmingcheng.contains("?")){nshangpinmingcheng=request.getParameter("shangpinmingcheng");}sql=sql+" and shangpinmingcheng like '%"+nshangpinmingcheng+"%'";}
if(request.getParameter("leibie")=="" ||request.getParameter("leibie")==null ){}else{String nleibie=new String(request.getParameter("leibie").getBytes("8859_1"));if(nleibie.contains("?")){nleibie=request.getParameter("leibie");}sql=sql+" and leibie like '%"+nleibie+"%'";}
if(request.getParameter("faburen")=="" ||request.getParameter("faburen")==null ){}else{String nfaburen=new String(request.getParameter("faburen").getBytes("8859_1"));if(nfaburen.contains("?")){nfaburen=request.getParameter("faburen");}sql=sql+" and faburen like '%"+nfaburen+"%'";}
if(request.getParameter("yonghuming")=="" ||request.getParameter("yonghuming")==null ){}else{String nyonghuming=new String(request.getParameter("yonghuming").getBytes("8859_1"));if(nyonghuming.contains("?")){nyonghuming=request.getParameter("yonghuming");}sql=sql+" and yonghuming like '%"+nyonghuming+"%'";}
			sql+=" order by id desc";
double goumaijinez=0;
							
							
			ResultSet RS_result=connDbBean.executeQuery(sql);
while(RS_result.next()){
				
						
						goumaijinez=goumaijinez+Float.valueOf(RS_result.getString("goumaijine")).floatValue();

						
						
			 }
			%>
		共计购买金额:<%=goumaijinez%>； 
		
			<span style="padding-left:10px;">
			<input type="button" name="Submit" value="生成订单" onClick="javascript:location.href='dingdanxinxi_add.jsp?je=<%=goumaijinez%>';" />
			</span>
	     </p>
		 <p align="center"> <c:if test="${sessionScope.p==1 }">
		 <c:if test="${page.page>1}">
              <a href="goumaijiluList2.do?page=1" >首页</a>
             <a href="goumaijiluList2.do?page=${page.page-1 }"> 上一页</a>             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="goumaijiluList2.do?page=${page.page+1 }">下一页</a>
			<a href="goumaijiluList2.do?page=${page.totalPage }">末页</a>		    </c:if>		
	</c:if>
	</p>
			
			
			
			
			
	</body>
</html>
