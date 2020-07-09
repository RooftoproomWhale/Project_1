package com.kosmo.proj.service.android;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.proj.service.MemberService;
import com.kosmo.proj.service.PrescriptionDTO;
import com.kosmo.proj.service.ReservationDTO;

@RestController
@RequestMapping("/Android/Basic")
public class AndroidBasicController {
	
	@Resource(name = "memberService")
	private MemberService service;
	
	@CrossOrigin
	@GetMapping(value = "/myPage/recentApt", produces = "text/plain;charset=UTF-8")
	public String recentApt(@RequestParam Map map)
	{
		System.out.println(map.get("userEmail"));
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		ReservationDTO dto = service.recentApt(map);
		System.out.println(dto.getHOSP_NAME());
		System.out.println(dto.getMEM_NAME());
		
		try {
			jsonStr = mapper.writeValueAsString(dto);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return jsonStr.toString();
	}
	
	@CrossOrigin
	@GetMapping(value = "/getPres", produces = "text/plain;charset=UTF-8")
	public String getPres(@RequestParam Map map)
	{
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		PrescriptionDTO dto = service.recentPres(map);
		System.out.println(dto.getMedi_name());
		System.out.println(dto.getAlarm());
		System.out.println(dto.getCount());
		System.out.println(dto.getPres_date());
		System.out.println(dto.getDuration());
		
		try {
			jsonStr = mapper.writeValueAsString(dto);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		return jsonStr.toString();
	}
	
	@CrossOrigin
	@GetMapping(value = "/getPreMedi", produces = "text/plain;charset=UTF-8")
	public String getPreMedi(@RequestParam Map map)
	{
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = null;
		List<PrescriptionDTO> list = service.getPreMedi(map);
		for(PrescriptionDTO item:list)
		{
			System.out.println(item.getAlarm());
			System.out.println(item.getMedi_name());
		}
		
		try {
			jsonStr = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return jsonStr.toString();
	}

}
