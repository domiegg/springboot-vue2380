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
		<TITLE>添加商品信息</TITLE>
	    

 	<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
}
-->
</style>      
	</head>
<%
  String id="";
   %>

<script language="javascript">

function gows()
{
	document.location.href="shangpinxinxi_add.jsp?id=<%=id%>";
}
function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>
	<body>
			<form action="addShangpinxinxi.do" name="form1" method="post">
				      <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1"  style="border-collapse:collapse" bgcolor="#F2FDFF">
						<tr bgcolor="#E7E7E7">
							<td height="20" colspan="2" background="images/table_header.gif">添加商品信息</td>
						</tr>
						<tr ><td width="200">商品编号：</td><td><input name='shangpinbianhao' type='text' id='shangpinbianhao' value='<%=connDbBean.getID()%>' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
		<tr ><td width="200">商品名称：</td><td><input name='shangpinmingcheng' type='text' id='shangpinmingcheng' value='' onblur='hsgcheck()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelshangpinmingcheng' /></td></tr>
		<tr ><td width="200">类别：</td><td><input name='leibie' type='text' id='leibie' value='' onblur='hsgcheck()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelleibie' /></td></tr>
		<tr ><td width="200">销量：</td><td><input name='xiaoliang' type='text' id='xiaoliang' value='0' onblur='checkform()' readonly="readonly"  style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabelxiaoliang' /></td></tr>
		<tr ><td width="200">库存：</td><td><input name='kucun' type='text' id='kucun' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabelkucun' />必需数字型</td></tr>
		<tr ><td width="200">价格：</td><td><input name='jiage' type='text' id='jiage' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabeljiage' />必需数字型</td></tr>
		<tr ><td width="200">图片：</td><td><input name='tupian' type='text' id='tupian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='上传' onClick="up('tupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
		<tr ><td width="200">商品简介：</td><td><textarea name='shangpinjianjie' cols='50' rows='5' id='shangpinjianjie' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>
		
		
						<tr align='center'   height="22">
						    <td width="200"  align="right">&nbsp;						    </td>
						    <td width="75%"  align="left">
						       <input type="submit" name="querenzhuce" id="querenzhuce" value="提交" onClick="return checkform();"/>
						       <input type="reset" value="重置"/>&nbsp;						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>




<script language=javascript >  
function hsgcheck() {
		var shangpinmingcheng = $("#shangpinmingcheng").val();
		if(shangpinmingcheng==""||){
			 $("#clabelshangpinmingcheng").html("<font color=red>商品名称不能为空且长度在3～12位之间！</font>");
			 $("input[id=shangpinmingcheng]").focus();
			 $("#querenzhuce").attr("disabled","disabled");
			 return false;
		} 
		else
		{
			$("#clabelshangpinmingcheng").html("");
			$.ajax({
				url : "quchongShangpinxinxi.do",
				type : "post",
				data : "shangpinmingcheng=" + shangpinmingcheng,
				dataType : "json",
				success:function(result){
				if(result.info=="ng"){
					$("#clabelshangpinmingcheng").html("<font color=red>商品名称已存在，请更换！</font>");
					$("input[id=shangpinmingcheng]").focus();
					$("#querenzhuce").attr("disabled","disabled");
					return false;
				}
				else
				{
					$("#querenzhuce").removeAttr("disabled");
				}
				},
				error:function(){
					$("#clabelshangpinmingcheng").html("系统异常，请检查错误！");
					$("input[id=shangpinmingcheng]").focus();
					$("#querenzhuce").attr("disabled","disabled");
					return false;
				}
			});
		}
	}
</script>


<script language=javascript >  
 
 function checkform(){  
 
	var shangpinmingchengobj = document.getElementById("shangpinmingcheng"); if(shangpinmingchengobj.value==""){document.getElementById("clabelshangpinmingcheng").innerHTML="&nbsp;&nbsp;<font color=red>请输入商品名称</font>";return false;}else{document.getElementById("clabelshangpinmingcheng").innerHTML="  "; } 
	var xiaoliangobj = document.getElementById("xiaoliang"); if(xiaoliangobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(xiaoliangobj.value)){document.getElementById("clabelxiaoliang").innerHTML=""; }else{document.getElementById("clabelxiaoliang").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    var kucunobj = document.getElementById("kucun"); if(kucunobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(kucunobj.value)){document.getElementById("clabelkucun").innerHTML=""; }else{document.getElementById("clabelkucun").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    var jiageobj = document.getElementById("jiage"); if(jiageobj.value!=""){ if(/^[0-9]+.?[0-9]*$/.test(jiageobj.value)){document.getElementById("clabeljiage").innerHTML=""; }else{document.getElementById("clabeljiage").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    


return true;   
}   
popheight=450;
</script>  
