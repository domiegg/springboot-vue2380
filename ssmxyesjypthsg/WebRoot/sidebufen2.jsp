<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
  <div class="layout bg4">
    <div class="ind_news">
      <ul>
        <a >
        <li>
         
          <div>
        
          </div>
        </li>
        </a>
      </ul>
    </div>
  </div>
<script type="text/javascript" >
$(document).ready(function() {
  $(".ind_news li").hover(function() {
        $(this).find("img").stop().animate({ marginTop: "-5px" }, 200);
        $(this).addClass("ind_news_color")
    },function(){
        $(this).find("img").stop().animate({ marginTop: "0" }, 300);
        $(this).removeClass("ind_news_color")
    });
  });
</script>