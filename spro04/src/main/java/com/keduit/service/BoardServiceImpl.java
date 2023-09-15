package com.keduit.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service("BoardServiceImpl")
@Log4j
@RequiredArgsConstructor
@ToString
public class BoardServiceImpl implements BoardService {

	private final BoardMapper mapper;

	@Override
	public Long register(BoardVO board) {

		log.info(board);
		mapper.insertSelectKey(board);
		return board.getBno();
	}

	@Override
	public BoardVO get(Long bno) {
		BoardVO board = new BoardVO();
		board = mapper.read(bno);

		return board;
	}

	@Override
	public boolean modify(BoardVO board) {
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		return mapper.delete(bno) == 1;
	}

//	@Override
//	public List<BoardVO> getList() {
//		return mapper.getList();
//	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("Board Service getList" + cri);
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

}
