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
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>

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

                    
					
<form action="spxxList.do" name="myform" method="post" style="width:100%">
									查询   商品编号：<input name="shangpinbianhao" type="text" id="shangpinbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  商品名称：<input name="shangpinmingcheng" type="text" id="shangpinmingcheng" style='border:solid 1px #000000; color:#666666' size="12" /> 类别：<input name="leibie" type="text" id="leibie" style='border:solid 1px #000000; color:#666666' size="12" />
									<input type="submit" value="查询" />
</form>	

	
<br />
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#ebf0f7">
                          <tr>
                            <td align="center" bgcolor="#ebf0f7" width="30px">序号</td>
                            <td align="center" bgcolor='#ebf0f7'>商品编号</td>
    <td align="center" bgcolor='#ebf0f7'>商品名称</td>
    <td align="center" bgcolor='#ebf0f7'>类别</td>
    <td align="center" bgcolor='#ebf0f7'>销量</td>
    <td align="center" bgcolor='#ebf0f7'>库存</td>
    <td align="center" bgcolor='#ebf0f7'>价格</td>
    <td bgcolor='#ebf0f7' width='90' align='center'>图片</td>
    
    
                            <td align="center" bgcolor="#ebf0f7" width="150px"> 添加时间 </td>
                            <td align="center" bgcolor="#ebf0f7" width="50px"> 操作 </td>
                          </tr>
                          <%
					int i=0;
				%>
                          <c:forEach items="${list}" var="u">
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
    <td width='90'><a href='${u.tupian}' target='_blank'><img src='${u.tupian}' width=88 height=99 border=0 /></a></td>
    
   
    
                              <td align="center"> ${u.addtime} </td>
                              <td align="center"><a href="spxxDetail.do?id=${u.id}">详细</a></td>
                            </tr>
                          </c:forEach>
  </table>
<br>

<p align="center"> <c:if test="${sessionScope.p==1 }">
		 <c:if test="${page.page>1}">
              <a href="spxxList.do?page=1" >首页</a>
             <a href="spxxList.do?page=${page.page-1 }"> 上一页</a>             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="spxxList.do?page=${page.page+1 }">下一页</a>
			<a href="spxxList.do?page=${page.totalPage }">末页</a>		    </c:if>		
	</c:if>
  </p>




                     
					  
					
					  
					  
</div>	  
  <jsp:include page="qtdown.jsp"></jsp:include>
  
</body> 
</html>
