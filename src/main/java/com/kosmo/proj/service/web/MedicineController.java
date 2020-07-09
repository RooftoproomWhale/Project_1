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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;


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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kosmo.proj.service.MedicineInfoDTO;



@Controller
public class MedicineController {
	
	
	@RequestMapping("/Homespital/Management.hst")
	public String management(@RequestParam String dname,Map map) throws ParserConfigurationException, SAXException, IOException {
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
	
	@RequestMapping(value="/Calendar/Management.hst",produces = "application/text; charset=utf8")
	@ResponseBody
	public String calendarmanagement(@RequestParam String dname,Map map) throws ParserConfigurationException, SAXException, IOException {
		System.out.println(dname);
		MedicineInfoDTO info = new MedicineInfoDTO();
		String encodeSearch="";
		 ObjectMapper mapper = new ObjectMapper();
		List<MedicineInfoDTO> infos = new ArrayList<MedicineInfoDTO>();
		String[] data=dname.split(",");
		for(String data1 : data) {
				System.out.println("데이타 : "+data1);
		info = mediInfo(data1, info);
        infos.add(info);
		}
		for(MedicineInfoDTO dats : infos) {
			System.out.println("출력1: "+dats.getITEM_NAME());
			System.out.println("출력2: "+dats.getENTP_NAME());
		}
		String jsonStr = null;
		try {
			 jsonStr = mapper.writeValueAsString(infos);
		} catch (JsonProcessingException e) {e.printStackTrace();} 
        map.put("info", info);
		System.out.println(jsonStr);
		return jsonStr;
	}

	@RequestMapping("/Homespital/MedicineForm.hst")
	public String medicineForm(Map map) throws ParserConfigurationException, SAXException, IOException {
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
			encodeSearch = URLEncoder.encode(encodeSearch.replace("mg","밀리그람").replace("이알서방정", "8시간이알서방정"),"UTF-8"); 
	        }catch(Exception e){ e.printStackTrace();  }
		System.out.println(encodeSearch);
		String apiUrl = "http://apis.data.go.kr/1470000/MdcinGrnIdntfcInfoService/getMdcinGrnIdntfcInfoList?" +
                "ServiceKey=Vm09Doz%2BtjX%2B4q029cKoP7ZUtqFyG%2FfICadUOVNJ701bRToKiPDGC%2B2BRMd3Epq%2Bp24rhPTlajTxis4s2T6QQQ%3D%3D" +
                "&numOfRows=10" +
                "&pageNo=1" +
                "&item_name="+encodeSearch;
		String responseBody = get(apiUrl);   
  
        
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
      
        dto.setITEM_IMAGE(selecOne.getString("ITEM_IMAGE"));
        dto.setCHART(selecOne.getString("CHART"));
        dto.setCOLOR_CLASS1(selecOne.getString("COLOR_CLASS1"));
        dto.setDRUG_SHAPE(selecOne.getString("DRUG_SHAPE"));
        
		return dto;
	}
	
	
	private MedicineInfoDTO mediInfo(String encodeSearch,MedicineInfoDTO dto) throws ParserConfigurationException, SAXException, IOException {
		
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
        DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
        Document doc = dBuilder.parse(apiUrl);
        
        doc.getDocumentElement().normalize();
       
        String eeDoc = getTagValue("EE_DOC_DATA",doc);
        String udDoc = getTagValue("UD_DOC_DATA",doc);
        String nbDoc = getTagValue("NB_DOC_DATA",doc);
        nbDoc = nbDoc.substring(0, nbDoc.indexOf("2."));
        
        //System.out.println(responseBody);
        
        JSONObject jsonMedi = XML.toJSONObject(responseBody);
        JSONObject selecOne = new JSONObject();
        if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")==0) {
        	return new MedicineInfoDTO();
        }
        else if((long)jsonMedi.getJSONObject("response").getJSONObject("body").get("totalCount")>1) {
        	selecOne = (JSONObject)jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONArray("item").get(0);
        }
        else 
        	selecOne = jsonMedi.getJSONObject("response").getJSONObject("body").getJSONObject("items").getJSONObject("item");
        Gson gson = new Gson();
        dto = gson.fromJson(selecOne.toString(),MedicineInfoDTO.class);
        dto.setEE_DOC(eeDoc);
        dto.setUD_DOC(udDoc);
        dto.setNB_DOC(nbDoc);
        
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
	
	private static String getTagValue(String tag, Document doc) {
		NodeList nList = doc.getElementsByTagName(tag);
		String nValue = "";
		NodeList cList = nList.item(0).getChildNodes();
		NodeList ccList = cList.item(0).getChildNodes();
		for(int i=0;i<ccList.getLength();i++) {
			NodeList chList = ccList.item(i).getChildNodes();
			//System.out.println(ccList.item(0).getNodeValue());
			for(int k=0;k<chList.getLength();k++) {
				if(chList.item(k).hasAttributes()) {
					System.out.println(chList.item(k).getAttributes().getNamedItem("title").getNodeValue());
					nValue+=chList.item(k).getAttributes().getNamedItem("title").getNodeValue()+"<br/>";
				}
				NodeList cchList = chList.item(k).getChildNodes();
				//System.out.println(chList.item(k).toString());
				for(int j=0;j<cchList.getLength();j++) {
					//System.out.println(cchList.item(j).getTextContent());
					if(cchList.item(j).hasAttributes()){
						if(cchList.item(j).getAttributes().getNamedItem("tagName").getNodeValue().equalsIgnoreCase("p")) {
							//System.out.println(cchList.item(j).toString());
							nValue+="&nbsp"+cchList.item(j).getTextContent()+"<br/>";
						}
					}
				}
			}
		}
		
		return nValue;
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
           
            jsonMedi = XML.toJSONObject(result.toString());

        }catch(Exception e){
            e.printStackTrace();
        }
        return jsonMedi.toString();
    }///////serviceTest

}//////class
