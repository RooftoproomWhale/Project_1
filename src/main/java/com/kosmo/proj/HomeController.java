package com.kosmo.proj;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.util.Collection;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Resource(name = "memberService")
	private MemberService memberService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 * @throws UnknownHostException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Authentication auth) throws UnknownHostException 
	{
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);
		
		return "index.tiles";
	}

	@RequestMapping("/Home/ToHomePage.hst")
	public String toHome(Authentication auth, Model model)
	{
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);
		
		return "index.tiles";
	}
	
	
	@RequestMapping(value = "/News",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String news(@RequestParam Map map)
	{
		String clientId = map.get("clientId").toString(); // 애플리케이션 클라이언트 아이디
        String clientSecret = map.get("clientSecret").toString();  // 애플리케이션 클라이언트 시크릿

        String text = "";
        try
        {
        	text = URLEncoder.encode("코로나 속보", "utf-8");
		}
        catch (UnsupportedEncodingException e)
        {
			e.printStackTrace();
		}
//        String apiUrl = "https://openapi.naver.com/v1/search/news.json?query="+ text;

        String apiUrl = "https://openapi.naver.com/v1/search/news.json?query="+ text + "&display=10";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);

        String responseBody = get(apiUrl, requestHeaders);
        System.out.println(responseBody);

		return responseBody;
	}
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
        HttpURLConnection con = connect(apiUrl);

        try {
            con.setRequestMethod("GET");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

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

	@RequestMapping("/Homespital/Health_info.hst")
	public String health()
	{
		return "health_info/Health_info.tiles";
	}
	@RequestMapping("/Homespital/Health_detail.hst")
	public String healthDetail()
	{
		return "health_info/Health_detail.tiles";
	}
	
	@RequestMapping("/Android/WebTest.hst")
	public String andWeb()
	{
		return "AndroidChat";
	}
}
