package com.kosmo.proj.Notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class QnAController {

	//공지사항 글쓰기
	@RequestMapping("/Notice/QnA.hst")
	public String QnA() {

		return "QnA.tiles";
	}

}
