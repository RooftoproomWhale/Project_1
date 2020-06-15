package com.kosmo.proj.Notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mainController {

@GetMapping("write")
	public String boardWrite()
	{
		return "board/boardWrite";
	}
}