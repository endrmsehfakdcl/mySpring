package com.keduit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyVO;
import com.keduit.mapper.ReplyMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service("ReplyServiceImpl")
@Log4j
@RequiredArgsConstructor
@ToString
public class ReplyServiceImpl implements ReplyService {
	
	private final ReplyMapper mapper;
	
	@Override
	public Long register(ReplyVO vo) {
		log.info(vo);
		mapper.insert(vo);
		return vo.getRno();
	}

	@Override
	public ReplyVO get(Long rno) {
		ReplyVO vo = new ReplyVO();
		vo = mapper.read(rno);
		return vo;
	}

	@Override
	public boolean remove(Long rno) {
		return mapper.delete(rno) == 1;
	}

	@Override
	public boolean update(ReplyVO vo) {
		return mapper.update(vo) == 1;
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("ReplyService getList : " + cri);
		return mapper.getListWithPaging(cri, bno);
	}

}
