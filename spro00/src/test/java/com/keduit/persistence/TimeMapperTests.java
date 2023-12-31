package com.keduit.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.mapper.TimeMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TimeMapperTests {

	@Autowired
	private TimeMapper timeMapper;

	@Test
	public void testGetTime() {
		log.info(timeMapper.getClass()); // class com.sun.proxy.$Proxy23
		log.info(timeMapper.getTime()); // 2023-09-07 15:39:38
	}

	@Test
	public void testGetTime2() {
		log.info(timeMapper.getTime2()); // 2023-09-07 16:14:00
/*
|--------------------|
|sysdate             |
|--------------------|
|2023-09-07 16:32:00 |
|--------------------|
*/
	}
}
