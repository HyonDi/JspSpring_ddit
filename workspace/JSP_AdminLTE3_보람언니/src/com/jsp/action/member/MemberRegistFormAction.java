package com.jsp.action.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.action.Action;
import com.jsp.dispatcher.ViewResolver;
import com.jsp.service.MemberService;
import com.jsp.service.MemberServiceImpl;

public class MemberRegistFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = "member/regist";
		return url;
	}

}
