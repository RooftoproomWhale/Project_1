package com.kosmo.proj.service.android;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kosmo.proj.service.MedicineInfoDTO;

@RestController
@RequestMapping("/Android/Medicine")
public class AndroidMedicineController {

	@GetMapping(value="/mediShape",produces = "text/plain;charset=UTF-8")
	@CrossOrigin
	private String mediShape(@RequestParam String encodeSearch) {
		try{
			encodeSearch = URLEncoder.encode(encodeSearch.replace("mg","밀리그람"),"UTF-8"); 
	        }catch(Exception e){ e.printStackTrace();  }
	
		String apiUrl = "http://apis.data.go.kr/1470000/MdcinGrnIdntfcInfoService/getMdcinGrnIdntfcInfoList?" +
                "ServiceKey=Vm09Doz%2BtjX%2B4q029cKoP7ZUtqFyG%2FfICadUOVNJ701bRToKiPDGC%2B2BRMd3Epq%2Bp24rhPTlajTxis4s2T6QQQ%3D%3D" +
                "&numOfRows=10" +
                "&pageNo=1" +
                "&item_name="+encodeSearch;
		String responseBody = get(apiUrl);   
  
        
        JSONObject jsonMedi = XML.toJSONObject(responseBody);
        JSONObject selecOne = new JSONObject();
        if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")==0) {
        	return "";
        }
        else if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")>1) {
        	selecOne = (JSONObject)jsonMedi.getJSONObject("response").getJSONObject("body").getJSONArray("items").get(0);
        }
        else
        	selecOne = jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item");
        
		return selecOne.toString();
	}
	
	@GetMapping(value="/mediInfo",produces = "text/plain;charset=UTF-8")
	@CrossOrigin
	private String mediInfo(@RequestParam String encodeSearch) {
		
		try{
			encodeSearch = URLEncoder.encode(encodeSearch.replace("mg","밀리그람"),"UTF-8"); 
	        }catch(Exception e){ e.printStackTrace();  }
		
		String apiUrl = "http://apis.data.go.kr/1471057/MdcinPrductPrmisnInfoService/getMdcinPrductItem?" +
                "ServiceKey=Vm09Doz%2BtjX%2B4q029cKoP7ZUtqFyG%2FfICadUOVNJ701bRToKiPDGC%2B2BRMd3Epq%2Bp24rhPTlajTxis4s2T6QQQ%3D%3D" +
                "&numOfRows=10" +
                "&pageNo=1" +
                "&item_name="+encodeSearch;
        
        String responseBody = get(apiUrl);
      
        
        JSONObject jsonMedi = XML.toJSONObject(responseBody);
        JSONObject selecOne = new JSONObject();
        if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")==0) {
        	return "";
        }
        else if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")>1) {
        
        	selecOne = (JSONObject)jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item").get(0);
        }
        else 
        	selecOne = jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item");
        
		return selecOne.toString();
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
