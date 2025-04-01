<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" import="java.sql.*" %>
<jsp:useBean id="connDbBean" scope="page" class="com.util.db"/>


<div class="layout" style="border-bottom:1px solid #dedede;"></div>
  <div class="layout bg3">
    <div class="foot">
      <div class="foot_lef">
        <div class="goumai_b">
          <div class="slideTxtBox">
            <div class="hd">
              <ul>
               
              </ul>
            </div>
            <div class="bd">
            
            </div>
          </div>
          <script type="text/javascript">jQuery(".slideTxtBox").slide();</script>
           <!--  <script type="text/javascript">jQuery(".slideTxtBox").slide({trigger:"click"});</script> -->
        </div>
      </div>
      <div class="foot_rig">
        <div class="foot_rig_t">
          <a href="#"><span><img src="qtimages/picture/l_01.png"></span></a>
          <a href="#"><span><img src="qtimages/picture/l_02.png"></span></a>
          <a href="#"><span><img src="qtimages/picture/l_03.png"></span></a>
          <a href="#"><span><img src="qtimages/picture/l_04.png"></span></a>
        </div>
        <div class="foot_rig_o">@ 2019  网上超市 . All Rights Reserved. <a href="#">沪ICP备xxxxxx号</a>&nbsp;</div>
      </div>
    </div>
  </div>
  <p id="back-to-top"><a href="#top"><span></span></a></p>
  
  </div>
  <script>
      $(function () {
          //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
          $(function () {
              $(window).scroll(function () {
                  if ($(window).scrollTop() > 100) {
                      $("#back-to-top").fadeIn(900);
                  }
                  else {
                      $("#back-to-top").stop().fadeOut(900);
                  }
              });
              //当点击跳转链接后，回到页面顶部位置
              $("#back-to-top").click(function () {
                  $('body,html').stop().animate({ scrollTop: 0 }, 100); //1000代表1秒时间回到顶点
                  return false;
              });
          });
      });
  </script> 