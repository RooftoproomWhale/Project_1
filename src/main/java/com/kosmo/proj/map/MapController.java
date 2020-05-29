package com.kosmo.proj.map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MapController {
	
	@RequestMapping("/Homespital/Map.hst")
	public String map()
	{
		return "Map.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Mask.hst",produces = "text/html; charset=UTF-8")
	public String maskMap()
	{
		return 
	}
}
