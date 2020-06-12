package com.kosmo.proj.service.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class administrationController {

	@RequestMapping("/Administration/administration.hst")
	public String administration()
	{
		return "administration.tiles";
	}
}
