<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.util.db"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>网上超市</title>
<meta name="generator" content="" />
<meta name="author" content="" />

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="qtimages/js/jquery-1.8.3.min.js"></script>
<script src="qtimages/js/jquery.superslide.2.1.js"></script>
<link rel="stylesheet" type="text/css" href="qtimages/css/common.css">
<link type="text/css" rel="stylesheet" href="qtimages/css/flexslider.css" />
<link rel="stylesheet" type="text/css" href="qtimages/css/index.css">
<link rel="stylesheet" type="text/css" href="qtimages/css/main.css">
<link href="qtimages/css/index1.css" rel="stylesheet">
<link href="qtimages/css/zzsc.css" rel="stylesheet" type="text/css">

<script src="qtimages/js/hsggundong.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
	
<jsp:include page="qttop.jsp"></jsp:include>
<jsp:include page="bht.jsp"></jsp:include>



<div class="layout">
   <div class="ind_tit">
     <h2>热门商品</h2>
   </div>
 </div>


<div class="layout">
    <div class="scrollpic">
      <div id="mybtns"> <a href="javascript:;" id="right"></a><a href="javascript:;" id="left"></a>  </div>
      <div id="myscroll">
        <div id="myscrollbox">
          <ul>
		  
		  
		  
		  <c:forEach items="${syshangpinxinxi1 }" var="a">
		  
		  
		  
		  
		  
            <li>
              <a href="spxxDetail.do?id=${a.id}">
                <img src="${a.tupian}" width="260" height="270">
                <span class="intro">
                  <h5>${a.shangpinmingcheng}</h5>
				    </br>
                  </br>           
				<h3>查看详情</h3>
                </span>
              </a>
            </li>
			
			 </c:forEach>
			
			
           
          </ul>
        </div>
      </div>
    </div>
</div>






   <div class="layout">
     <div class="ind_tit">
       <h2><a ><b></b></a></h2>
     </div>
   </div>
  <div class="layout">
    <div class="bs-example">
        <!-- Bottom to top-->
    </div>
</div>
<jsp:include page="qtdown.jsp"></jsp:include>
</body> 
</html>
