package com.keduit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyVO;

public interface ReplyService {

	public Long register(ReplyVO vo);

	public ReplyVO get(Long rno);

	public boolean remove(Long rno);

	public boolean update(ReplyVO vo);

	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno);
}
