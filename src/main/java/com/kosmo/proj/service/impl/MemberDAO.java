package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.MemberService;

@Repository
public class MemberDAO implements MemberService {

	//SqlSessionTemplate객체 주입]
		@Resource(name="template")
		private SqlSessionTemplate sqlMapper;

		@Override
		public boolean isLogin(Map map) {
			// TODO Auto-generated method stub
			return (Integer)sqlMapper.selectOne("memberIsLogin",map)==0 ? false : true;
		}

		@Override
		public MemberDTO isLogin(MemberDTO member) {
			// TODO Auto-generated method stub
			return sqlMapper.selectOne("memberIsLoginJson",member);
		}


		@Override
		public List<MemberDTO> selectList(Map map) {
			// TODO Auto-generated method stub
			return sqlMapper.selectList("signView", map);
		}

		@Override
		public int getTotalRecord(Map map) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public MemberDTO selectOne(Map map) {
			// TODO Auto-generated method stub
			return sqlMapper.selectOne("selectOne",map);
		}

		@Override
		public int delete(Map map) {
			return sqlMapper.delete("signDelete", map);
		}

		@Override
		public int insert(Map map) {
			return sqlMapper.insert("signInsert", map);
		}

		@Override
		public int update(Map map) {
			return sqlMapper.update("signUpdate", map);
		}

		public int diseaseupdate(Map map) {
			
			return sqlMapper.update("diseaseupdate",map);
		}

		public List<MemberDTO> diseaseSelect(Map map) {
	
			return sqlMapper.selectList("diseaseupdate",map);
		}
		public List<Map<String, Integer>> selectCount(Map map) {
			
			return sqlMapper.selectList("selectCount", map);
		}

}
