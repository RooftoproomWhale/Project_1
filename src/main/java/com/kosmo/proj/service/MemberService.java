package com.kosmo.proj.service;

import java.util.List;
import java.util.Map;

import com.kosmo.proj.service.MemberDTO;

public interface MemberService {
		
		//로그인 용]
		boolean isLogin(Map map);
		public MemberDTO isLogin(MemberDTO member);
		//목록용]
		List<MemberDTO> selectList(Map map);
		
		//전체 레코드 수]
		int getTotalRecord(Map map);
		//회원 상세보기용]
		MemberDTO selectOne(Map map);
		//입력/수정/삭제용]
		int delete(Map map);
		int insert(Map map);
		int update(Map map);

}
