package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Dingdanxinxi;

public interface DingdanxinxiServer {

  public int add(Dingdanxinxi po);

  public int update(Dingdanxinxi po);
  
  
  
  public int delete(int id);

  public List<Dingdanxinxi> getAll(Map<String,Object> map);
  public List<Dingdanxinxi> getsydingdanxinxi1(Map<String,Object> map);
  public List<Dingdanxinxi> getsydingdanxinxi2(Map<String,Object> map);
  public List<Dingdanxinxi> getsydingdanxinxi3(Map<String,Object> map);
  public Dingdanxinxi quchongDingdanxinxi(Map<String, Object> acount);

  public Dingdanxinxi getById( int id);

  public List<Dingdanxinxi> getByPage(Map<String, Object> map);

  public int getCount(Map<String,Object> map);

  public List<Dingdanxinxi> select(Map<String, Object> map);
}
//	所有List
