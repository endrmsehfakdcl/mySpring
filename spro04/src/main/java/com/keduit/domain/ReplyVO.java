package com.keduit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno;
	private Long bno;
	private String reply;
	private String replyer;
	private Date replydate;
	private Date updatedate;
}

/*
CREATE TABLE reply (
    rno        NUMBER(10, 0),
    bno        NUMBER(10, 0) NOT NULL,
    reply      VARCHAR2(1000) NOT NULL,
    replyer    VARCHAR2(50) NOT NULL,
    replydate  DATE DEFAULT sysdate,
    updatedate DATE DEFAULT sysdate
);

*/