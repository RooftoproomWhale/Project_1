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

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.google.gson.Gson;
import com.kosmo.proj.service.MedicineInfoDTO;

@RestController
@RequestMapping("/Android/Medicine")
public class AndroidMedicineController {

	@GetMapping(value="/mediShape",produces = "text/plain;charset=UTF-8")
	@CrossOrigin
	private String mediShape(@RequestParam String encodeSearch) {
		try{
			encodeSearch = URLEncoder.encode(encodeSearch.replace("mg","밀리그람").replace("이알서방정", "8시간이알서방정"),"UTF-8"); 
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
			encodeSearch = URLEncoder.encode(encodeSearch.replace("mg","밀리그람").replace("이알서방정", "8시간이알서방정"),"UTF-8"); 
	        }catch(Exception e){ e.printStackTrace();  }
		
		String apiUrl = "http://apis.data.go.kr/1471057/MdcinPrductPrmisnInfoService/getMdcinPrductItem?" +
                "ServiceKey=Vm09Doz%2BtjX%2B4q029cKoP7ZUtqFyG%2FfICadUOVNJ701bRToKiPDGC%2B2BRMd3Epq%2Bp24rhPTlajTxis4s2T6QQQ%3D%3D" +
                "&numOfRows=10" +
                "&pageNo=1" +
                "&item_name="+encodeSearch;
        
        String responseBody = get(apiUrl);
        
        DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder dBuilder;
        Document doc = null;
		try {
			dBuilder = dbFactory.newDocumentBuilder();
			doc = dBuilder.parse(apiUrl);
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        doc.getDocumentElement().normalize();
       
        String eeDoc = getTagValue("EE_DOC_DATA",doc);
        String udDoc = getTagValue("UD_DOC_DATA",doc);
        String nbDoc = getTagValue("NB_DOC_DATA",doc);
        
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

        selecOne.put("EE_DOC_DATA", eeDoc);
        selecOne.put("UD_DOC_DATA", udDoc);
        selecOne.put("NB_DOC_DATA", nbDoc);
        
		return selecOne.toString();
	}
	
	private static String getTagValue(String tag, Document doc) {
		NodeList nList = doc.getElementsByTagName(tag);
		String nValue = "";
		NodeList cList = nList.item(0).getChildNodes();
		NodeList ccList = cList.item(0).getChildNodes();
		for(int i=0;i<ccList.getLength();i++) {
			NodeList chList = ccList.item(i).getChildNodes();
			System.out.println(ccList.item(0).getNodeValue());
			for(int k=0;k<chList.getLength();k++) {
				NodeList cchList = chList.item(k).getChildNodes();
				for(int j=0;j<cchList.getLength();j++) {
					System.out.println(cchList.item(j).getTextContent());
					if(cchList.item(j).getTextContent()!="&nbsp;") {
						nValue+="<p>"+cchList.item(j).getTextContent()+"</p>";
					}
				}
			}
		}
		
		return nValue;
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
