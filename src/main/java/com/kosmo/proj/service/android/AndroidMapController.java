package com.kosmo.proj.service.android;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.json.XML;
import org.json.simple.JSONArray;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kosmo.proj.service.MapService;

@RestController
@RequestMapping("/Android/Map")
public class AndroidMapController {

	@Resource(name = "mapService")
	private MapService mapService;
	
	@CrossOrigin
	@GetMapping(value = "/Hospital", produces = "text/plain;charset=UTF-8")
	public String hospitalMap(@RequestParam Map map)
	{
//		List<Map> list = mapService.selectHospitalList(map);
//		
//		return JSONArray.toJSONString(list);
		String latitude = map.get("lat").toString();
		String longitude = map.get("lng").toString();
		
//		String apiUrl = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?serviceKey=MW8v8XOcW8%2FPqi2QbnzB%2BFmMup0JvuDcWhhs7YFdz%2B%2BXvicvnz4U%2BJgebG3oltd8qkLrAYIV%2FQ3g12PCTYxCUA%3D%3D"
//				+ "&xPos="+longitude
//				+ "&yPos="+latitude
//				+ "&radius=500";
		
		String apiUrl = "http://apis.data.go.kr/B551182/hospInfoService/getHospBasisList?serviceKey=MW8v8XOcW8%2FPqi2QbnzB%2BFmMup0JvuDcWhhs7YFdz%2B%2BXvicvnz4U%2BJgebG3oltd8qkLrAYIV%2FQ3g12PCTYxCUA%3D%3D"
				+ "&pageNo=1"
				+ "&numOfRows=50"
				+ "&xPos="+longitude
				+ "&yPos="+latitude
				+ "&radius=3000";
		
		String responseBody = get(apiUrl);
        System.out.println(responseBody);
        
        JSONObject jsonObj = XML.toJSONObject(responseBody);
        System.out.println(jsonObj);
        
		return jsonObj.toString();
       
	}
	@CrossOrigin
	@GetMapping(value = "/Pharmacy", produces = "text/plain;charset=UTF-8")
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
