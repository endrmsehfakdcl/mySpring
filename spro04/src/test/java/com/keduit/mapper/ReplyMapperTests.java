package com.keduit.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Test
	public void testMapper() {
		log.info(mapper);
	}

	@Test
	public void testCreate() {
		IntStream.rangeClosed(1, 100).forEach(i -> {
			ReplyVO vo = new ReplyVO();
			vo.setBno(128L);
			vo.setReply("안녕하세요" + i);
			vo.setReplyer("ㅇㅇ" + i);
			mapper.insert(vo);
		});
	}

	@Test
	public void testRead() {
		Long rno = 42L;
		ReplyVO vo = mapper.read(rno);
		log.info(vo);
	}

	@Test
	public void testDelete() {
		Long rno = 43L;
		mapper.delete(rno);
	}

	@Test
	public void testUpdate() {
		Long rno = 42L;
		ReplyVO vo = mapper.read(rno);
		vo.setReply("댓글 수정합니다");
		int update = mapper.update(vo);
		log.info("update : " + update);
	}

	@Test
	public void testList() {
		Criteria cri = new Criteria();
		Long bno = 128L;
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bno);
		log.info(replies);
	}
	
	@Test
	public void testList2() {
		Criteria cri = new Criteria(2, 10);
		Long bno = 128L;
		List<ReplyVO> replies = mapper.getListWithPaging(cri, bno);
		log.info(replies);
	}

}

