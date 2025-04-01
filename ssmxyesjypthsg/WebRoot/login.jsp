<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:useBean id="code" scope="page" class="com.util.CheckCode" />
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>登录</title>
<link rel="stylesheet" type="text/css" href="images/public.css" />
<link rel="stylesheet" type="text/css" href="images/page.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>

<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:610px;
	height:52px;
	z-index:1;
	left: 179px;
	top: 243px;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
	<script type="text/javascript">
	function hsgchecklogin() {
			if(document.f11.username.value=="" || document.f11.pwd.value=="" || document.f11.pagerandom.value=="")
	{
		alert("请输入完整");
		return false;
	}
	if (document.f11.pagerandom.value != document.f11.yzm.value) {
			alert("验证码错误！");
			document.f11.pagerandom.focus();
			return false;
	}
	
	}
	</script>
<body>

	<!-- 登录body -->
	<div class="logDiv">
		<img class="logBanner" src="images/logBanner.png" />
		<div class="logGet">
			<!-- 头部提示信息 -->
			<div class="logD logDtip">
				<p class="p1">登录</p>
			</div>
			<!-- 输入框 -->
			
			 <form name="f11" id="f11" method="post" action="hsgloginyanzheng.jsp">
			<div class="lgD">
				<img class="img1" src="images/logName.png" /><input type="text" id="username" name="username" placeholder="输入用户名" />
			</div>
			<div class="lgD">
				<img class="img1" src="images/logPwd.png" /><input  placeholder="输入用户密码" name="pwd" type="password" id="pwd" />
			</div>
		  <div class="lgD">权限:&nbsp;&nbsp;<select name="cx" id="cx" style="width:170px; height:40px;">
            <option value="管理员">管理员</option>
          </select></div>
		  <div class="lgD">
				<img class="img1" src="images/logPwd.png" /> <input type="text" placeholder="验证码" name="pagerandom" id="pagerandom" style="width:100px; height:35px;" />
				<%
								String yzm=code.getCheckCode();
								%>  <input type="hidden" name="yzm" id="yzm" value="<%=yzm %>" >
								   <%=yzm %>
			</div>
			<div class="logC"> <input name="login" type="hidden" id="login" value="1">
				<input type="submit" name="Submit" value="登陆" onClick="return hsgchecklogin();" style="width:320px; height:40px;">
			</div>
			 </form>
		</div>
</div>
	<!-- 登录body  end -->

	<!-- 登录页面底部 -->
	<div class="logFoot">
		<p class="p1">版权所有：网上超市</p>
		
	</div>
	<!-- 登录页面底部end -->
   
</body>
</html>



