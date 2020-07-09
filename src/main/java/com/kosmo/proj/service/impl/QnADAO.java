package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.proj.service.IllnessDTO;
import com.kosmo.proj.service.Paging;
import com.kosmo.proj.service.QnADTO;
import com.kosmo.proj.service.QnAService;

@Repository
public class QnADAO implements QnAService {

	//SqlSessionTemplate객체 주입]
	@Resource(name="template")
	private SqlSessionTemplate sqlMapper;

	//로그인 용]
	@Override
	public boolean isLogin(Map map) {

		return (Integer)sqlMapper.selectOne("memoIsLogin",map)==0 ? false : true;
	}
	//전체 목록용]
	@Override
	public List<QnADTO> listQnA(Paging vo) {

		return sqlMapper.selectList("listQnA", vo);
	}

	@Override
	public int getTotalRecord(Map map) {

		return sqlMapper.selectOne("getTotalRecord",map);
	}
	//상세보기]
	@Override
	public List<QnADTO> detailQnA(Map map) {
		return sqlMapper.selectOne("detailQnA", map);
	}

	@Override
	public int deleteQnA(Map map) {
		/*메모 삭제-프로그래밍적으로 삭제하거나 혹은
		   부모 삭제시 자동으로 해당 자식도 삭제되도록 FK설정
		  REFERENCES 부모테이블(PK컬럼) ON  DELETE CASCADE
		*/
		//부모삭제]
		return sqlMapper.delete("deleteQnA",map);
	}
	//입력용]
	@Override
	public int insertQnA(Map map) {
		System.out.println(map.get("id"));
		System.out.println(map.get("title"));
		System.out.println(map.get("content"));
		return sqlMapper.insert("insertQnA",map);
	}
	//수정]
	@Override
	public int updateQnA(Map map) {

		return sqlMapper.update("updateQnA",map);
	}

	@Override
	public List<QnADTO> viewQnA(Map map) {

		return sqlMapper.selectList("viewQnA", map);
	}

	@Override
	public List<QnADTO> selectComment(Map map) {
		return sqlMapper.selectList("commentSelect", map);
	}
	@Override
	public int hitQnA(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.update("hitQnA", map);
	}
	@Override
	public List<IllnessDTO> listIllness(Map map) {
		// TODO Auto-generated method stub
		return sqlMapper.selectList("preventionList", map);
	}

}





