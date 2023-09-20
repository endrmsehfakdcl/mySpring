package com.keduit.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleServiceTests {

	@Setter(onMethod_ = @Autowired)
	private SampleService service;

	@Setter(onMethod_ = @Autowired)
	private SampleTxService txservice;

	@Test
	public void testClass() {
		log.info(service);
		log.info(service.getClass().getName());
	}

	@Test
	public void testAdd() throws Exception {
		log.info(service.doAdd("567", "500"));
	}

	@Test
	public void testException() throws Exception {
		log.info(service.doAdd("123", "abc"));
	}

	@Test
	public void testLong() {
		String str = "Lorem ipsum dolor sit amet consectetur adipisicing elit. "
				+ "Ipsum qui, eum deserunt, obcaecati veniam recusandae eius velit "
				+ "excepturi mollitia voluptate doloribus delectus eos blanditiis "
				+ "temporibus atque ipsam exercitationem debitis ex!";
		log.info(str.getBytes().length);
		txservice.addData(str);

	}
}
