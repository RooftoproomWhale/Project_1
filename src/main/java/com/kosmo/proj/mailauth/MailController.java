package com.kosmo.proj.mailauth;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/mailauth")
public class MailController {
   @Autowired
   private MailService service;

   @Autowired
   private MailHandler mailHandler;

   @ResponseBody
   @RequestMapping(value = "/testMail.hst", method = RequestMethod.GET)
   public String testMailPost(@RequestParam Map map) throws Exception{
      System.out.println("테스트 메일 컨트롤러");
      Random key = new Random();
      int authCode = key.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
      Object userEmail = map.get("userEmail");
      System.out.println(userEmail.toString());

      mailHandler.setSubject("홈스피탈 인증번호입니다.");
      mailHandler.setText("인증번호를 입력해주세요 인증번호: " + Integer.toString(authCode));
      mailHandler.setFrom("united0226@gmail.com", "홈스피탈");
      mailHandler.setTo(userEmail.toString());
      mailHandler.send();

      ObjectMapper mapper = new ObjectMapper();
      String jsonStr = null;
      try {
         jsonStr = mapper.writeValueAsString(authCode);
      } catch (JsonProcessingException e) {
         e.printStackTrace();
      }

      System.out.println(jsonStr);
      return jsonStr.toString();

   }

//   @RequestMapping(value = "/register", method = RequestMethod.POST)
//    public String RegisterPost(MemberVO user,Model model,RedirectAttributes rttr) throws Exception{
//
//        System.out.println("regesterPost 진입 ");
//        service.regist(user);
//        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
//        return "redirect:/";
//    }
//
//    //이메일 인증 코드 검증
//    @RequestMapping("/emailConfirm")
//    public String emailConfirm(@RequestParam Map map, Model model,RedirectAttributes rttr) throws Exception {
//          System.out.println("code:"+map.get("code"));
//          System.out.println("text:"+map.get("text"));
//
//        MemberVO vo = new MemberVO();
//
//        if(vo == null) {
//            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
//            return "redirect:/";
//        }
//        //System.out.println("usercontroller vo =" +vo);
//        model.addAttribute("login",vo);
//        return "/user/emailConfirm";
//    }
}