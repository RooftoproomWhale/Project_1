package com.kosmo.proj.service.web;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kosmo.proj.service.MedicineDTO;


@Controller
public class MedicineController {
	
	
	@RequestMapping("/Homespital/Management.hst")
	public String management() {
		return "MedicinManage.tiles";
	}
	
	
	
	@RequestMapping("/Homespital/MedicineForm.hst")
	public String medicineForm(Map map) {
		JSONObject jsonMedi = null;
		String[] medi1 = {"어린이용타이레놀정80mg","타이레놀정160mg","타이레놀정500mg","어린이타이레놀현탁액","어린이부루펜시럽"};
		String[] medi2 = {"판콜에이내복액","판피린티정"};
		String[] medi3 = {"베아제정","닥터베아제정","훼스탈골드정","훼스탈플러스정"};
		String[] medi4 = {"신신파스아렉스","제일쿨파프"};
		map.put("medi1",medi1);
		map.put("medi2",medi2);
		map.put("medi3",medi3);
		map.put("medi4",medi4);
		
		try{
			for(String medi:medi1) {
			String encodeSearch = URLEncoder.encode(medi.replace("mg","밀리그람"),"UTF-8"); 
	        StringBuffer result = new StringBuffer();
	            String urlstr = "http://apis.data.go.kr/1471057/MdcinPrductPrmisnInfoService/getMdcinPrductItem?" +
	                    "ServiceKey=Vm09Doz%2BtjX%2B4q029cKoP7ZUtqFyG%2FfICadUOVNJ701bRToKiPDGC%2B2BRMd3Epq%2Bp24rhPTlajTxis4s2T6QQQ%3D%3D" +
	                    "&numOfRows=10" +
	                    "&pageNo=1" +
	                    "&item_name="+encodeSearch;
	            
	            URL url = new URL(urlstr);
	            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
	            urlconnection.setRequestMethod("GET");
	            BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
	            String returnLine;
	            while((returnLine = br.readLine()) != null) {
	                result.append(returnLine+"\r");
	            }
	            urlconnection.disconnect();
	            jsonMedi = XML.toJSONObject(result.toString());
	            JSONObject item = jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items");
	            System.out.println(item);
	           
			}
	        }catch(Exception e){
	            e.printStackTrace();
	        }
		
		return "MedicineList.tiles";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/Homespital/Medicine.hst",produces = "text/html; charset=UTF-8")
    public String medicineInfo(@RequestParam String search){
		 JSONObject jsonMedi = null;
		try{
		String encodeSearch = URLEncoder.encode(search,"UTF-8"); 
        StringBuffer result = new StringBuffer();
            String urlstr = "http://apis.data.go.kr/1471057/MdcinPrductPrmisnInfoService/getMdcinPrductItem?" +
                    "ServiceKey=Vm09Doz%2BtjX%2B4q029cKoP7ZUtqFyG%2FfICadUOVNJ701bRToKiPDGC%2B2BRMd3Epq%2Bp24rhPTlajTxis4s2T6QQQ%3D%3D" +
                    "&numOfRows=10" +
                    "&pageNo=1" +
                    "&item_name="+encodeSearch;
            
            URL url = new URL(urlstr);
            HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
            urlconnection.setRequestMethod("GET");
            BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"UTF-8"));
            String returnLine;
            while((returnLine = br.readLine()) != null) {
                result.append(returnLine+"\r");
            }
            urlconnection.disconnect();
            System.out.println(result);
            jsonMedi = XML.toJSONObject(result.toString());
            System.out.println(jsonMedi);
        }catch(Exception e){
            e.printStackTrace();
        }
        return jsonMedi.toString();
    }///////serviceTest

}//////class
