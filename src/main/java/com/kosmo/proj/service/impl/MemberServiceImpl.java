package com.kosmo.proj.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.proj.service.HistoryDTO;
import com.kosmo.proj.service.HospitalDTO;
import com.kosmo.proj.service.MemberDTO;
import com.kosmo.proj.service.MemberService;
import com.kosmo.proj.service.PrescriptionDTO;
import com.kosmo.proj.service.ReservationDTO;
import com.kosmo.proj.util.CustomUserDetails;

@Service("memberService")
public class MemberServiceImpl implements MemberService{

   @Resource(name="memberDAO")
   private MemberDAO dao;

   @Override
   public boolean isLogin(Map map) {
      return dao.isLogin(map);
   }

   @Override
   public MemberDTO isLogin(MemberDTO member) {
      return dao.isLogin(member);
   }

   @Override
   public List<MemberDTO> selectList(Map map) {
      return dao.selectList(map);
   }

   @Override
   public int getTotalRecord(Map map) {
      return dao.getTotalRecord(map);
   }

   @Override
   public MemberDTO selectOne(Map map) {
      return dao.selectOne(map);
   }

   @Override
   public int delete(Map map) {
      return dao.delete(map);
   }

   @Override
   public int insert(Map map) {
      return dao.insert(map);
   }

   @Override
   public int update(Map map) {
      return dao.update(map);
   }

   public int diseaseupdate(Map map) {
      // TODO Auto-generated method stub
      return dao.diseaseupdate(map);
   }

   public List<MemberDTO> selectDiseaseList(Map map) {

      return dao.diseaseSelect(map);
   }

   public List<Map<String, Integer>> selectCount(Map map) {

      return dao.selectCount(map);
   }

   @Override
   public List<HospitalDTO> selectHosSearch(Map map) {
      // TODO Auto-generated method stub
      return dao.selectHosSearch(map);
   }
   @Override
   public CustomUserDetails getUserById(String username) {
      return dao.getUserById(username);
   }

   @Override
   public List<HospitalDTO> selectedHosp(Map map) {
      // TODO Auto-generated method stub
      return dao.selectedHosp(map);
   }

   @Override
   public int hosAuthSub(Map map) {
      // TODO Auto-generated method stub
      return dao.hosAuthSub(map);
   }

	@Override
	public int hosIdUpdate(Map map) {
	   // TODO Auto-generated method stub
	   return dao.hosIdUpdate(map);
	}

	@Override
	public HistoryDTO getNo(Map map) {
	   // TODO Auto-generated method stub
	   return dao.getNo(map);
	}

	@Override
	public int hisInsert(Map map) {
	   // TODO Auto-generated method stub
	   return dao.hisInsert(map);
	}

	@Override
	public int illInsert(Map map) {
	   // TODO Auto-generated method stub
	   return dao.illInsert(map);
	}


	public List<Map<String, String>> selectill(Map map) {

		return dao.selectill(map);
	}

	public int ILLdelete(Map map) {

		return dao.illdelete(map);
	}


	@Override
	public ReservationDTO recentApt(Map map) {
		// TODO Auto-generated method stub
		return dao.recentApt(map);
	}

	@Override
	public PrescriptionDTO recentPres(Map map) {
		// TODO Auto-generated method stub
		return dao.recentPres(map);
	}

	@Override
	public List<PrescriptionDTO> getPreMedi(Map map) {
		// TODO Auto-generated method stub
		return dao.getPreMedi(map);
	}

	public List<Map<String, String>> selectdept(Map map) {
		
		return dao.getDeptone(map);
	}

	@Override
	public int usingIncrease(Map map) {
		// TODO Auto-generated method stub
		return dao.usingIncrease(map);
	}


}