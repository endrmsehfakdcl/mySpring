package com.keduit.service;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired 
	private BoardService service;

	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("service에서 insert");
		board.setContent("service에서 insert");
		board.setWriter("admin");

		Long bno = service.register(board);
		log.info("생성된 게시물 번호 : " + bno);
	}

	@Test
	public void testGet() {
		BoardVO board = new BoardVO();
		board = service.get(3L);
		log.info(board);
	}

	@Test
	public void testGetList() {
		log.info(service.getList());
	}

	@Test
	public void testRemove() {
		log.info(service.remove(2L) ? "삭제 성공" : "삭제 실패");
	}

	@Test
	public void testModify() {
		BoardVO board = new BoardVO();
		board.setTitle("서비스 제목");
		board.setContent("서비스 내용");
		board.setWriter("서비스 작가");
		board.setBno(5L);
		log.info(service.modify(board) ? "수정 성공" : "수정 실패");
	}

}
