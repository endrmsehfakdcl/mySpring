package com.keduit.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("select sysdate from dual") // 오라클 더미 테이블
	public String getTime();
	
	// annotation이 없을 때는 xml에서 찾아서 실행한다.
	public String getTime2();
	
}
