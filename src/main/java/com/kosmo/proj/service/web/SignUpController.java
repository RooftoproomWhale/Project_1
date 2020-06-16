package com.kosmo.proj.service.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.proj.service.MapService;

@Controller
public class SignUpController {
	
	@RequestMapping("/Account/SignForm.hst")
	public String toForm()
	{
		return "SignUp.tiles";
	}
	
}
