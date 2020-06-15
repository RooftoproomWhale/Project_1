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
	
	@Resource(name = "mapService")
	private MapService mapService;

	@RequestMapping("/Account/SignForm.hst")
	public String toForm()
	{
		return "SignUp.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Account/loadHospitalList.hst",produces = "text/html; charset=UTF-8")
	public String hospitalList(@RequestParam Map map)
	{
		List<Map> list = mapService.selectList(map);
		
		String search_keyword = map.get("search_keyword").toString();

		System.out.println(JSONArray.toJSONString(list));
		
		return JSONArray.toJSONString(list);
	}
}
