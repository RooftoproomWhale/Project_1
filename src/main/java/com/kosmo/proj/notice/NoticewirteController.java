package com.kosmo.proj.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class NoticewirteController {

	//공지사항 글쓰기
	@RequestMapping("/Notice/Noticewrite.hst")
	public String Noticewrite() {

		return "Noticewrite.tiles";
	}

}
