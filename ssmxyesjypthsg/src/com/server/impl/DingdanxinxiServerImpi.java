package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.DingdanxinxiMapper;
import com.entity.Dingdanxinxi;
import com.server.DingdanxinxiServer;
@Service
public class DingdanxinxiServerImpi implements DingdanxinxiServer {
   @Resource
   private DingdanxinxiMapper gdao;
	@Override
	public int add(Dingdanxinxi po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Dingdanxinxi po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Dingdanxinxi> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Dingdanxinxi> getsydingdanxinxi1(Map<String, Object> map) {
		return gdao.getsydingdanxinxi1(map);
	}
	public List<Dingdanxinxi> getsydingdanxinxi2(Map<String, Object> map) {
		return gdao.getsydingdanxinxi2(map);
	}
	public List<Dingdanxinxi> getsydingdanxinxi3(Map<String, Object> map) {
		return gdao.getsydingdanxinxi3(map);
	}
	
	@Override
	public Dingdanxinxi quchongDingdanxinxi(Map<String, Object> account) {
		return gdao.quchongDingdanxinxi(account);
	}

	@Override
	public List<Dingdanxinxi> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Dingdanxinxi> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Dingdanxinxi getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

