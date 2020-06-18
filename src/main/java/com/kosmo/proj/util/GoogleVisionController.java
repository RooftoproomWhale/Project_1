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
import com.kosmo.proj.service.PrescriptionService;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Session;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
@Controller
public class GoogleVisionController {
	@Resource(name = "presService")
	private PrescriptionService service;
	
	
	@RequestMapping("/mapping/mapping.hst")
	public String vision(MultipartHttpServletRequest req,Authentication auth,Map map) throws IOException {
		MultipartFile file = req.getFile("filename");
		//fileName = "C://Users//kosmo_12//Desktop//about.jpg";
		List<AnnotateImageRequest> requests = new ArrayList<>();
		String medi1="",medi2="",medi3="",medi4="",medi5="",medi6="",medi7="",medi8="";
		String presDate = "";
		StringBuffer totalMedi = new StringBuffer();
		String duration = "";
		String hospital = "";
		String count = "";
		//new FileInputStream(fileName)
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
					return "";
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
								if(min_x>=770 && max_x<=885 && min_y>=105 && max_y<=130) {
									System.out.println(word);
									for (Symbol symbol: word.getSymbolsList()) {
										presDate = presDate + symbol.getText();
									}
								}
								/*복용횟수*/
								if(min_x>=540 && max_x<=582 && min_y>=252 && max_y<=281) {
									System.out.println(word);
									for (Symbol symbol: word.getSymbolsList()) {
										count = count + symbol.getText();
									}
								}
								/*복용기간*/
								if(min_x>=120 && max_x<=158 && min_y>=110 && max_y<=130) {
									System.out.println(word);
									for (Symbol symbol: word.getSymbolsList()) {
										duration = duration + symbol.getText();
									}
								}
								/*진료기관*/
								if(min_x>=320 && max_x<=465 && min_y>=125 && max_y<=155) {
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
								if(min_x>=240 && max_x<=440 && min_y>=275 && max_y<=300) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi2 = medi2 + symbol.getText();
									}
									
								}
								if(min_x>=240 && max_x<=440 && min_y>=405 && max_y<=430) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi3 = medi3 + symbol.getText();
									}
									
								}
								if(min_x>=240 && max_x<=440 && min_y>=535 && max_y<=560) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi4 = medi4 + symbol.getText();
									}
								}
								/*의약품명2*/
								if(min_x>=580 && max_x<=780 && min_y>=145 && max_y<=170) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi5 = medi5 + symbol.getText();
										
									}
									
								}
								if(min_x>=580 && max_x<=780 && min_y>=275 && max_y<=300) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi6 = medi6 + symbol.getText();
										
									}
									
								}
								if(min_x>=580 && max_x<=780 && min_y>=405 && max_y<=430) {
									for (Symbol symbol: word.getSymbolsList()) {
											medi7 = medi7 + symbol.getText();
									}
									
								}
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
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		Collection authorities =  userDetails.getAuthorities();
		for(Object authority:authorities) {
			System.out.println(((GrantedAuthority)authority).getAuthority());
		}
		System.out.println(userDetails.getUsername());
		String mem_email = userDetails.getUsername();
		totalMedi.append(medi1+",").append(medi2+",").append(medi3+",").append(medi4+",").append(medi5+",").append(medi6+",").append(medi7+",").append(medi8);
		map.put("medi_name", totalMedi.toString());
		map.put("mem_email", mem_email);
		Date pres_date = Date.valueOf(presDate);
		map.put("pres_date", pres_date);
		map.put("duration",duration);
		map.put("hospital",hospital);
		map.put("count",count);
		
		service.insertPre(map);
		
		return "administration.tiles";
	}
	
	
	
}