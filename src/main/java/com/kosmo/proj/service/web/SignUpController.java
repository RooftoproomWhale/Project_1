package com.kosmo.proj.service.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignUpController {

	@RequestMapping("/Account/SignForm.hst")
	public String toForm()
	{
		return "SignUp.tiles";
	}
}