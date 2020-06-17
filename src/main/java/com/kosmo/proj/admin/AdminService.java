package com.kosmo.proj.admin;

import java.util.List;
import java.util.Map;

import com.kosmo.proj.service.MemberDTO;

public interface AdminService {
	
		//로그인 용]
		boolean isLogin(Map map);
		//목록용]
		List<MemberDTO> selectList(Map map);
		//전체 레코드 수]
		int getTotalRecord(Map map);
		//회원 상세보기용]
		MemberDTO selectOne(Map map);
		//회원 삭제
		int delete(Map map);
		//회원 수정
		int update(Map map);
}
