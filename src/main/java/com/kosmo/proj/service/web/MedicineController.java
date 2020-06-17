package com.kosmo.proj.service.web;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.ibatis.javassist.expr.NewExpr;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kosmo.proj.service.MedicineInfoDTO;



@Controller
public class MedicineController {
	
	
	@RequestMapping("/Homespital/Management.hst")
	public String management(@RequestParam String dname,Map map) {
		System.out.println(dname);
		MedicineInfoDTO info = new MedicineInfoDTO();
		String encodeSearch="";
		
		info = mediInfo(dname, info);
        info = mediShape(dname, info);
          
        System.out.println(info.getITEM_NAME());
        System.out.println(info.getENTP_NAME());
        map.put("info", info);
		
		return "MedicinManage.tiles";
	}
	
	@RequestMapping("/Homespital/MedicineForm.hst")
	public String medicineForm(Map map) {
		JSONObject jsonMedi = null;
		MedicineInfoDTO dto = new MedicineInfoDTO();
		String[] medi1 = {"어린이용타이레놀정80mg","타이레놀정160mg","타이레놀정500mg","어린이타이레놀현탁액","어린이부루펜시럽"};
		String[] medi2 = {"판콜에이내복액","판피린티정"};
		String[] medi3 = {"베아제정","닥터베아제정","훼스탈골드정","훼스탈플러스정"};
		String[] medi4 = {"신신파스아렉스","제일쿨파프"};
		map.put("medi1",medi1 );
		map.put("medi2",medi2 );
		map.put("medi3",medi3 );
		map.put("medi4",medi4 );
		for(String medi:medi1) {
			mediInfo(medi, dto);
		}
		
		return "/drug/Drug.tiles";
	}
	
	@RequestMapping("/Homespital/Upload.hst")
	public String upload() {
		return "Upload.my_tiles";
	}
	
	
	private MedicineInfoDTO mediShape(String encodeSearch,MedicineInfoDTO dto) {
		try{
			encodeSearch = URLEncoder.encode(encodeSearch.replace("mg","밀리그람"),"UTF-8"); 
	        }catch(Exception e){ e.printStackTrace();  }
	
		String apiUrl = "http://apis.data.go.kr/1470000/MdcinGrnIdntfcInfoService/getMdcinGrnIdntfcInfoList?" +
                "ServiceKey=Vm09Doz%2BtjX%2B4q029cKoP7ZUtqFyG%2FfICadUOVNJ701bRToKiPDGC%2B2BRMd3Epq%2Bp24rhPTlajTxis4s2T6QQQ%3D%3D" +
                "&numOfRows=10" +
                "&pageNo=1" +
                "&item_name="+encodeSearch;
		String responseBody = get(apiUrl);   
        System.out.println(responseBody);
        
        JSONObject jsonMedi = XML.toJSONObject(responseBody);
        JSONObject selecOne = new JSONObject();
        if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")==0) {
        	return new MedicineInfoDTO();
        }
        else if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")>1) {
        	selecOne = (JSONObject)jsonMedi.getJSONObject("response").getJSONObject("body").getJSONArray("items").get(0);
        }
        else
        	selecOne = jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item");
        System.out.println(selecOne.get("ITEM_IMAGE"));
        dto.setITEM_IMAGE(selecOne.getString("ITEM_IMAGE"));
        dto.setCHART(selecOne.getString("CHART"));
        dto.setCOLOR_CLASS1(selecOne.getString("COLOR_CLASS1"));
        dto.setDRUG_SHAPE(selecOne.getString("DRUG_SHAPE"));
        
		return dto;
	}
	
	
	private MedicineInfoDTO mediInfo(String encodeSearch,MedicineInfoDTO dto) {
		
		try{
			encodeSearch = URLEncoder.encode(encodeSearch.replace("mg","밀리그람"),"UTF-8"); 
	        }catch(Exception e){ e.printStackTrace();  }
		
		String apiUrl = "http://apis.data.go.kr/1471057/MdcinPrductPrmisnInfoService/getMdcinPrductItem?" +
                "ServiceKey=Vm09Doz%2BtjX%2B4q029cKoP7ZUtqFyG%2FfICadUOVNJ701bRToKiPDGC%2B2BRMd3Epq%2Bp24rhPTlajTxis4s2T6QQQ%3D%3D" +
                "&numOfRows=10" +
                "&pageNo=1" +
                "&item_name="+encodeSearch;
        
        String responseBody = get(apiUrl);
      
        System.out.println(responseBody);
        
        JSONObject jsonMedi = XML.toJSONObject(responseBody);
        JSONObject selecOne = new JSONObject();
        if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")==0) {
        	return new MedicineInfoDTO();
        }
        else if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")>1) {
        	System.out.println((JSONObject)jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item").get(0));
        	selecOne = (JSONObject)jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item").get(0);
        }
        else 
        	selecOne = jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item");
        Gson gson = new Gson();
        dto = gson.fromJson(selecOne.toString(),MedicineInfoDTO.class);
        
		return dto;
	}
		
	private static String get(String apiUrl) {
        HttpURLConnection con = connect(apiUrl);

        try {
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // �젙�긽 �쓳�떟
                return readBody(con.getInputStream());
            } else {  // �뿉�윭 �쓳�떟
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API �슂泥�怨� �쓳�떟 �떎�뙣", e);
        } finally {
            con.disconnect(); // Connection�쓣 �옱�솢�슜�븷 �븘�슂媛� �뾾�뒗 �봽濡쒖꽭�뒪�씪 寃쎌슦
        }
    }
	
	private static HttpURLConnection connect(String apiUrl) {
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection) url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL�씠 �옒紐삳릺�뿀�뒿�땲�떎. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("�뿰寃곗씠 �떎�뙣�뻽�뒿�땲�떎. : " + apiUrl, e);
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
            throw new RuntimeException("API �쓳�떟�쓣 �씫�뒗�뜲 �떎�뙣�뻽�뒿�땲�떎.", e);
        }
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
