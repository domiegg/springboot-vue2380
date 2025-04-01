package com.controller;

import java.io.File;
import java.io.IOException;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entity.Dingdanxinxi;
import com.server.DingdanxinxiServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class DingdanxinxiController {
	@Resource
	private DingdanxinxiServer dingdanxinxiService;


   
	@RequestMapping("addDingdanxinxi.do")
	public String addDingdanxinxi(HttpServletRequest request,Dingdanxinxi dingdanxinxi,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		dingdanxinxi.setAddtime(time.toString().substring(0, 19));
		dingdanxinxiService.add(dingdanxinxi);
			String sql="";
			sql="update goumaijilu set issh='是' where yonghuming='"+(String)request.getSession().getAttribute("username")+"'";
			db dbo = new db();
			dbo.hsgexecute(sql);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "dingdanxinxiList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:dingdanxinxiList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateDingdanxinxi.do")
	public String doUpdateDingdanxinxi(int id,ModelMap map,Dingdanxinxi dingdanxinxi){
		dingdanxinxi=dingdanxinxiService.getById(id);
		map.put("dingdanxinxi", dingdanxinxi);
		return "dingdanxinxi_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("dingdanxinxiDetail.do")
	public String dingdanxinxiDetail(int id,ModelMap map,Dingdanxinxi dingdanxinxi){
		dingdanxinxi=dingdanxinxiService.getById(id);
		map.put("dingdanxinxi", dingdanxinxi);
		return "dingdanxinxi_detail";
	}
//	前台详细
	@RequestMapping("ddxxDetail.do")
	public String ddxxDetail(int id,ModelMap map,Dingdanxinxi dingdanxinxi){
		dingdanxinxi=dingdanxinxiService.getById(id);
		map.put("dingdanxinxi", dingdanxinxi);
		return "dingdanxinxidetail";
	}
//	
	@RequestMapping("updateDingdanxinxi.do")
	public String updateDingdanxinxi(int id,ModelMap map,Dingdanxinxi dingdanxinxi,HttpServletRequest request,HttpSession session){
		dingdanxinxiService.update(dingdanxinxi);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:dingdanxinxiList.do";
	}

//	分页查询
	@RequestMapping("dingdanxinxiList.do")
	public String dingdanxinxiList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Dingdanxinxi dingdanxinxi, String dingdanhao, String dingdanjine, String dingdanneirong, String yonghuming, String shouji, String dizhi, String beizhu, String issh, String iszf){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(dingdanhao==null||dingdanhao.equals("")){pmap.put("dingdanhao", null);}else{pmap.put("dingdanhao", dingdanhao);}
		if(dingdanjine==null||dingdanjine.equals("")){pmap.put("dingdanjine", null);}else{pmap.put("dingdanjine", dingdanjine);}
		if(dingdanneirong==null||dingdanneirong.equals("")){pmap.put("dingdanneirong", null);}else{pmap.put("dingdanneirong", dingdanneirong);}
		if(yonghuming==null||yonghuming.equals("")){pmap.put("yonghuming", null);}else{pmap.put("yonghuming", yonghuming);}
		if(shouji==null||shouji.equals("")){pmap.put("shouji", null);}else{pmap.put("shouji", shouji);}
		if(dizhi==null||dizhi.equals("")){pmap.put("dizhi", null);}else{pmap.put("dizhi", dizhi);}
		if(beizhu==null||beizhu.equals("")){pmap.put("beizhu", null);}else{pmap.put("beizhu", beizhu);}
		
		int total=dingdanxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Dingdanxinxi> list=dingdanxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "dingdanxinxi_list";
	}
	
	@RequestMapping("dingdanxinxiList2.do")
	public String dingdanxinxiList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Dingdanxinxi dingdanxinxi, String dingdanhao, String dingdanjine, String dingdanneirong, String yonghuming, String shouji, String dizhi, String beizhu, String issh, String iszf,HttpServletRequest request){
		/*if(session.getAttribute("user")==null){
			return "login";
		}*/
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		pmap.put("yonghuming", (String)request.getSession().getAttribute("username"));
		if(dingdanhao==null||dingdanhao.equals("")){pmap.put("dingdanhao", null);}else{pmap.put("dingdanhao", dingdanhao);}
		if(dingdanjine==null||dingdanjine.equals("")){pmap.put("dingdanjine", null);}else{pmap.put("dingdanjine", dingdanjine);}
		if(dingdanneirong==null||dingdanneirong.equals("")){pmap.put("dingdanneirong", null);}else{pmap.put("dingdanneirong", dingdanneirong);}
		if(shouji==null||shouji.equals("")){pmap.put("shouji", null);}else{pmap.put("shouji", shouji);}
		if(dizhi==null||dizhi.equals("")){pmap.put("dizhi", null);}else{pmap.put("dizhi", dizhi);}
		if(beizhu==null||beizhu.equals("")){pmap.put("beizhu", null);}else{pmap.put("beizhu", beizhu);}
		
		
		int total=dingdanxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Dingdanxinxi> list=dingdanxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "dingdanxinxi_list2";
	}
	
	
	@RequestMapping("ddxxList.do")
	public String ddxxList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Dingdanxinxi dingdanxinxi, String dingdanhao, String dingdanjine, String dingdanneirong, String yonghuming, String shouji, String dizhi, String beizhu, String issh, String iszf){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(dingdanhao==null||dingdanhao.equals("")){pmap.put("dingdanhao", null);}else{pmap.put("dingdanhao", dingdanhao);}
		if(dingdanjine==null||dingdanjine.equals("")){pmap.put("dingdanjine", null);}else{pmap.put("dingdanjine", dingdanjine);}
		if(dingdanneirong==null||dingdanneirong.equals("")){pmap.put("dingdanneirong", null);}else{pmap.put("dingdanneirong", dingdanneirong);}
		if(yonghuming==null||yonghuming.equals("")){pmap.put("yonghuming", null);}else{pmap.put("yonghuming", yonghuming);}
		if(shouji==null||shouji.equals("")){pmap.put("shouji", null);}else{pmap.put("shouji", shouji);}
		if(dizhi==null||dizhi.equals("")){pmap.put("dizhi", null);}else{pmap.put("dizhi", dizhi);}
		if(beizhu==null||beizhu.equals("")){pmap.put("beizhu", null);}else{pmap.put("beizhu", beizhu);}
		
		int total=dingdanxinxiService.getCount(pmap);
		pageBean.setTotal(total);
		List<Dingdanxinxi> list=dingdanxinxiService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "dingdanxinxilist";
	}
	
	@RequestMapping("deleteDingdanxinxi.do")
	public String deleteDingdanxinxi(int id,HttpServletRequest request){
		dingdanxinxiService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:dingdanxinxiList.do";
	}
	
	
}
