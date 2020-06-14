package com.kosmo.proj.Notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class FAQController {

	//공지사항 글쓰기
	@RequestMapping("/Notice/FAQ.hst")
	public String FAQ() {

		return "FAQ.tiles";
	}

}
