package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Goumaijilu;

public interface GoumaijiluServer {

  public int add(Goumaijilu po);

  public int update(Goumaijilu po);
  
  
  
  public int delete(int id);

  public List<Goumaijilu> getAll(Map<String,Object> map);
  public List<Goumaijilu> getsygoumaijilu1(Map<String,Object> map);
  public List<Goumaijilu> getsygoumaijilu2(Map<String,Object> map);
  public List<Goumaijilu> getsygoumaijilu3(Map<String,Object> map);
  public Goumaijilu quchongGoumaijilu(Map<String, Object> acount);

  public Goumaijilu getById( int id);

  public List<Goumaijilu> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Goumaijilu> select(Map<String, Object> map);
}
//	所有List
