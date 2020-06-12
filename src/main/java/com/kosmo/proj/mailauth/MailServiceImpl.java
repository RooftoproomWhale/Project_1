package com.kosmo.proj.mailauth;

import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {

	@Override
	public void regist(MemberVO user) throws Exception {
		/*
		 * System.out.println("서비스레지스");
		 *
		 * String encPassword = passwordEncoder.encode(vo.getMemberPassword());
		 * vo.setMemberPassword(encPassword); //
		 * System.out.println("암호화된 비밀번호 : "+user.getUserPassword());
		 *
		 * dao.insertUser(vo); System.out.println(vo);
		 * System.out.println("///////////////////////  찍히"); String key = new
		 * TempKey().getKey(50, false); // 인증키 생성
		 *
		 * dao.createAuthKey(vo.getMemberEmail(), key); // 인증키 db 저장 // 메일 전송
		 * MailHandler sendMail = new MailHandler(mailSender);
		 * sendMail.setSubject("FAINT  서비스 이메일 인증]"); sendMail.setText(new
		 * StringBuffer().append("<h1>메일인증</h1>")
		 * .append("<a href='http://localhost:8080/user/emailConfirm?userEmail=")
		 * .append(vo.getMemberEmail()) .append("&memberAuthKey=").append(key).
		 * append("' target='_blank'>이메일 인증 확인</a>").toString());
		 * sendMail.setFrom("sososososo@gmail.com", "서어비스센터 ");
		 *
		 * sendMail.setTo(vo.getMemberEmail()); \
		 * sendMail.send();
		 */
	}

	@Override
	public MemberVO userAuth(MemberVO user) throws Exception {
		/*
		 * MemberVO vo = new MemberVO(); System.out.println(user + "user"); vo =
		 * dao.chkAuth(user);
		 *
		 * if (vo != null) { try { System.out.println(vo + "vo"); dao.userAuth(user);
		 * dao.successAuth(vo); } catch (Exception e) { e.printStackTrace(); } } return
		 * vo;
		 */
		return null;
	}

}
