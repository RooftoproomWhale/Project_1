package com.kosmo.proj.hosp;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.ReservationDTO;

@Controller
public class HosController {
@Resource(name = "hosService")
private HospServiceImpl hosDAO;

//병원 페이지
	@RequestMapping("/Hospage/main.hst")
	public String toMain(@RequestParam Map map,Authentication auth,Model model) throws ParseException {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		System.out.println(id);
		map.put("id", id);
		List<HospitalDTO> list = hosDAO.selecthos(map);
		for(HospitalDTO i:list) {
			map.put("hos_code", i.getHosp_code());
		}
		System.out.println(map);
		List<MemberDTO> mem= hosDAO.selectmem(map);
		
		List<ReservationDTO> res = hosDAO.selectres(map);
		Date now= new Date();
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(now);
		cal.add(Calendar.DATE,+1);
		Date prevday = sdf.parse((sdf.format(cal.getTime())));
		Date thisday = sdf.parse((sdf.format(now)));
		int today=0;
		int yesterday=0;
		for(ReservationDTO re:res) {
			Date date=sdf.parse(re.getRES_DATE());
			
			
			if(date.compareTo(thisday)==0) {
				today++;
			}else if(date.compareTo(prevday)==0) {
				yesterday++;
			}
		}
		int totalresv=mem.size();
		model.addAttribute("today",today);
		model.addAttribute("prev",yesterday);
		model.addAttribute("total",totalresv);
		model.addAttribute("mem",mem);
		model.addAttribute("list",list);
		return "Hospage_Main.hos_tiles";
	}
	
	@RequestMapping("/Hospage/Edit.hst")
	public String Edit(@RequestParam Map map,Authentication auth,Model model) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		map.put("id", id);
		List<HospitalDTO> list = hosDAO.selecthos(map);
		for(HospitalDTO dto:list) {
			System.out.println(dto.getDept_name());
				String deptname=dto.getDept_name();
			for(int i=0;i<15;i++) {
			switch(deptname) {
			case "내과": model.addAttribute("d1",deptname); break;
			case "비뇨기과": model.addAttribute("d2",deptname);break;
			case "산부인과": model.addAttribute("d3",deptname);break;
			case "성형외과": model.addAttribute("d4",deptname);break;
			case "소아청소년과": model.addAttribute("d5",deptname);break;
			case "신경과": model.addAttribute("d6",deptname);break;
			case "안과": model.addAttribute("d7",deptname);break;
			case "이비인후과": model.addAttribute("d8",deptname);break;
			case "일반외과": model.addAttribute("d9",deptname);break;
			case "정신건강의학과": model.addAttribute("d10",deptname);break;
			case "정형외과": model.addAttribute("d11",deptname);break;
			case "치과": model.addAttribute("d12",deptname);break;
			case "피부과": model.addAttribute("d13",deptname);break;
			case "한방과": model.addAttribute("d14",deptname);break;
			case "기타": model.addAttribute("d15",deptname);break;
			default : model.addAttribute("no","no");
			}
			}
			}//for
		
		model.addAttribute("list",list);
		
		
		
		return "Hospage_Edit.hos_tiles";
	}

	@RequestMapping("/Hospage/Update.hst")
	public String update(@RequestParam Map map,Authentication auth,Model model) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		map.put("id", id);
		List<HospitalDTO> list = hosDAO.selecthos(map);
		
		Object hosp_name=map.get("hosp_name");
		Object weekday_open=map.get("weekday_open");
		Object weekday_close=map.get("weekday_close");
		Object weekend_open=map.get("weekend_open");
		Object weekend_close=map.get("weekend_close");
		Object email=map.get("email");
		Object lunchtime=map.get("lunchtime");
		Object address=map.get("address");
		Object hospwd=map.get("hospwd");
		String hosp_code = null;
		System.out.println(map);
		
		for(HospitalDTO dto:list) {
			System.out.println(dto.getHosp_code());
				hosp_code=dto.getHosp_code();
				String realpwd = dto.getMem_pwd();
				if(realpwd.trim().equals(((String)hospwd).trim())) {
					System.out.println("비번일치");
					
					break;
				}//if
				else {
					for(HospitalDTO d:list) {
						System.out.println(dto.getDept_name());
							String deptname=dto.getDept_name();
						for(int i=0;i<15;i++) {
						switch(deptname) {
						case "내과": model.addAttribute("d1",deptname); break;
						case "비뇨기과": model.addAttribute("d2",deptname);break;
						case "산부인과": model.addAttribute("d3",deptname);break;
						case "성형외과": model.addAttribute("d4",deptname);break;
						case "소아청소년과": model.addAttribute("d5",deptname);break;
						case "신경과": model.addAttribute("d6",deptname);break;
						case "안과": model.addAttribute("d7",deptname);break;
						case "이비인후과": model.addAttribute("d8",deptname);break;
						case "일반외과": model.addAttribute("d9",deptname);break;
						case "정신건강의학과": model.addAttribute("d10",deptname);break;
						case "정형외과": model.addAttribute("d11",deptname);break;
						case "치과": model.addAttribute("d12",deptname);break;
						case "피부과": model.addAttribute("d13",deptname);break;
						case "한방과": model.addAttribute("d14",deptname);break;
						case "기타": model.addAttribute("d15",deptname);break;
						default : model.addAttribute("no","no");
						}
						}
						}//for
					System.out.println("비번불일치");
					System.out.println(realpwd.trim());
					System.out.println(((String) hospwd).trim());
					model.addAttribute("list",list);
					
					return "Hospage_Edit.hos_tiles";
				}//else
		}//for
			map.put("hosp_code",hosp_code);
			map.put("hosp_name",hosp_name);
			map.put("weekday_open",weekday_open);
			map.put("weekday_close",weekday_close);
			map.put("weekend_open",weekend_open);
			map.put("weekend_close",weekend_close);
			map.put("email",email);
			map.put("lunchtime",lunchtime);
			map.put("address",address);
			int updatecount=hosDAO.updatehos(map);
			int delcount=hosDAO.deletedept(map);
			System.out.println("과 제외 나머지업데이트 성공 수, 딜리트 성공 수");
			System.out.println(updatecount);
			System.out.println(delcount);
			for(int i=1;i<=15;i++) {
				String num=Integer.toString(i);
				Object department=map.get("d"+num+"");
				if (department != null) {
				System.out.println("선택 과:");
				System.out.println(department);
				map.put("dept", department);
				System.out.println("과 업데이트 성공 수");
				int updatedept= hosDAO.updatehosdept(map);
				System.out.println(updatedept);
				}
				}
			
			list = hosDAO.selecthos(map);
			for(HospitalDTO dto:list) {
				System.out.println(dto.getDept_name());
					String deptname=dto.getDept_name();
				for(int i=0;i<15;i++) {
				switch(deptname) {
				case "내과": model.addAttribute("d1",deptname); break;
				case "비뇨기과": model.addAttribute("d2",deptname);break;
				case "산부인과": model.addAttribute("d3",deptname);break;
				case "성형외과": model.addAttribute("d4",deptname);break;
				case "소아청소년과": model.addAttribute("d5",deptname);break;
				case "신경과": model.addAttribute("d6",deptname);break;
				case "안과": model.addAttribute("d7",deptname);break;
				case "이비인후과": model.addAttribute("d8",deptname);break;
				case "일반외과": model.addAttribute("d9",deptname);break;
				case "정신건강의학과": model.addAttribute("d10",deptname);break;
				case "정형외과": model.addAttribute("d11",deptname);break;
				case "치과": model.addAttribute("d12",deptname);break;
				case "피부과": model.addAttribute("d13",deptname);break;
				case "한방과": model.addAttribute("d14",deptname);break;
				case "기타": model.addAttribute("d15",deptname);break;
				default : model.addAttribute("no","no");
				}
				}
				}//for
			model.addAttribute("list",list);
		return "Hospage_Edit.hos_tiles";
	}

	@RequestMapping("/Hospage/Appointment.hst")
	public String appointment(@RequestParam Map map,Authentication auth,Model model) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		System.out.println(id);
		map.put("id", id);
		List<HospitalDTO> list = hosDAO.selecthos(map);
		for(HospitalDTO i:list) {
			map.put("hos_code", i.getHosp_code());
		}
		List<MemberDTO> mem= hosDAO.selectmem(map);
		List<ReservationDTO> res = hosDAO.selectres(map);
		model.addAttribute("mem",mem);
		model.addAttribute("res",res);
		model.addAttribute("list",list);
		return "Hospage_Appointment.hos_tiles";
	}
	@RequestMapping("/Hospage/Approved.hst")
	public String approved(@RequestParam Map map,Authentication auth,Model model) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		System.out.println(id);
		map.put("id", id);
		List<HospitalDTO> list = hosDAO.selecthos(map);
		Object code=null;
		for(HospitalDTO i:list) {
		code = i.getHosp_code();
		map.put("hos_code", i.getHosp_code());
		}
		List<MemberDTO> mem= hosDAO.selectmem(map);
		List<ReservationDTO> res = hosDAO.selectres(map);
		for(int i=0;i<res.size();i++) {
			Object resnum = map.get("res"+Integer.toString(i));
			if(resnum !=null) {
			map.put("resnum", resnum);
			System.out.println(map);
			hosDAO.updateRes(map);
			
			}
			}
		mem=hosDAO.selectmem(map);
		res =hosDAO.selectres(map);
		model.addAttribute("mem",mem);
		model.addAttribute("res",res);
		model.addAttribute("list",list);
		return "Hospage_Appointment.hos_tiles";
	}
	@RequestMapping("/Hospage/Denied.hst")
	public String denied(@RequestParam Map map,Authentication auth,Model model) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		System.out.println(id);
		map.put("id", id);
		List<HospitalDTO> list = hosDAO.selecthos(map);
		Object code=null;
		for(HospitalDTO i:list) {
		code = i.getHosp_code();
		map.put("hos_code", i.getHosp_code());
		}
		List<MemberDTO> mem= hosDAO.selectmem(map);
		List<ReservationDTO> res = hosDAO.selectres(map);
		for(int i=0;i<res.size();i++) {
			Object resnum = map.get("res"+Integer.toString(i));
			if(resnum !=null) {
			map.put("resnum", resnum);
			System.out.println(map);
			hosDAO.deniedRes(map);
			
			}
			}
		mem=hosDAO.selectmem(map);
		res =hosDAO.selectres(map);
		model.addAttribute("mem",mem);
		model.addAttribute("res",res);
		model.addAttribute("list",list);
		return "Hospage_Appointment.hos_tiles";
	}
	@RequestMapping("/Hospage/Cancel.hst")
	public String cancel(@RequestParam Map map,Authentication auth,Model model) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		System.out.println(id);
		map.put("id", id);
		List<HospitalDTO> list = hosDAO.selecthos(map);
		model.addAttribute("list",list);
		return "Hospage_Cancel.hos_tiles";
	}
	@RequestMapping("/Hospage/CancelOK.hst")
	public String cancelapply(@RequestParam Map map,Authentication auth,Model model) {
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		String id=userDetails.getUsername();
		System.out.println(id);
		map.put("id", id);
		hosDAO.withdraw(map);
		Object pwd=map.get("userPasswd");
		List<HospitalDTO> list = hosDAO.selecthos(map);
		System.out.println("탈퇴 완료");
		
		return "redirect:/User/Logout.hst";
		
	}
}
