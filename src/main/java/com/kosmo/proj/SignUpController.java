package com.kosmo.proj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SignUpController {

	@RequestMapping("/Signup/SignForm.do")
	public String toForm()
	{
		return "SignUp.tiles";
	}
}
