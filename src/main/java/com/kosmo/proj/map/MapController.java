package com.kosmo.proj.map;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;

import javax.xml.bind.annotation.XmlRegistry;

import org.json.JSONObject;
import org.json.XML;
import org.json.simple.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MapController {
	
	@RequestMapping("/Homespital/Map.hst")
	public String map()
	{
		return "Map.tiles";
	}
	
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
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Map/Pharmacy.hst",produces = "text/html; charset=UTF-8")
	public String pharmacyMap(@RequestParam Map map)
	{
		String latitude = map.get("lat").toString();
		String longitude = map.get("lng").toString();

		String apiUrl = "http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyLcinfoInqire?serviceKey=MW8v8XOcW8%2FPqi2QbnzB%2BFmMup0JvuDcWhhs7YFdz%2B%2BXvicvnz4U%2BJgebG3oltd8qkLrAYIV%2FQ3g12PCTYxCUA%3D%3D"
				+ "&WGS84_LON=" + longitude
				+ "&WGS84_LAT=" + latitude;
		
		System.out.println(apiUrl);
		
		String responseBody = get(apiUrl);
        System.out.println(responseBody);
        
        JSONObject jsonObj = XML.toJSONObject(responseBody);
        System.out.println(jsonObj);
        
		return jsonObj.toString();
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
