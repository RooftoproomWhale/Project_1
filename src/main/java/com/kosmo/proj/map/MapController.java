package com.kosmo.proj.map;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.xml.bind.annotation.XmlRegistry;

import org.json.JSONObject;
import org.json.XML;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MapService;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.MemberService;
import com.kosmo.proj.service.PharmacyDTO;

@Controller
public class MapController {
	
	@Resource(name = "mapService")
	private MapService mapService;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	@RequestMapping("/Homespital/Map.hst")
	public String map(Authentication auth,Model model)
	{
		if(auth != null)
		{
			UserDetails userDetails = (UserDetails)auth.getPrincipal();
			Map map = new HashMap<String, String>();
			map.put("userEmail", userDetails.getUsername());
			System.out.println(userDetails.getUsername());
			MemberDTO dto = memberService.selectOne(map);
			System.out.println(dto.getMem_email());
			model.addAttribute("MemberDTO", dto);
		}
		
		return "map/Map.no_tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Reservation.hst",method=RequestMethod.POST)
	public String reservation(@RequestParam Map map) {
		
		int affected = mapService.insertReservation(map);
		
		System.out.println(affected);
		
		return String.valueOf(affected);
	}
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/searchList.hst",produces = "text/html; charset=UTF-8")
	public String searchList(@RequestParam Map map) {
		List<Map> list = null;
		String apiStatus = map.get("apiStatus").toString();
		JSONArray ja = new JSONArray();
		
		if(apiStatus.equals("0"))
		{
			list = mapService.searchHospitalList(map);
			for (int i = 0; i < list.size(); i++) {
//				ja.add(list.get(i).get("HOSP_NAME").toString() + "("  + list.get(i).get("ADDRESS").toString().substring(0, 2)+ ")");
				ja.add(list.get(i).get("HOSP_NAME").toString());
			}
		}
		else if(apiStatus.equals("1") || apiStatus.equals("2"))
		{
			list = mapService.searchPharmacyList(map);
			for (int i = 0; i < list.size(); i++) {
//				ja.add(list.get(i).get("PHAR_NAME").toString() + "(" + list.get(i).get("ADDRESS").toString().substring(0, 2)+ ")");
				ja.add(list.get(i).get("PHAR_NAME").toString());
			}
		}
		else
		{
			
		}
		
		return ja.toJSONString();
	}
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/detailView.hst",produces = "text/html; charset=UTF-8")
	public String detailList(@RequestParam Map map) {
		
		List<Map> list = null;
		String apiStatus = map.get("apiStatus").toString();
		JSONArray ja = new JSONArray();
		
		if(apiStatus.equals("0"))
		{
			list = mapService.selectHospitalOne(map);
			String depart = "";
			for (int i = 0; i < list.size(); i++) {
				if(i==list.size()-1)
				{
					depart += list.get(i).get("DEPT_NAME").toString();
				}
				else
				{
					depart += list.get(i).get("DEPT_NAME").toString() + ',';
				}
			}
			list.get(0).replace("DEPT_NAME", depart);
			
		}
		else if(apiStatus.equals("1") || apiStatus.equals("2"))
		{
			list = mapService.selectPharmacyOne(map);
			
		}
		
//		return JSONArray.toJSONString(list);
		return JSONArray.toJSONString(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/hospitalList.hst",produces = "text/html; charset=UTF-8")
	public String hospitalList(@RequestParam Map map)
	{
		List<Map> list = mapService.selectList(map);
		
		String search_keyword = map.get("search_keyword").toString();

		System.out.println(JSONArray.toJSONString(list));
		
		return JSONArray.toJSONString(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/pharmacyList.hst",produces = "text/html; charset=UTF-8")
	public String pharmacyList(@RequestParam Map map)
	{
		List<Map> list = mapService.selectPharmacyList(map);


		String search_keyword = map.get("search_keyword").toString();

		System.out.println(JSONArray.toJSONString(list));
		
		return JSONArray.toJSONString(list);
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Hospital.hst",produces = "text/html; charset=UTF-8")
	public String hospitalMap(@RequestParam Map map)
	{
		String latitude = map.get("lat").toString();
		String longitude = map.get("lng").toString();
		
		String apiUrl = "http://apis.data.go.kr/B552657/HsptlAsembySearchService/getHsptlMdcncLcinfoInqire?serviceKey=MW8v8XOcW8%2FPqi2QbnzB%2BFmMup0JvuDcWhhs7YFdz%2B%2BXvicvnz4U%2BJgebG3oltd8qkLrAYIV%2FQ3g12PCTYxCUA%3D%3D"
				+ "&WGS84_LON=" + longitude
				+ "&WGS84_LAT=" + latitude
				+ "&pageNo=1"
				+ "&numOfRows=20";
		
		System.out.println(apiUrl);
		
		String responseBody = get(apiUrl);
        System.out.println(responseBody);
        
        JSONObject jsonObj = XML.toJSONObject(responseBody);
        System.out.println(jsonObj);
        
		return jsonObj.toString();
	}
	*/
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Hospital.hst",produces = "text/html; charset=UTF-8")
	public String hospitalMap(@RequestParam Map map)
	{
//		String latitude = map.get("lat").toString();
//		String longitude = map.get("lng").toString();
		
		List<HospitalDTO> list = mapService.selectHospitalByXY(map);

		System.out.println(net.sf.json.JSONArray.fromObject(list));
		
		return net.sf.json.JSONArray.fromObject(list).toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Hospital/countReservation.hst",produces = "text/html; charset=UTF-8")
	public String countReservation(@RequestParam Map map)
	{
		int count = mapService.selectCntReservation(map);
		
		System.out.println(JSONObject.numberToString(count));
		return JSONObject.numberToString(count);
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Pharmacy.hst",produces = "text/html; charset=UTF-8")
	public String pharmacyMap(@RequestParam Map map)
	{
		String latitude = map.get("lat").toString();
		String longitude = map.get("lng").toString();

		String apiUrl = "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyLcinfoInqire?serviceKey=MW8v8XOcW8%2FPqi2QbnzB%2BFmMup0JvuDcWhhs7YFdz%2B%2BXvicvnz4U%2BJgebG3oltd8qkLrAYIV%2FQ3g12PCTYxCUA%3D%3D"
				+ "&WGS84_LON=" + longitude
				+ "&WGS84_LAT=" + latitude
				+ "&pageNo=1"
				+ "&numOfRows=20";
		
		System.out.println(apiUrl);
		
		String responseBody = get(apiUrl);
        System.out.println(responseBody);
        
        JSONObject jsonObj = XML.toJSONObject(responseBody);
        System.out.println(jsonObj);
        
		return jsonObj.toString();
	}*/
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Pharmacy.hst",produces = "text/html; charset=UTF-8")
	public String pharmacyMap(@RequestParam Map map)
	{
		List<PharmacyDTO> list = mapService.selectPharmacyByXY(map);

		System.out.println(net.sf.json.JSONArray.fromObject(list));
		
		return net.sf.json.JSONArray.fromObject(list).toString();
	}
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Covid.hst",produces = "text/html; charset=UTF-8")
	public String covidMap()
	{
		List<Map> list = mapService.selectList();
	
		System.out.println(JSONArray.toJSONString(list));
		
		for(Map comment:list)
			comment.put("CORONA_DATE",comment.get("CORONA_DATE").toString());
		
		//단,List에 저장된 객체는 반드시 Map이어야 한다
		return JSONArray.toJSONString(list);
	}

	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Mask.hst",produces = "text/html; charset=UTF-8")
	public String maskMap(@RequestParam Map map)
	{
		String latitude = map.get("lat").toString();
		String longitude = map.get("lng").toString();
		
		String apiUrl = "https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat="+latitude+"&lng="+longitude;
		
		String responseBody = get(apiUrl);
        System.out.println(responseBody);
        
		return responseBody;
	}
	private static String get(String apiUrl) {
        HttpURLConnection con = connect(apiUrl);

        try {
            con.setRequestMethod("GET");
           
            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect(); // Connection을 재활용할 필요가 없는 프로세스일 경우
        }
    }
	
	private static HttpURLConnection connect(String apiUrl) {
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
	
	private static String readBody(InputStream body) {
        InputStreamReader streamReader = new InputStreamReader(body, StandardCharsets.UTF_8);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line+ "\n");
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
