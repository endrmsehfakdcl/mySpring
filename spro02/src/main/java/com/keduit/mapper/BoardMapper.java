package com.keduit.mapper;

import java.util.List;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;

public interface BoardMapper {
//	@Select("select * from board where bno > 0")
	public List<BoardVO> getList();

	public List<BoardVO> getListWithPaging(Criteria cri);

	public void insert(BoardVO boardVO);

	public void insertSelectKey(BoardVO boardVO);

	public BoardVO read(Long bno);

	public int delete(Long bno);

	public int update(BoardVO boardVO);
}
