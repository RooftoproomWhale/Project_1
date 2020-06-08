package com.kosmo.proj.mailauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class MailController {
	@Autowired
	private MailService service;

	@Autowired
	private MailHandler mailHandler;

	@RequestMapping(value = "/mailauth/testMail.hst")
	public String testMailPost() throws Exception{
		System.out.println("테스트 메일 컨트롤러");
		mailHandler.setSubject("테스트 메일입니다.");
		mailHandler.setText("sdfsfsdf");
		mailHandler.setFrom("united0226@gmail.com", "윤승중");
		mailHandler.setTo("tjdwns0423@naver.com");
		mailHandler.send();

		return "";

	}

	@RequestMapping(value = "/mailauth/register.hst", method = RequestMethod.POST)
    public String RegisterPost(MemberVO user,Model model,RedirectAttributes rttr) throws Exception{

        System.out.println("regesterPost 진입 ");
        service.regist(user);
        rttr.addFlashAttribute("msg" , "가입시 사용한 이메일로 인증해주세요");
        return "redirect:/";
    }

    //이메일 인증 코드 검증
    @RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
    public String emailConfirm(MemberVO user	,Model model,RedirectAttributes rttr) throws Exception {

        System.out.println("cont get user"+user);
        MemberVO vo = new MemberVO();
        vo=service.userAuth(user);
        if(vo == null) {
            rttr.addFlashAttribute("msg" , "비정상적인 접근 입니다. 다시 인증해 주세요");
            return "redirect:/";
        }
        //System.out.println("usercontroller vo =" +vo);
        model.addAttribute("login",vo);
        return "/user/emailConfirm";
    }
}
