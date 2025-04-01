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

import com.entity.Goumaijilu;
import com.server.GoumaijiluServer;
import com.util.PageBean;
import net.sf.json.JSONObject;
import com.util.db;
import java.sql.SQLException;
import java.sql.*;
@Controller
public class GoumaijiluController {
	@Resource
	private GoumaijiluServer goumaijiluService;


   
	@RequestMapping("addGoumaijilu.do")
	public String addGoumaijilu(HttpServletRequest request,Goumaijilu goumaijilu,HttpSession session) throws SQLException{
		Timestamp time=new Timestamp(System.currentTimeMillis());
		
		goumaijilu.setAddtime(time.toString().substring(0, 19));
		goumaijiluService.add(goumaijilu);
		String dd="update shangpinxinxi set kucun=kucun-"+goumaijilu.getGoumaishuliang()+" where shangpinbianhao='"+goumaijilu.getShangpinbianhao()+"'";
		System.out.print(dd);
		db dbo = new db();
		dbo.hsgexecute(dd);
		String cc="update shangpinxinxi set xiaoliang=xiaoliang+"+goumaijilu.getGoumaishuliang()+" where shangpinbianhao='"+goumaijilu.getShangpinbianhao()+"'";
		System.out.print(cc);
		dbo.hsgexecute(cc);
		session.setAttribute("backxx", "添加成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		
		//session.setAttribute("backurl", "goumaijiluList.do");
		
		return "redirect:postback.jsp";
		//return "redirect:goumaijiluList.do";
		
		
		
	}
 
//	处理编辑
	@RequestMapping("doUpdateGoumaijilu.do")
	public String doUpdateGoumaijilu(int id,ModelMap map,Goumaijilu goumaijilu){
		goumaijilu=goumaijiluService.getById(id);
		map.put("goumaijilu", goumaijilu);
		return "goumaijilu_updt";
	}
	
	
	
	
	
//	后台详细
	@RequestMapping("goumaijiluDetail.do")
	public String goumaijiluDetail(int id,ModelMap map,Goumaijilu goumaijilu){
		goumaijilu=goumaijiluService.getById(id);
		map.put("goumaijilu", goumaijilu);
		return "goumaijilu_detail";
	}
//	前台详细
	@RequestMapping("gmjlDetail.do")
	public String gmjlDetail(int id,ModelMap map,Goumaijilu goumaijilu){
		goumaijilu=goumaijiluService.getById(id);
		map.put("goumaijilu", goumaijilu);
		return "goumaijiludetail";
	}
//	
	@RequestMapping("updateGoumaijilu.do")
	public String updateGoumaijilu(int id,ModelMap map,Goumaijilu goumaijilu,HttpServletRequest request,HttpSession session){
		goumaijiluService.update(goumaijilu);
		session.setAttribute("backxx", "修改成功");
		session.setAttribute("backurl", request.getHeader("Referer"));
		return "redirect:postback.jsp";
		//String url = request.getHeader("Referer");
		//return "redirect:"+url;
		//return "redirect:goumaijiluList.do";
	}

//	分页查询
	@RequestMapping("goumaijiluList.do")
	public String goumaijiluList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Goumaijilu goumaijilu, String shangpinbianhao, String shangpinmingcheng, String leibie, String xiaoliang, String kucun, String jiage, String faburen, String goumaishuliang1,String goumaishuliang2, String goumaijine, String yonghuming, String beizhu, String issh){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shangpinbianhao==null||shangpinbianhao.equals("")){pmap.put("shangpinbianhao", null);}else{pmap.put("shangpinbianhao", shangpinbianhao);}
		if(shangpinmingcheng==null||shangpinmingcheng.equals("")){pmap.put("shangpinmingcheng", null);}else{pmap.put("shangpinmingcheng", shangpinmingcheng);}
		if(leibie==null||leibie.equals("")){pmap.put("leibie", null);}else{pmap.put("leibie", leibie);}
		if(xiaoliang==null||xiaoliang.equals("")){pmap.put("xiaoliang", null);}else{pmap.put("xiaoliang", xiaoliang);}
		if(kucun==null||kucun.equals("")){pmap.put("kucun", null);}else{pmap.put("kucun", kucun);}
		if(jiage==null||jiage.equals("")){pmap.put("jiage", null);}else{pmap.put("jiage", jiage);}
		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}
		if(goumaishuliang1==null||goumaishuliang1.equals("")){pmap.put("goumaishuliang1", null);}else{pmap.put("goumaishuliang1", goumaishuliang1);}
		if(goumaishuliang2==null||goumaishuliang2.equals("")){pmap.put("goumaishuliang2", null);}else{pmap.put("goumaishuliang2", goumaishuliang2);}
		if(goumaijine==null||goumaijine.equals("")){pmap.put("goumaijine", null);}else{pmap.put("goumaijine", goumaijine);}
		if(yonghuming==null||yonghuming.equals("")){pmap.put("yonghuming", null);}else{pmap.put("yonghuming", yonghuming);}
		if(beizhu==null||beizhu.equals("")){pmap.put("beizhu", null);}else{pmap.put("beizhu", beizhu);}
		
		int total=goumaijiluService.getCount(pmap);
		pageBean.setTotal(total);
		List<Goumaijilu> list=goumaijiluService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "goumaijilu_list";
	}
	
	@RequestMapping("goumaijiluList3.do")
	public String goumaijiluList3(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Goumaijilu goumaijilu, String shangpinbianhao, String shangpinmingcheng, String leibie, String xiaoliang, String kucun, String jiage, String faburen, String goumaishuliang1,String goumaishuliang2, String goumaijine, String yonghuming, String beizhu, String issh,HttpServletRequest request){
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
		pmap.put("faburen", (String)request.getSession().getAttribute("username"));
		if(shangpinbianhao==null||shangpinbianhao.equals("")){pmap.put("shangpinbianhao", null);}else{pmap.put("shangpinbianhao", shangpinbianhao);}
		if(shangpinmingcheng==null||shangpinmingcheng.equals("")){pmap.put("shangpinmingcheng", null);}else{pmap.put("shangpinmingcheng", shangpinmingcheng);}
		if(leibie==null||leibie.equals("")){pmap.put("leibie", null);}else{pmap.put("leibie", leibie);}
		if(xiaoliang==null||xiaoliang.equals("")){pmap.put("xiaoliang", null);}else{pmap.put("xiaoliang", xiaoliang);}
		if(kucun==null||kucun.equals("")){pmap.put("kucun", null);}else{pmap.put("kucun", kucun);}
		if(jiage==null||jiage.equals("")){pmap.put("jiage", null);}else{pmap.put("jiage", jiage);}
		if(goumaishuliang1==null||goumaishuliang1.equals("")){pmap.put("goumaishuliang1", null);}else{pmap.put("goumaishuliang1", goumaishuliang1);}
		if(goumaishuliang2==null||goumaishuliang2.equals("")){pmap.put("goumaishuliang2", null);}else{pmap.put("goumaishuliang2", goumaishuliang2);}
		if(goumaijine==null||goumaijine.equals("")){pmap.put("goumaijine", null);}else{pmap.put("goumaijine", goumaijine);}
		if(beizhu==null||beizhu.equals("")){pmap.put("beizhu", null);}else{pmap.put("beizhu", beizhu);}
		
		
		int total=goumaijiluService.getCount(pmap);
		pageBean.setTotal(total);
		List<Goumaijilu> list=goumaijiluService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "goumaijilu_list3";
	}
	@RequestMapping("goumaijiluList2.do")
	public String goumaijiluList2(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Goumaijilu goumaijilu, String shangpinbianhao, String shangpinmingcheng, String leibie, String xiaoliang, String kucun, String jiage, String faburen, String goumaishuliang1,String goumaishuliang2, String goumaijine, String yonghuming, String beizhu, String issh,HttpServletRequest request){
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
		pmap.put("issh", '否');
		pmap.put("yonghuming", (String)request.getSession().getAttribute("username"));
		if(shangpinbianhao==null||shangpinbianhao.equals("")){pmap.put("shangpinbianhao", null);}else{pmap.put("shangpinbianhao", shangpinbianhao);}
		if(shangpinmingcheng==null||shangpinmingcheng.equals("")){pmap.put("shangpinmingcheng", null);}else{pmap.put("shangpinmingcheng", shangpinmingcheng);}
		if(leibie==null||leibie.equals("")){pmap.put("leibie", null);}else{pmap.put("leibie", leibie);}
		if(xiaoliang==null||xiaoliang.equals("")){pmap.put("xiaoliang", null);}else{pmap.put("xiaoliang", xiaoliang);}
		if(kucun==null||kucun.equals("")){pmap.put("kucun", null);}else{pmap.put("kucun", kucun);}
		if(jiage==null||jiage.equals("")){pmap.put("jiage", null);}else{pmap.put("jiage", jiage);}
		if(goumaishuliang1==null||goumaishuliang1.equals("")){pmap.put("goumaishuliang1", null);}else{pmap.put("goumaishuliang1", goumaishuliang1);}
		if(goumaishuliang2==null||goumaishuliang2.equals("")){pmap.put("goumaishuliang2", null);}else{pmap.put("goumaishuliang2", goumaishuliang2);}
		if(goumaijine==null||goumaijine.equals("")){pmap.put("goumaijine", null);}else{pmap.put("goumaijine", goumaijine);}
		if(beizhu==null||beizhu.equals("")){pmap.put("beizhu", null);}else{pmap.put("beizhu", beizhu);}
		
		
		int total=goumaijiluService.getCount(pmap);
		pageBean.setTotal(total);
		List<Goumaijilu> list=goumaijiluService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "goumaijilu_list2";
	}
	
	
	@RequestMapping("gmjlList.do")
	public String gmjlList(@RequestParam(value="page",required=false)String page,
			ModelMap map,HttpSession session,Goumaijilu goumaijilu, String shangpinbianhao, String shangpinmingcheng, String leibie, String xiaoliang, String kucun, String jiage, String faburen, String goumaishuliang1,String goumaishuliang2, String goumaijine, String yonghuming, String beizhu, String issh){
		if(page==null||page.equals("")){
			page="1";
		}
		PageBean pageBean=new PageBean(Integer.parseInt(page), 15);
		Map<String, Object> pmap=new HashMap<String,Object>();
		pmap.put("pageno", pageBean.getStart());
		pmap.put("pageSize", 15);
		
		
		if(shangpinbianhao==null||shangpinbianhao.equals("")){pmap.put("shangpinbianhao", null);}else{pmap.put("shangpinbianhao", shangpinbianhao);}
		if(shangpinmingcheng==null||shangpinmingcheng.equals("")){pmap.put("shangpinmingcheng", null);}else{pmap.put("shangpinmingcheng", shangpinmingcheng);}
		if(leibie==null||leibie.equals("")){pmap.put("leibie", null);}else{pmap.put("leibie", leibie);}
		if(xiaoliang==null||xiaoliang.equals("")){pmap.put("xiaoliang", null);}else{pmap.put("xiaoliang", xiaoliang);}
		if(kucun==null||kucun.equals("")){pmap.put("kucun", null);}else{pmap.put("kucun", kucun);}
		if(jiage==null||jiage.equals("")){pmap.put("jiage", null);}else{pmap.put("jiage", jiage);}
		if(faburen==null||faburen.equals("")){pmap.put("faburen", null);}else{pmap.put("faburen", faburen);}
		if(goumaishuliang1==null||goumaishuliang1.equals("")){pmap.put("goumaishuliang1", null);}else{pmap.put("goumaishuliang1", goumaishuliang1);}
		if(goumaishuliang2==null||goumaishuliang2.equals("")){pmap.put("goumaishuliang2", null);}else{pmap.put("goumaishuliang2", goumaishuliang2);}
		if(goumaijine==null||goumaijine.equals("")){pmap.put("goumaijine", null);}else{pmap.put("goumaijine", goumaijine);}
		if(yonghuming==null||yonghuming.equals("")){pmap.put("yonghuming", null);}else{pmap.put("yonghuming", yonghuming);}
		if(beizhu==null||beizhu.equals("")){pmap.put("beizhu", null);}else{pmap.put("beizhu", beizhu);}
		
		int total=goumaijiluService.getCount(pmap);
		pageBean.setTotal(total);
		List<Goumaijilu> list=goumaijiluService.getByPage(pmap);
		map.put("page", pageBean);
		map.put("list", list);
		session.setAttribute("p", 1);
		return "goumaijilulist";
	}
	
	@RequestMapping("deleteGoumaijilu.do")
	public String deleteGoumaijilu(int id,HttpServletRequest request){
		goumaijiluService.delete(id);
		String url = request.getHeader("Referer");
		return "redirect:"+url;
		//return "redirect:goumaijiluList.do";
	}
	
	
}
