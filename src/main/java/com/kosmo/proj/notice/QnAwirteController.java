package com.kosmo.proj.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class QnAwirteController {

	//공지사항 글쓰기
	@RequestMapping("/QnA/QnAwrite.hst")
	public String QnAwrite() {

		return "QnAwrite.tiles";
	}

}
