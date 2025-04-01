<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>
<html>
  <head>
    <title>购买记录详细</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>

  </head>

  <body >

  购买记录详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#CBD8AC" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>商品编号：</td><td width='39%'>${goumaijilu.shangpinbianhao}</td>
     <td width='11%'>商品名称：</td><td width='39%'>${goumaijilu.shangpinmingcheng}</td></tr><tr>
     <td width='11%'>类别：</td><td width='39%'>${goumaijilu.leibie}</td>
     <td width='11%'>销量：</td><td width='39%'>${goumaijilu.xiaoliang}</td></tr><tr>
     <td width='11%'>库存：</td><td width='39%'>${goumaijilu.kucun}</td>
     <td width='11%'>价格：</td><td width='39%'>${goumaijilu.jiage}</td></tr><tr>
       <td>购买人：</td>
       <td>${goumaijilu.yonghuming}</td>
     <td width='11%'>购买数量：</td><td width='39%'>${goumaijilu.goumaishuliang}</td></tr><tr>
     <td width='11%'>购买金额：</td><td width='39%'>${goumaijilu.goumaijine}</td>
     <td width='11%'>&nbsp;</td><td width='39%'>&nbsp;</td></tr><tr>
     <td width='11%'>备注：</td><td width='39%'>${goumaijilu.beizhu}</td>
     <td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
  </table>

  </body>
</html>

