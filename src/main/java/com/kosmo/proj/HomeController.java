package com.kosmo.proj;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "index.tiles";
	}

	@RequestMapping("/Home/ToHomePage.hst")
	public String toHome()
	{
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

	@RequestMapping("/Covid/status.hst")
	public String covid()
	{
		return "covid.tiles";
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
//	@RequestMapping("/Admin/NoticeSubmit.hst")
//	public String noticesubmit()
//	{
//		return "NoticeDetail.tiles";
//	}
	@RequestMapping("/Homespital/NoticeSubmit.hst")
	public String noticesubmit()
	{
		return "NoticeDetail.tiles";
	}

	//test
	@RequestMapping("/Test/test.hst")
	public String test()
	{
		return "Hospage_Main.hos_tiles";
	}

//	마이바티스test
	@RequestMapping("/Member/select.hst")
	public String memberSelect(Map map, Model model)
	{
		MemberDTO dto = memberService.selectOne(map);
		System.out.println(dto);
		String name = dto.getMem_name();
		String email = dto.getMem_email();
		String pwd = dto.getMem_pwd();
		String gender = dto.getGender();
		int age = dto.getAge();
		int tel = dto.getTel();
		int height = dto.getHeight();
		int weight = dto.getWeight();
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		System.out.println("이메일: "+email + " 비밀번호:"+pwd + " 이름: "+ name + " 성별: "+ gender +" 나이: "+ age +" 번호: "+ tel +" 키: "+ height +" 몸무게: "+ weight);
		return "SignUp.tiles";
	}


}
