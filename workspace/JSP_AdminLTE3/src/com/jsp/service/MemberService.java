package com.jsp.service;

import java.sql.SQLException;
import java.util.List;

import com.jsp.dto.MemberVO;
import com.jsp.exception.InvalidPasswordException;
import com.jsp.exception.NotFoundIDException;

public interface MemberService {
	
	// dao는 매퍼에서 작성한 쿼리문 이상이 필요. service에서 호출해야해.
	// 쿼리문하나에 dao를 하나씩 박는다. 1쿼리 = 1메서드(이상)
	
	// 서비스는 기능단위로 작성해야함. 1기능 = 1메서드(이상)
	// dao를 고려하지않고 고객에게 서비스 할 내용을 작성한다.
	
	
	// 로그인
	void login(String id, String pwd) throws SQLException, NotFoundIDException, InvalidPasswordException;
	
	// 회원리스트 조회
	List<MemberVO> getMemberList() throws SQLException;
	
	// 회원정보 조회
	MemberVO getMember(String id) throws SQLException;
	
	// 회원 등록
	void regist(MemberVO member) throws SQLException;
	
	// 회원 수정
	void modify(MemberVO member) throws SQLException;
	
	// 회원 삭제
	void remove(String id) throws SQLException;
	
	
	
	//void disable(String id) throws SQLException;
	
	
}
