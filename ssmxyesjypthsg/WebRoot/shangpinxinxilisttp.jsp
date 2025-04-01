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

<title>商品信息</title>

<meta name="generator" content="" />
<meta name="author" content="" />

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="qtimages/js/jquery-1.8.3.min.js"></script>
<script src="qtimages/js/jquery.superslide.2.1.js"></script>
<link rel="stylesheet" type="text/css" href="qtimages/css/common.css">
<link rel="stylesheet" type="text/css" href="qtimages/css/common1.css">
<link type="text/css" rel="stylesheet" href="qtimages/css/flexslider.css" />
<link rel="stylesheet" type="text/css" href="qtimages/css/index.css">
<link rel="stylesheet" type="text/css" href="qtimages/css/main.css">
<link href="qtimages/css/index1.css" rel="stylesheet">
<link href="qtimages/css/zzsc.css" rel="stylesheet" type="text/css">

<script src="qtimages/js/hsggundong.js"></script>
</head>

<%

%>

<body>
  <jsp:include page="qttop.jsp"></jsp:include>
<jsp:include page="bht.jsp"></jsp:include>

  <div class="layout bg6">
    <div class="lei_mian">
      <h3><a href="index.do">首页</a> 商品信息 </h3>
    </div>
  </div>

<div style="width:1200px; margin:0 auto;">

                    
					
<form action="spxxListtp.do" name="myform" method="post" style="width:100%">
									查询   商品编号：<input name="shangpinbianhao" type="text" id="shangpinbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  商品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" style='border:solid 1px #000000; color:#666666' size="12" /> 类别：<select name='leibie' id='leibie' style='border:solid 1px #000000; color:#666666;'><option value="">所有</option><option value="A类">A类</option><option value="B类">B类</option><option value="C类">C类</option><option value="D类">D类</option><option value="E类">E类</option><option value="F类">F类</option></select>
									<input type="submit" value="查询" /> <input type="button" name="Submit2" value="切换视图"  onClick="javascript:location.href='spxxList.do';" />
								</form>	
<br />

<table width="100%" height="12%" border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                          <%
					int i=0;
				%>
				<c:forEach items="${list}" var="u">
				<%
					i++;
				%>
                            <td align="center"><table width="150" height="153" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td height="126" align="center"><a href="spxxDetail.do?id=${u.id}"><img src="${u.tupian}" width="109" height="126" border="0" /></a></td>
                                </tr>
                                <tr>
                                  <td height="26" align="center">${u.shangpinmingcheng}</td>
                                </tr>
                            </table></td>
							  <%
								if (i==4)
								{
									i=0;
									out.print("</tr><tr>");
								}
				  	
					
				  %>
							</c:forEach>
							
                          
                          </tr>
                        </table><br>

<p align="center"> <c:if test="${sessionScope.p==1}">
		 <c:if test="${page.page>1}">
              <a href="spxxListtp.do?page=1" >首页</a>
             <a href="spxxListtp.do?page=${page.page-1}"> 上一页</a>             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="spxxListtp.do?page=${page.page+1}">下一页</a>
			<a href="spxxListtp.do?page=${page.totalPage}">末页</a>		    </c:if>		
	</c:if>
	</p>
                     
					  
					
					  
					  
				</div>	  
  <jsp:include page="qtdown.jsp"></jsp:include>
  
</body> 
</html>
