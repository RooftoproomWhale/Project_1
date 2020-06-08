package com.kosmo.proj.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class NoticeController {

	//공지사항
	@RequestMapping("/Homespital/Notice.hst")
	public String Noticewrite() {
		
		return "Notice.tiles";
	}

}
