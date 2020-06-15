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
import com.google.cloud.vision.v1.Word;
import com.google.protobuf.ByteString;

import java.io.FileInputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class GoogleVision {
	public static void main(String... args) throws Exception {

		String fileName = "C://Users//kosmo_27//Desktop//KakaoTalk_20200609_183840004.jpg";

		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(fileName));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

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
							for (Word word: para.getWordsList()) {
								String wordText = "";
								for (Symbol symbol: word.getSymbolsList()) {
									wordText = wordText + symbol.getText();
//									System.out.format("Symbol text: %s (confidence: %f)\n", symbol.getText(),symbol.getConfidence());
								}
//								System.out.format("Word text: %s (confidence: %f)\n\n", wordText, word.getConfidence());
								paraText = String.format("%s %s", paraText, wordText);
							}
							System.out.println("\nParagraph: \n" + paraText);
							System.out.println(paraText.contains("윤승중"));
							System.out.println(paraText.contains("조제 일자"));
							System.out.println(paraText.contains("복용 완료일"));
							System.out.println(paraText.contains("윤승중"));
							
							System.out.format("Paragraph Confidence: %f\n", para.getConfidence());
							blockText = blockText + paraText;
						}
						pageText = pageText + blockText;
					}
					System.out.println("\nComplete annotation:");
					System.out.println(annotation.getText());

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