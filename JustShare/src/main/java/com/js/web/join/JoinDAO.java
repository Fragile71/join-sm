package com.js.web.join;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinDAO{
	public int join(JoinDTO joinDTO);

	public int checkID(String mid);
	
	
}


