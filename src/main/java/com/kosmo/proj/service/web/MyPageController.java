package com.kosmo.proj.service.web;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.swing.JOptionPane;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.proj.GetUser;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.ReservationDTO;
import com.kosmo.proj.service.impl.CalendarServiceImpl;
import com.kosmo.proj.service.impl.MemberServiceImpl;





@Controller
public class MyPageController {
	@Resource(name="memberService")
	private MemberServiceImpl memberDAO;
	@Resource(name="CalendarService")
	private CalendarServiceImpl calendarDAO;

	// 유저 페이지
	/// 내정보
	@RequestMapping("/mypage/mypage.hst")
	public String mypage(@RequestParam Map map,Authentication auth,Model model) {
		if(auth == null) {
			JOptionPane.showMessageDialog(null,"로그인후 이용해주세요.","홈스피탈",1);
			return "member/Login.tiles";
		}
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		map.put("id", id);
		List<MemberDTO> list = memberDAO.selectList(map);
		List<Map<String, Integer>> count = memberDAO.selectCount(map);
		List<ReservationDTO> list2 = calendarDAO.selectnew(map);
		if(count.get(0).get("RESDATE")!=null) {
		SimpleDateFormat day= new SimpleDateFormat("yyyy-MM-dd");
		String newdate=day.format(count.get(0).get("RESDATE"));
		model.addAttribute("resdate",newdate);
		}
		model.addAttribute("newres",list2);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		return "Mypage_Main.my_tiles";

	}/////myapge

	// 회원탈퇴 이동
	@RequestMapping(value="/mypage/unmember.hst",method=RequestMethod.GET)
	public String unmember() {

		return "unmember.my_tiles";
	}
	//회원탈퇴
	@RequestMapping(value="/mypage/unmember.hst",method=RequestMethod.POST)
	public String unmembers(@RequestParam Map map,Authentication auth) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		map.put("id",id );
		List<MemberDTO> list = memberDAO.selectList(map);

		if(map.get("userid").equals(id) && list.get(0).getMem_pwd().equals(map.get("userPasswd"))) {
			int unmember = memberDAO.delete(map);
			JOptionPane.showMessageDialog(null,"회원 탈퇴가 완료되었습니다.","홈스피탈",1);
			}else {
			JOptionPane.showMessageDialog(null,"아이디또는 비밀번호가 일치하지 않습니다.","홈스피탈",1);
			return "unmember.my_tiles";
		}
		return "redirect:../User/Logout.hst";
	}

	// 비밀번호 변경
	@RequestMapping("/mypage/ChangePassword.hst")
	public String ChangePassword() {
		return "ChangePassword.my_tiles";
	}

	// 회원정보 수정 이동
	@RequestMapping("/mypage/ChangeMember.hst")
	public String ChangeMember(@RequestParam Map map,Authentication auth,Model model) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		map.put("id",id);
				List<MemberDTO> list = memberDAO.selectList(map);
				model.addAttribute("list",list);
		return "ChangeMember.my_tiles";
	}
	//회원 정보 수정
	@RequestMapping(value="/mypage/ChangeMember.hst",method=RequestMethod.POST)
	public String updatemember(@RequestParam Map map,Authentication auth) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		map.put("id",id );
		List<MemberDTO> list = memberDAO.selectList(map);
		if(list.get(0).getMem_pwd().equals(map.get("pass"))) {
		int update = memberDAO.update(map);
		JOptionPane.showMessageDialog(null,"회원 수정이 완료되었습니다.","홈스피탈",1);
		}else {
			JOptionPane.showMessageDialog(null,"비밀번호가 일치하지 않습니다.","홈스피탈",1);
			return "redirect:../mypage/ChangeMember.hst";
		}

		return "redirect:../mypage/mypage.hst";
	}
	// 진료예약 현황
	@RequestMapping("/mypage/ReservationList.hst")
	public String ReservationList(Authentication auth,Model model) {
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);

		return "ReservationList.my_tiles";
	}
	//예약리스트
	@RequestMapping(value ="/mypage/ReservationList.hst",method = RequestMethod.POST)
	public String ReservationLists(Authentication auth,Model model) {
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);

		return "ReservationList.my_tiles";
	}
	// 복약관리
	@RequestMapping("/mypage/administration.hst")
	public String administration(Authentication auth,Model model) {
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);

		return "administration.my_tiles";
	}

	// 내 질병관리 이동
	@RequestMapping("/mypage/Disease.hst")
	public String Disease(@RequestParam Map map,Authentication auth,Model model) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		map.put("id",id );
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);
//		List<MemberDTO> list = memberDAO.selectDiseaseList(map);
//		model.addAttribute("list", model);
		return "Disease.my_tiles";
	}

	//내 예방정보 이동
	@RequestMapping("/mypage/Prevention.hst")
	public String diseaseupdate(@RequestParam Map map,Authentication auth) {

		return "Prevention.my_tiles";
	}

	// 병원 페이지
	@RequestMapping("/Hospage/main.hst")
	public String toMain(Authentication auth,Model model) {
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);

		return "Hospage_Main.hos_tiles";
	}

	@RequestMapping("/Hospage/Update.hst")
	public String update(Authentication auth,Model model) {
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);

		return "Hospage_Update.hos_tiles";
	}

	@RequestMapping("/Hospage/Cancel.hst")
	public String cancel(Authentication auth,Model model) {
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);

		return "Hospage_Cancel.hos_tiles";
	}

	@RequestMapping("/Hospage/Appointment.hst")
	public String appointment(Authentication auth,Model model) {
		GetUser getUser = new GetUser();
		getUser.getUser(model, auth);

		return "Hospage_Appointment.hos_tiles";
	}

//	   @RequestMapping("/Hospage/Chart.hst")
//	   public String chart() {
//	      return "Hospage_Chart.hos_tiles";
//	   }

}
