package com.keduit.sample;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Component
@ToString
@Getter
@RequiredArgsConstructor // 생성자 주입
public class SampleHotel {

	private final Chef chef;

//	public SampleHotel(Chef chef) {
//		this.chef = chef;
//	}
}