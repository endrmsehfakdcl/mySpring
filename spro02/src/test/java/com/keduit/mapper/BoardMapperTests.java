package com.keduit.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList().forEach(board -> log.info(board));
	}

	@Test
	public void testPaging() {
		Criteria cri = new Criteria();

		cri.setAmount(10);
		cri.setPageNum(7);
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}

	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		for (int i = 1; i < 100; i++) {

			board.setTitle("insert test 코드를 통합 입력" + i);
			board.setContent("insert test 코드를 통합 입력 내용" + i);
			board.setWriter("newbie" + i);
			mapper.insert(board);
			log.info(board);
		}
	}

	@Test
	public void testInsertSelectKey() {
		BoardVO board = new BoardVO();
		board.setTitle("insertSelectKey test 코드를 통합 입력");
		board.setContent("insertSelectKey test 코드를 통합 입력 내용");
		board.setWriter("newbie");
		mapper.insertSelectKey(board);
		log.info(board.getBno());
		log.info(board);
	}

	@Test
	public void testRead() {
		BoardVO board = mapper.read(4L);
		log.info(board);
	}

	@Test
	public void testDelete() {
		int result = mapper.delete(2L);
		log.info("result " + result);
	}

	@Test
	public void testUpdate() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("수정된 제목");
		boardVO.setContent("수정된 내용");
		boardVO.setWriter("수정된 작가");
		boardVO.setBno(4L);
		int result = mapper.update(boardVO);
		log.info(result);
	}

}
