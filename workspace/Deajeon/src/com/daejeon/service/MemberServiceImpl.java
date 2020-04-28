package com.daejeon.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.daejeon.dao.MemberDAO;
import com.daejeon.dto.MemberVO;
import com.daejeon.exception.InvalidPasswordException;
import com.daejeon.exception.NotFoundIDException;
import com.daejeon.request.PageMaker;
import com.daejeon.request.SearchCriteria;


public class MemberServiceImpl implements MemberService {


	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO=memberDAO;
	}

	@Override
	public void login(String id, String pwd) throws SQLException, NotFoundIDException, InvalidPasswordException {
		
		MemberVO member = memberDAO.selectMemberById(id); 
		
		if(member == null) throw new NotFoundIDException();
		
		if(!pwd.equals(member.getPwd())) throw new InvalidPasswordException();

	}

	@Override
	public MemberVO getMember(String id) throws SQLException {
		MemberVO member = memberDAO.selectMemberById(id);
		return member;
	}

	@Override
	public void regist(MemberVO member) throws SQLException {
		memberDAO.insertMember(member);
	}

	@Override
	public void modify(MemberVO member) throws SQLException {
		memberDAO.updateMember(member);
	}

	@Override
	public void remove(String id) throws SQLException {
		memberDAO.deleteMember(id);
	}
	@Override
	public void disabledMember(String id) throws SQLException {
		memberDAO.disabledMember(id);
	}
	@Override
	public void enabledMember(String id) throws SQLException {
		memberDAO.enabledMember(id);
	}
	@Override
	public Map<String, Object> getMemberList(SearchCriteria cri) throws SQLException {
		List<MemberVO> memberList = memberDAO.selectMemberList(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberDAO.selectMemberListCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("memberList", memberList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
}
