package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Goumaijilu;

public interface GoumaijiluMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Goumaijilu record);

    int insertSelective(Goumaijilu record);

    Goumaijilu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goumaijilu record);
	
    int updateByPrimaryKey(Goumaijilu record);
	public Goumaijilu quchongGoumaijilu(Map<String, Object> yonghuming);
	public List<Goumaijilu> getAll(Map<String, Object> map);
	public List<Goumaijilu> getsygoumaijilu1(Map<String, Object> map);
	public List<Goumaijilu> getsygoumaijilu3(Map<String, Object> map);
	public List<Goumaijilu> getsygoumaijilu2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Goumaijilu> getByPage(Map<String, Object> map);
	public List<Goumaijilu> select(Map<String, Object> map);
//	所有List
}

