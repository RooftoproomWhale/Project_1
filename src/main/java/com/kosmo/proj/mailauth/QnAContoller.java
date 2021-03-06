package com.kosmo.proj.mailauth;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.proj.service.Paging;
import com.kosmo.proj.service.QnADTO;
import com.kosmo.proj.service.QnAService;


@Controller
public class QnAContoller {

	@Resource(name = "qnaService")
	private QnAService qnaService;

	//QnA
	@RequestMapping("/QnA/QnA.hst")
	public String notice(@RequestParam Map map, Paging vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage){

		int total = qnaService.getTotalRecord(map);
		System.out.println(total);
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}

		vo = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<QnADTO> list = qnaService.listQnA(vo);
		for(QnADTO val : list)
		{
			System.out.println(val.getQna_no());
			System.out.println(val.getContent());
			System.out.println(val.getQ_date());
		}

		model.addAttribute("paging", vo);
		model.addAttribute("list",list);

		return "QnAList.tiles";
	}
	@RequestMapping("/QnA/QnAView.hst")
	public String toView(@RequestParam Map map, Model model, Authentication auth)
	{
		if(auth != null)
		{
			UserDetails userDetails = (UserDetails)auth.getPrincipal();
			String user = userDetails.getUsername();

			List<QnADTO> list = qnaService.viewQnA(map);

			int hit = qnaService.hitQnA(map);
			System.out.println(hit);

			for(QnADTO val:list)
			{
				System.out.println(val.getQna_no());
				System.out.println(val.getContent());
				System.out.println(val.getHit());
				System.out.println(list);
			}
			List<QnADTO> listA =  qnaService.selectComment(map);
			for(QnADTO val : listA)
			{
				System.out.println(val.getQna_no());
				System.out.println(val.getContent());
				System.out.println(val.getHit());
				System.out.println(listA);
			}

			model.addAttribute("list", list);
			model.addAttribute("username", user);
			model.addAttribute("listA", listA);
			System.out.println("user : " + user);
		}
		else
		{

			int hit = qnaService.hitQnA(map);
			System.out.println(hit);
			List<QnADTO> list = qnaService.viewQnA(map);
			for(QnADTO val:list)
			{
				System.out.println(val.getQna_no());
				System.out.println(val.getContent());
				System.out.println(val.getHit());

				model.addAttribute("list", list);

			}
			List<QnADTO> listA =  qnaService.selectComment(map);
			for(QnADTO val : listA)
			{
				System.out.println(val.getQna_no());
				System.out.println(val.getContent());
				System.out.println(val.getHit());
			}
			model.addAttribute("listA", listA);
		}
		return "QnAView.tiles";

	}

	@RequestMapping("/QnA/ToInsertForm.hst")
	public String toInsert(Authentication auth, Model model)
	{
		UserDetails userDetails = (UserDetails)auth.getPrincipal();
		String user = userDetails.getUsername();
		System.out.println(user);
		model.addAttribute("userId", user);
		return "QnAWrite.tiles";
	}

	@RequestMapping("/QnA/QnaInsert.hst")
	public String qnainsert(@RequestParam Map map, Model model)
	{
		System.out.println("user:"+map.get("user").toString());
		int check = qnaService.insertQnA(map);
		System.out.println(check);


		return "QnAWrite.tiles";
	}

	/*
	 * @RequestMapping("/QnA/QnAWrite.hst") public String qnaWrite(Authentication
	 * auth, Model model) { UserDetails userDetails =
	 * (UserDetails)auth.getPrincipal(); String user = userDetails.getUsername();
	 *
	 * model.addAttribute("user",user); return "QnAWrite.tiles"; }
	 */

	@RequestMapping("/QnA/QnADelete.hst")
	public String qnaDelete(@RequestParam Map map)
	{
		qnaService.deleteQnA(map);

		return "forward:/QnA/QnA.hst";
	}

	@RequestMapping("/QnA/QnAToEditForm.hst")
	public String qnaToForm(@RequestParam Map map, Model model)
	{
		Object no = map.get("no");
		Object content = map.get("content");
		Object title = map.get("title");
		Object mem_email = map.get("mem_email");
		Object q_date = map.get("q_date");

		model.addAttribute("no", no);
		model.addAttribute("content", content);
		model.addAttribute("title", title);
		model.addAttribute("mem_email", mem_email);
		model.addAttribute("q_date", q_date);

		return "QnAEdit.tiles";
	}

	@RequestMapping("/QnA/QnAEdit.hst")
	public String qnaEdit(@RequestParam Map map, Model model)
	{
		int check = qnaService.updateQnA(map);
		System.out.println(check);

		return "QnAView.tiles";
	}

}
