package com.kosmo.proj.util;

import java.io.FileInputStream;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.AndroidConfig;
import com.google.firebase.messaging.AndroidNotification;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;

public class FcmUtil {
	public void send_FCM(String tokenId, String title, String content)
	{
		try {
			System.out.println(System.getProperty("user.dir"));
			///Project_1/src/main/webapp/file/homespitalfcm-firebase-adminsdk-gt58d-85667e5532.json
			FileInputStream refreshToken = new FileInputStream("E:\\SGW\\Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp6\\wtpwebapps\\Project_1\\file\\homespitalfcm-firebase-adminsdk-gt58d-85667e5532.json");
			
			FirebaseOptions options = new FirebaseOptions.Builder()
					.setCredentials(GoogleCredentials.fromStream(refreshToken))
					.setDatabaseUrl("https://homespitalfcm.firebaseio.com")
					.build();
			//Firebase 처음 호출시에만 initializing
			if(FirebaseApp.getApps().isEmpty())
			{
				FirebaseApp.initializeApp(options);
			}
			
			//안드로이드 토큰
			//String registrationToken = "dg_JwbyU3dg:APA91bEQn6_sF0YzLhml495282pt6bJfs2KRRysGRyFjRDiE7kbCc5A33p412_5hyD0wkHcmre6Lb1KfZi-wr1yHbtWNizovyS_BsW0ZEwkId2hYLvT5IrqjFvjatlPZ0mtd3jQ2-UBf";
			String registrationToken = tokenId;
					
			//message 작성
			Message msg = Message.builder()
					.setAndroidConfig(AndroidConfig.builder()
							.setTtl(3600 * 1000)
							.setPriority(AndroidConfig.Priority.NORMAL)
							.setNotification(AndroidNotification.builder()
									.setTitle(title)
									.setBody(content)
									.setIcon("E:\\SGW\\Workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp6\\wtpwebapps\\Project_1\\images\\logo1")
									.setColor("#f45342")
									.build())
							.build())
					.setToken(registrationToken)
					.build();
			
			//메세지를 FirebaseMessaging에 보내기
			String response = FirebaseMessaging.getInstance().send(msg);
			//결과 출력
			System.out.println("전송 성공: " + response);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
