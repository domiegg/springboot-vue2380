package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.GoumaijiluMapper;
import com.entity.Goumaijilu;
import com.server.GoumaijiluServer;
@Service
public class GoumaijiluServerImpi implements GoumaijiluServer {
   @Resource
   private GoumaijiluMapper gdao;
	@Override
	public int add(Goumaijilu po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Goumaijilu po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	
	
	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Goumaijilu> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}
	
	public List<Goumaijilu> getsygoumaijilu1(Map<String, Object> map) {
		return gdao.getsygoumaijilu1(map);
	}
	public List<Goumaijilu> getsygoumaijilu2(Map<String, Object> map) {
		return gdao.getsygoumaijilu2(map);
	}
	public List<Goumaijilu> getsygoumaijilu3(Map<String, Object> map) {
		return gdao.getsygoumaijilu3(map);
	}
	
	@Override
	public Goumaijilu quchongGoumaijilu(Map<String, Object> account) {
		return gdao.quchongGoumaijilu(account);
	}

	@Override
	public List<Goumaijilu> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Goumaijilu> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Goumaijilu getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

}

