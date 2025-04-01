<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
{
	out.print("<script>javascript:alert('对不起，您已超时或未登陆,请在IE中重新打开登陆！');window.parent.location.href='login.jsp';</script>");
	out.close();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>头部</title>
<link rel="stylesheet" type="text/css" href="images/public.css" />
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
<style type="text/css">
<!--
.STYLE7 {color: #FFFFFF}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>

<body>
	<!-- 头部 -->
<div class="head">
  <table id="__01" width="100%" height="100" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="64"><table id="__01" width="100%" height="64" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="6%" height="64" background="images/1-1_01_01_01.gif">&nbsp;</td>
            <td width="61%" background="images/afff.gif"><table width="77%" height="64" border="0" align="center">
                <tr>
                  <td valign="bottom"><div style="font-family:宋体; color:#FFFFFF;  WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 28px; margin-top:5pt">网上超市</div></td>
                </tr>
            </table></td>
            <td width="514" align="right" background="images/afff.gif">&nbsp;</td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td width="100%" height="26" valign="bottom" bgcolor="#009999"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="77%"><table width="77%" 
border="0" align="center" cellpadding="0" cellspacing="0">
                <tbody>
                  <tr>
                    <td width="3%" height="31" align="center" valign="center" class="h2">&nbsp;</td>
                    <td width="97%" align="right" ><marquee behavior="alternate" width="100%" scrollamount="3" class="STYLE7">
                     
                    </marquee></td>
                  </tr>
                </tbody>
            </table></td>
            <td width="23%" align="right" valign="middle" class="STYLE7" style="padding-right:15px;"><img src="images/siteico.gif" />当前用户：<%=request.getSession().getAttribute("username")%> <img src="images/document.gif" />权限：<%=request.getSession().getAttribute("cx")%> <a href="logout.jsp" target="_parent"><font class="STYLE7">退出</font></a></td>
          </tr>
      </table></td>
    </tr>
  </table>
</div>
</body>
</html>