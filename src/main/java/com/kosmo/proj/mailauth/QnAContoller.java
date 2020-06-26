package com.kosmo.proj.mailauth;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.proj.service.QnADTO;
import com.kosmo.proj.service.QnAService;


@Controller
@RequestMapping(value = "/Notice/")
public class QnAContoller {

	@Resource(name = "QnAService")
	private QnAService qnaService;

	//QnA
	@RequestMapping("FAQ.hst")
	public String notice(@RequestParam Map map, Model model) {

		List<QnADTO> list = qnaService.listQnA(map);
		for(QnADTO val : list)
		{
			System.out.println(val.getQna_no());
			System.out.println(val.getContent());
			System.out.println(val.getQ_date());
		}

		model.addAttribute("list",list);
		return "QnAList.tiles";
	}

	@RequestMapping("Qnainsert.hst")
	public String qnainsert(@RequestParam Map map, Model model)
	{
		int check = qnaService.insertQnA(map);
		System.out.println(check);

		return "QnAWrite.tiles";
	}


}
