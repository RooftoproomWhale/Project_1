package com.kosmo.proj.util;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Block;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.Page;
import com.google.cloud.vision.v1.Paragraph;
import com.google.cloud.vision.v1.Symbol;
import com.google.cloud.vision.v1.TextAnnotation;
import com.google.cloud.vision.v1.Vertex;
import com.google.cloud.vision.v1.Word;
import com.google.protobuf.ByteString;
import com.kosmo.proj.GetUser;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.PrescriptionDTO;
import com.kosmo.proj.service.PrescriptionService;
import com.kosmo.proj.service.impl.MemberServiceImpl;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.mail.Session;

import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
@Controller
public class GoogleVisionController {
	@Resource(name="memberService")
	private MemberServiceImpl memberDAO;
	@Resource(name = "presService")
	private PrescriptionService service;
	
	@ResponseBody
	@RequestMapping(value="/mapping/mappingList.hst",produces = "text/html; charset=UTF-8")
	public String list(Authentication auth,Map map) {
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String mem_email = userDetails.getUsername();
		System.out.println(mem_email);
		map.put("mem_email", mem_email);
		//서비스 호출]
		List<Map> list=service.selectPre(map);
		for(Map comment:list) {
			comment.put("PRES_DATE",comment.get("PRES_DATE").toString().substring(0, 10));
		}
		System.out.println(list);
		System.out.println(JSONArray.toJSONString(list));
		
		return JSONArray.toJSONString(list);
	}

	@ResponseBody
	@RequestMapping(value="/alarm.hst",produces = "text/html; charset=UTF-8")
	public void alarm(@RequestParam Map params,Map map) {
		System.out.println(params.get("preno"));
		map.put("preno", params.get("preno"));
		service.alarmDelete(map);
		map.put("alarm", params.get("timepickerM").toString().replace(" : ",""));
		service.alarmInsert(map);
		map.put("alarm", params.get("timepickerA").toString().replace(" : ",""));
		service.alarmInsert(map);
		map.put("alarm", params.get("timepickerE").toString().replace(" : ",""));
		service.alarmInsert(map);
	}
	
	@ResponseBody
	@RequestMapping(value="/alarmSelec.hst",produces = "text/html; charset=UTF-8")
	public String alarm(@RequestParam String preno,Map map) {
		System.out.println(preno);
		List<Map> list = service.alarmSelect(preno);
		String alarm = list.get(0).get("ALARM").toString().substring(0,2)+" : "+list.get(0).get("ALARM").toString().substring(2,4);
		list.get(0).put("ALARM",alarm);
		alarm = list.get(1).get("ALARM").toString().substring(0,2)+" : "+list.get(1).get("ALARM").toString().substring(2,4);
		list.get(1).put("ALARM",alarm);
		alarm = list.get(2).get("ALARM").toString().substring(0,2)+" : "+list.get(2).get("ALARM").toString().substring(2,4);
		list.get(2).put("ALARM",alarm);
		return JSONArray.toJSONString(list);
	}
	

	@RequestMapping("/mapping/mapping.hst")
	public String vision(MultipartHttpServletRequest req,Authentication auth,Map map, Model model) throws IOException {
		//MultipartFile로 직접 받기MultipartHttpServletRequest req
		MultipartFile file = req.getFile("filename");

		map = visionAPI(file, map, auth, model);
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String mem_email = userDetails.getUsername();
		//String totalMedi = String.format("%s,%s,%s,%s,%s,%s,%s,%s", medi1,medi2,medi3,medi4,medi5,medi6,medi7,medi8);
		//medi_name.append(totalMedi);
		map.put("mem_email", mem_email);
		
		service.insertPre(map);
		
		return "administration.my_tiles";
	}
	
	public Map visionAPI(MultipartFile file,Map map, Authentication auth, Model model) throws IOException {
		
		/*각 의약품명*/
		String medi1="",medi2="",medi3="",medi4="",medi5="",medi6="",medi7="",medi8="";
		/*전체 의약품명*/
		String medi_name="";
		/*처방날짜*/
		String presDate = "";
		/*복용일수*/
		String duration = "";
		/*처방병원*/
		String hospital = "";
		/*일일 복용 횟수*/
		String count = "";
		
		int remainingCount = 0;
		//new FileInputStream(fileName)
		
		BufferedImage bi = ImageIO.read(file.getInputStream());
		int height = bi.getHeight();
		int width = bi.getWidth();
		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(file.getInputStream());
		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.DOCUMENT_TEXT_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();
			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.printf("Error: %s\n", res.getError().getMessage());
					return null;
				}
				TextAnnotation annotation = res.getFullTextAnnotation();
				for (Page page: annotation.getPagesList()) {
					String pageText = ""; 
					for (Block block : page.getBlocksList()) {
						String blockText = "";
						for (Paragraph para : block.getParagraphsList()) {
							for (Word word: para.getWordsList()) {
								int min_x = word.getBoundingBox().getVertices(0).getX();
								int max_x = word.getBoundingBox().getVertices(2).getX();
								int min_y = word.getBoundingBox().getVertices(0).getY();
								int max_y = word.getBoundingBox().getVertices(2).getY();
								/*약 제조일 */
								if(min_x>=(width*0.8) && max_x<=(width*0.92) && min_y>=(height*0.145) && max_y<=(height*0.18)) {
									System.out.println(word);
									for (Symbol symbol: word.getSymbolsList()) {
										presDate = presDate + symbol.getText();
									}
								}
								/*복용기간*/
								if(min_x>=(width*0.125) && max_x<=(width*0.165) && min_y>=(height*0.152) && max_y<=(height*0.18)) {
									System.out.println(word);
									for (Symbol symbol: word.getSymbolsList()) {
										duration = duration + symbol.getText();
									}
								}
								/*복용횟수*/
								if(min_x>=(width*0.56) && max_x<=(width*0.6) && min_y>=(height*0.35) && max_y<=(height*0.39)) {
									System.out.println(word);
									for (Symbol symbol: word.getSymbolsList()) {
										count = count + symbol.getText();
										remainingCount = Integer.parseInt(count) * Integer.parseInt(duration);
									}
								}
								/*진료기관*/
								if(min_x>=(width*0.33) && max_x<=(width*0.48) && min_y>=(height*0.173) && max_y<=(height*0.215)) {
									System.out.println(word);
									for (Symbol symbol: word.getSymbolsList()) {
										hospital = hospital + symbol.getText();
									}
								}
								/*의약품명1*/
								if(min_x>=240 && max_x<=440 && min_y>=145 && max_y<=170) {
									for (Symbol symbol: word.getSymbolsList()) {
										medi1 = medi1 + symbol.getText();
									}
								}
								/*의약품명3*/
								if(min_x>=240 && max_x<=440 && min_y>=275 && max_y<=300) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi3 = medi3 + symbol.getText();
									}
								}
								/*의약품명5*/
								if(min_x>=240 && max_x<=440 && min_y>=405 && max_y<=430) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi5 = medi5 + symbol.getText();
									}
								}
								/*의약품명7*/
								if(min_x>=240 && max_x<=440 && min_y>=535 && max_y<=560) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi7 = medi7 + symbol.getText();
									}
								}
								/*의약품명2*/
								if(min_x>=580 && max_x<=780 && min_y>=145 && max_y<=170) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi2 = medi2 + symbol.getText();
									}
								}
								/*의약품명4*/
								if(min_x>=580 && max_x<=780 && min_y>=275 && max_y<=300) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi4 = medi4 + symbol.getText();
										
									}
								}
								/*의약품명6*/
								if(min_x>=580 && max_x<=780 && min_y>=405 && max_y<=430) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi6 = medi6 + symbol.getText();
									}
								}
								/*의약품명8*/
								if(min_x>=580 && max_x<=780 && min_y>=535 && max_y<=560) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi8 = medi8+ symbol.getText();
									}
								}
							}
						}
					}
				}
			}
		}
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);
		
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String userEmail = userDetails.getUsername();
		System.out.println("email: " + userEmail);
		map.put("userEmail", userEmail);
		map.put("id", userEmail);
		String mem_email = userDetails.getUsername();
		String mem_name = mem_name(mem_email);
		String totalMedi = String.format("%s,%s,%s,%s,%s,%s,%s,%s", medi1,medi2,medi3,medi4,medi5,medi6,medi7,medi8);
//		medi_name.append(totalMedi);
		map.put("medi_name", medi_name.toString());
		map.put("mem_email", mem_email);
		map.put("mem_name", mem_name);
		if(medi1!="") {
			medi_name+=medi1;
		}
		if(medi2!="") {
			medi_name+=","+medi2;
		}
		if(medi3!="") {
			medi_name+=","+medi3;
		}
		if(medi4!="") {
			medi_name+=","+medi4;
		}
		if(medi5!="") {
			medi_name+=","+medi5;
		}
		if(medi6!="") {
			medi_name+=","+medi6;
		}
		if(medi7!="") {
			medi_name+=","+medi7;
		}
		if(medi8!="") {
			medi_name+=","+medi8;
		}
		map.put("medi_name", medi_name);
		Date pres_date = Date.valueOf(presDate);
		map.put("pres_date", pres_date);
		map.put("duration",duration);
		map.put("hos_name",hospital);
		map.put("count", remainingCount);
		
		return map;
	}


	private String mem_name(String mem_email) {
		Map<String, String> map =new HashMap<String, String>();
		map.put("id", mem_email);
		List<MemberDTO> list = memberDAO.selectList(map);
	
		return list.get(0).getMem_name();
	}
	
	
	
}