package com.kosmo.proj.service.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.proj.service.MemoCommentService;

//@SessionAttributes({"id"}) //씨큐리티 사용시 주석
@Controller
public class MemoCommentController {
	//서비스 주입]
	@Resource(name="commentService")
	private MemoCommentService commentService;
	//코멘트 입력처리]
	@RequestMapping(value="/QnA/InsertAnswer.hst",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String write(
			@RequestParam Map map,
			//@ModelAttribute("id") String id//씨큐리티 사용시 주석
			Authentication auth
			) {
		//서비스 호출]
		//한줄 댓글 작성자의 아이디 맵에 설정
		String id= ((UserDetails)auth.getPrincipal()).getUsername();//씨큐리티 적용시
		map.put("id",id);
		int number = commentService.insert(map);
		System.out.println(number);

		//원본글의 번호 반환
		return "insert";
	}////////

	//특정 글번호에 대한 코멘트 목록 가져오기
//	@ResponseBody
//	@RequestMapping(value="/QnA/QnAList.hst",produces = "text/html; charset=UTF-8")
//	public String list(@RequestParam Map map) {
//		//서비스 호출]
//		/*
//		 * [
//		 * {"NO":3,"CPOSTDATE":2019-09-26 15:20:42.0,
//		 * "CNO":3,"LINECOMMENT":"첫번째 탯글입니다","ID":"LEE","NAME":"이길동"
//		 * }]
//		 *
//		 */
//		//날짜 값을 문자열로 변경해야한다 그렇지 않으면 JSON형식에 맞지 않는다
//		//날짜를 2018-09-12 10:15:38.0에서 "2018-09-12"형태로 변경
//		for(Map comment:list)
//			comment.put("CPOSTDATE",comment.get("CPOSTDATE").toString().substring(0, 10));
//		//단,List에 저장된 객체는 반드시 Map이어야 한다
//		return JSONArray.toJSONString(list);
//	}

	//코멘트 수정처리]
	@RequestMapping(value="/QnA/comEdit.hst",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String update(@RequestParam Map map) {
		//서비스 호출]
		int check = commentService.update(map);
		System.out.println(map.get("answer"));
		System.out.println(check);
		//원본글:댓글 번호 반환
		return "edit";
	}

	//코멘트 삭제처리]
	@RequestMapping(value="/QnA/Delete.hst",produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String delete(@RequestParam Map map) {
		//서비스 호출]
		commentService.delete(map);
		//삭제 댓글 번호 반환
		return String.format("%s",map.get("cno").toString());
	}

}
