package com.kosmo.proj.mailauth;

public interface MailService {

	public void regist(MemberVO user) throws Exception;
	public MemberVO userAuth(MemberVO user) throws Exception;

}
