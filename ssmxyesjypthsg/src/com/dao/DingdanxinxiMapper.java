package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Dingdanxinxi;

public interface DingdanxinxiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dingdanxinxi record);

    int insertSelective(Dingdanxinxi record);

    Dingdanxinxi selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dingdanxinxi record);
	
    int updateByPrimaryKey(Dingdanxinxi record);
	public Dingdanxinxi quchongDingdanxinxi(Map<String, Object> yonghuming);
	public List<Dingdanxinxi> getAll(Map<String, Object> map);
	public List<Dingdanxinxi> getsydingdanxinxi1(Map<String, Object> map);
	public List<Dingdanxinxi> getsydingdanxinxi3(Map<String, Object> map);
	public List<Dingdanxinxi> getsydingdanxinxi2(Map<String, Object> map);
	public int getCount(Map<String, Object> po);
	public List<Dingdanxinxi> getByPage(Map<String, Object> map);
	public List<Dingdanxinxi> select(Map<String, Object> map);
//	所有List
}

