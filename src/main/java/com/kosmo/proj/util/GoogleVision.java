package com.kosmo.proj.util;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Block;
import com.google.cloud.vision.v1.BoundingPoly;
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

import java.io.FileInputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

public class GoogleVision {

	public static void main(String... args) throws Exception {

		String fileName = "C://Users//kosmo_12//Desktop//KakaoTalk_20200616_164617420.jpg";

		List<AnnotateImageRequest> requests = new ArrayList<>();
		StringBuffer totalMedi = new StringBuffer();
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(fileName));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.DOCUMENT_TEXT_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();
			String wordText = "";
			String medi1="",medi2="",medi3="",medi4="",medi5="",medi6="",medi7="",medi8="";
			String count = "";
			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.printf("Error: %s\n", res.getError().getMessage());
					return;
				}
				TextAnnotation annotation = res.getFullTextAnnotation();
				
				for (Page page: annotation.getPagesList()) {
					String pageText = ""; 
					for (Block block : page.getBlocksList()) {
						String blockText = "";
						for (Paragraph para : block.getParagraphsList()) {
							String paraText = "";
							//System.out.println(para);
								for (Word word: para.getWordsList()) {
									int min_x = word.getBoundingBox().getVertices(0).getX();
									int max_x = word.getBoundingBox().getVertices(2).getX();
									int min_y = word.getBoundingBox().getVertices(0).getY();
									int max_y = word.getBoundingBox().getVertices(2).getY();
									
									if(min_x>=804 && max_x<=900 && min_y>=100 && max_y<=122) {
										System.out.println(word);
										for (Symbol symbol: word.getSymbolsList()) {
											wordText = wordText + symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
									}

									if(min_x>=132 && max_x<=154 && min_y>=101 && max_y<=119) {
										System.out.println(word);
										for (Symbol symbol: word.getSymbolsList()) {
											count = count + symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
									}
									if(min_x>=274 && max_x<=453 && min_y>=140 && max_y<=164) {
										for (Symbol symbol: word.getSymbolsList()) {
												medi1 = medi1 + symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
										
									}
									if(min_x>=274 && max_x<=453 && min_y>=280 && max_y<=304) {
										for (Symbol symbol: word.getSymbolsList()) {
												medi2 = medi2 + symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
										
									}
									if(min_x>=274 && max_x<=453 && min_y>=414 && max_y<=431) {
										for (Symbol symbol: word.getSymbolsList()) {
												medi3 = medi3 + symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
										
									}
									if(min_x>=274 && max_x<=453 && min_y>=554 && max_y<=574) {
										for (Symbol symbol: word.getSymbolsList()) {
												medi4 = medi4 + symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
										
									}
									if(min_x>=620 && max_x<=800 && min_y>=143 && max_y<=163) {
										for (Symbol symbol: word.getSymbolsList()) {
												medi5 = medi5 + symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
										
									}
									if(min_x>=620 && max_x<=800 && min_y>=276 && max_y<=296) {
										for (Symbol symbol: word.getSymbolsList()) {
												medi6 = medi6 + symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
										
									}
									if(min_x>=620 && max_x<=800 && min_y>=407 && max_y<=427) {
										for (Symbol symbol: word.getSymbolsList()) {
												medi7 = medi7 + symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
										
									}
									if(min_x>=620 && max_x<=800 && min_y>=547 && max_y<=567) {
										for (Symbol symbol: word.getSymbolsList()) {
												medi8 = medi8+ symbol.getText();
											//System.out.println("심볼:"+wordText);
//											System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
										}
										
									}
									
//									System.out.format("Word text: %s (confidence: %f)\n\n", wordText, word.getConfidence());
									paraText = String.format("%s %s", paraText, wordText);
								}
								System.out.println("\nParagraph: \n" + paraText);
								System.out.format("Paragraph Confidence: %f\n", para.getConfidence());
								blockText = blockText + paraText;
						}
						pageText = pageText + blockText;
					}
					System.out.println("\nComplete annotation:");
					System.out.println(annotation.getText());
					//System.out.println("심볼:"+wordText);
					totalMedi.append(medi1+",").append(medi2+",").append(medi3+",").append(medi4+",").append(medi5+",").append(medi6+",").append(medi7+",").append(medi8);
					System.out.println(totalMedi.toString());
					System.out.println(String.format("1번약:%s,2번약:%s,3번약:%s,4번약:%s,조제일:%s,카운트:%s",medi1,medi2,medi3,medi4,wordText,count));
				}
				

				// For full list of available annotations, see http://g.co/cloud/vision/docs
//				for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
//					System.out.printf("Text: %s\n", annotation.getDescription());
//					System.out.printf("Position : %s\n", annotation.getBoundingPoly());
//				}
			}
		}
	}
}