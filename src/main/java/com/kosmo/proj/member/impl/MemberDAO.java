package com.kosmo.proj.member.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.kosmo.proj.member.MemberDTO;
import com.kosmo.proj.member.MemberService;

@Repository
public class MemberDAO implements MemberService {
	
	//SqlSessionTemplate객체 주입]
		@Resource(name="template")
		private SqlSessionTemplate sqlMapper;

		@Override
		public boolean isLogin(Map map) {
			// TODO Auto-generated method stub
			return false;
		}

		@Override
		public List<MemberDTO> selectList(Map map) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public int getTotalRecord(Map map) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public MemberDTO selectOne(Map map) {
			// TODO Auto-generated method stub
			return sqlMapper.selectOne("memberSelectOne");
		}

		@Override
		public int delete(Map map) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public int insert(Map map) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public int update(Map map) {
			// TODO Auto-generated method stub
			return 0;
		}

		

}
