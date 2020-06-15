package com.kosmo.proj.service.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.json.XML;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CovidViewController {
	
	@RequestMapping(value = "/Covid/View.hst", produces = "text/html; charset=UTF-8")
	public String covidView()
	{
		return "covid.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "/Covid/Daily.hst", produces = "text/html; charset=UTF-8")
	public String covidDaily(@RequestParam Map map)
	{
		Object obj = map.get("today");
		System.out.println(obj);
		String todayStr = obj.toString();
		int today = Integer.parseInt(todayStr);
		
		String apiUrl = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=MW8v8XOcW8%2FPqi2QbnzB%2BFmMup0JvuDcWhhs7YFdz%2B%2BXvicvnz4U%2BJgebG3oltd8qkLrAYIV%2FQ3g12PCTYxCUA%3D%3D&pageNo=1&numOfRows=10&startCreateDt="+(today-7)+"&endCreateDt="+today+"&";
		
		System.out.println(apiUrl);
		
		String responseBody = get(apiUrl);
        System.out.println(responseBody);
        
        JSONObject jsonObj = XML.toJSONObject(responseBody);
        System.out.println(jsonObj);
		
		return jsonObj.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/Covid/Exam.hst", produces = "text/html; charset=UTF-8")
	public String covidExam(@RequestParam Map map)
	{
		Object obj = map.get("today");
		System.out.println(obj);
		String todayStr = obj.toString();
		int today = Integer.parseInt(todayStr);
		
		String apiUrl = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson?serviceKey=MW8v8XOcW8%2FPqi2QbnzB%2BFmMup0JvuDcWhhs7YFdz%2B%2BXvicvnz4U%2BJgebG3oltd8qkLrAYIV%2FQ3g12PCTYxCUA%3D%3D&pageNo=1&numOfRows=10&startCreateDt="+(today-1)+"&endCreateDt="+(today-1)+"&";
		
		System.out.println(apiUrl);
		
		String responseBody = get(apiUrl);
//        System.out.println(responseBody);
        
        JSONObject jsonObj = XML.toJSONObject(responseBody);
//        System.out.println(jsonObj);
		
		return jsonObj.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/Covid/Location.hst", produces = "text/html; charset=UTF-8")
	public String covidLocation(@RequestParam Map map)
	{
		Object obj = map.get("today");
		System.out.println(obj);
		String todayStr = obj.toString();
		int today = Integer.parseInt(todayStr);
		
		String apiUrl = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19SidoInfStateJson?serviceKey=MW8v8XOcW8%2FPqi2QbnzB%2BFmMup0JvuDcWhhs7YFdz%2B%2BXvicvnz4U%2BJgebG3oltd8qkLrAYIV%2FQ3g12PCTYxCUA%3D%3D&pageNo=1&numOfRows=10&startCreateDt="+(today-1)+"&endCreateDt"+(today-1)+"&";
		
		System.out.println(apiUrl);
		
		String responseBody = get(apiUrl);
//        System.out.println(responseBody);
        
        JSONObject jsonObj = XML.toJSONObject(responseBody);
//        System.out.println(jsonObj);
		
		return jsonObj.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/Covid/Nation.hst", produces = "text/html; charset=UTF-8")
	public String covidNation(@RequestParam Map map)
	{
		Object obj = map.get("today");
		System.out.println(obj);
		String todayStr = obj.toString();
		int today = Integer.parseInt(todayStr);
		String apiUrl = "http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19NatInfStateJson?serviceKey=MW8v8XOcW8%2FPqi2QbnzB%2BFmMup0JvuDcWhhs7YFdz%2B%2BXvicvnz4U%2BJgebG3oltd8qkLrAYIV%2FQ3g12PCTYxCUA%3D%3D&pageNo=1&numOfRows=10&startCreateDt=20200614&endCreateDt="+today+"&endCreateDt="+today+"&";
		
		System.out.println(apiUrl);
		
		String responseBody = get(apiUrl);
//        System.out.println(responseBody);
        
        JSONObject jsonObj = XML.toJSONObject(responseBody);
//        System.out.println(jsonObj);
		
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
