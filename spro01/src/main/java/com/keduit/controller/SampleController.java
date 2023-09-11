package com.keduit.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.keduit.domain.SampleDTO;
import com.keduit.domain.SampleDTOList;
import com.keduit.domain.TodoDTO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	@GetMapping("/error/{statusCode}")
	public String getErrorPage(@PathVariable String StatusCode) {
		return "custom404";
	}

	@RequestMapping("")
	public void basic() {
		log.info("basic---------------------------------------------");
	}

//	@GetMapping("/basicGet")
	@RequestMapping(value = "/basicGet", method = { RequestMethod.GET, RequestMethod.POST })
	public void basicGet() {
		log.info("basicGet------------------------------------------");
	}

	@GetMapping("/ex01")
	public String ex01(SampleDTO dto) {
		log.info("ex01.........." + dto);

		return "ex012345";
	}

	@GetMapping("/ex02")
	public String ex02(@RequestParam("name") String name, @RequestParam("age") int age) {

		log.info("--- name : " + name);
		log.info("---- age : " + age);
		return "ex02";
	}

	@GetMapping("/ex02List")
	public String ex02List(@RequestParam("ids") ArrayList<String> ids) {
		log.info("........ids : " + ids);
		return "ex02List";
	}

	@GetMapping("/ex02Array")
	public void ex02Array(@RequestParam("ids") String[] ids) {
		log.info("ids : " + ids);
		log.info("array ids : " + Arrays.toString(ids));
	}

	@GetMapping("/ex02Bean")
	public void ex02Bean(SampleDTOList list) {
		log.info("list dto : " + list);
	}

//	@InitBinder
//	public void initBinder (WebDataBinder binder) {
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, false));
//	}

	@GetMapping("/ex03")
	public void ex03(TodoDTO todo) {
		log.info("todo : " + todo);
	}

	@GetMapping("/ex04")
	public String ex04(SampleDTO dto, @ModelAttribute("page") int page) {
		log.info("dto : " + dto);
		log.info("page : " + page);
		return "sample/ex04";
	}

	@GetMapping("/rel")
	public String rel() {
		log.info("rel");
		return "redirect:/sample/re2";
	}

	@GetMapping("/re2")
	public void re2() {
		log.info("re2 : ");
	}

	@GetMapping("/ex06")
	public @ResponseBody SampleDTO ex06() {
		log.info("/ex06 : ");
		SampleDTO dto = new SampleDTO();
		dto.setAge(25);
		dto.setName("홍길동");
		return dto;
	}

	@GetMapping("/ex07")
	public ResponseEntity<String> ex07() {

		log.info("/ex07");
		String msg = "{\"name\" : \"홍길동\"}";
		HttpHeaders header = new HttpHeaders();
		header.add("Content-type", "application/json;charset=UTF-8");
		return new ResponseEntity<>(msg, header, HttpStatus.OK);
	}

	@GetMapping("/exUpload")
	public void exUpload() {
		log.info("/exUpload");
	}

	@PostMapping
	public void exUploadPost(ArrayList<MultipartFile> files) {
		files.forEach(file -> {
			log.info("--------------------------");
			log.info("name : " + file.getOriginalFilename());
			log.info("size: " + file.getSize());
			log.info("contentType: " + file.getContentType());
		});
	}

}
